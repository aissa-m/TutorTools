<?php
include 'conexion.php';
$data = json_decode(file_get_contents('php://input'), true);
session_start();

if (!isset($_SESSION['loged'])) {
    http_response_code(403);
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}

if (isset($data['pagos']) && isset($_SESSION['userId'])) {
    $pagos = $data['pagos'];
    $idProfe = $_SESSION['userId'];
    $errores = [];

    foreach ($pagos as $pago) {
        $id = intval($pago['id']);
        $montoPagado = floatval($pago['monto']);

        // Obtener datos del pendiente
        $consulta = $conexion->prepare("SELECT * FROM pagos_pendientes WHERE id = ?");
        $consulta->bind_param('i', $id);
        $consulta->execute();
        $resultado = $consulta->get_result();

        if ($resultado->num_rows === 0) {
            $errores[] = "No se encontró el pago pendiente con ID $id";
            continue;
        }

        $pendiente = $resultado->fetch_assoc();
        $montoPendiente = floatval($pendiente['monto']);

        if ($montoPagado <= 0 || $montoPagado > $montoPendiente) {
            $errores[] = "Monto inválido para el pago con ID $id";
            continue;
        }

        // Insertar en ingresos (con fecha original del pendiente)
        $insertar = $conexion->prepare("INSERT INTO ingresos (alumno_id, monto, fecha, idProfe) VALUES (?, ?, ?, ?)");
        $insertar->bind_param("idsi", $pendiente['alumno_id'], $montoPagado, $pendiente['fecha'], $idProfe);

        if (!$insertar->execute()) {
            $errores[] = "Error al registrar el ingreso para el pago con ID $id";
            continue;
        }

        if ($montoPagado == $montoPendiente) {
            // Pago completo → eliminar pendiente
            $eliminar = $conexion->prepare("DELETE FROM pagos_pendientes WHERE id = ?");
            $eliminar->bind_param("i", $id);
            if (!$eliminar->execute()) {
                $errores[] = "Error al eliminar el pago pendiente con ID $id";
            }
        } else {
            // Pago parcial → actualizar monto restante
            $nuevoMonto = $montoPendiente - $montoPagado;
            $actualizar = $conexion->prepare("UPDATE pagos_pendientes SET monto = ? WHERE id = ?");
            $actualizar->bind_param("di", $nuevoMonto, $id);
            if (!$actualizar->execute()) {
                $errores[] = "Error al actualizar el pendiente con ID $id";
            }
        }
    }

    echo empty($errores) ? json_encode("Exito") : json_encode(["Errores" => $errores]);
} else {
    echo json_encode("No recibe datos válidos");
}
?>
