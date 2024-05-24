
<?php
include 'conexion.php';
$data = json_decode(file_get_contents('php://input'), true);
session_start();

// Verificar la autenticación del usuario
if (!isset($_SESSION['loged'])) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}

if (isset($data['ids']) && isset($_SESSION['userId'])) {
    $ids = $data['ids'];
    $idProfe = $_SESSION['userId'];
    $errores = [];

    foreach ($ids as $id) {
        // Selecciona el pago pendiente para obtener los detalles
        $consulta = $conexion->prepare('SELECT * FROM pagos_pendientes WHERE id = ?');
        $consulta->bind_param('i', $id);
        $consulta->execute();
        $resultado = $consulta->get_result();

        if ($resultado->num_rows > 0) {
            $pago = $resultado->fetch_assoc();
            $fechaActual = date('Y-m-d');

            // Inserta los detalles en la tabla de ingresos
            $insertar = $conexion->prepare('INSERT INTO ingresos (alumno_id, monto, fecha, idProfe) VALUES (?, ?, ?, ?)');
            $insertar->bind_param('idsi', $pago['alumno_id'], $pago['monto'], $pago['fecha'], $idProfe);

            if ($insertar->execute()) {
                // Si el ingreso se registra con éxito, elimina el pago pendiente
                $eliminar = $conexion->prepare('DELETE FROM pagos_pendientes WHERE id = ?');
                $eliminar->bind_param('i', $id);

                if (!$eliminar->execute()) {
                    $errores[] = "Error al eliminar el pago pendiente con ID $id";
                }
            } else {
                $errores[] = "Error al registrar el ingreso para el pago con ID $id";
            }
        } else {
            $errores[] = "Pago pendiente no encontrado con ID $id";
        }
    }

    if (empty($errores)) {
        echo json_encode('Exito');
    } else {
        echo json_encode(['Errores' => $errores]);
    }
} else {
    echo json_encode('No recibe datos válidos');
}
?>
