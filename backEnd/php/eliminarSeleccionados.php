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
    $errores = [];

    foreach ($pagos as $pago) {
        $id = intval($pago['id']);
        $montoEliminar = floatval($pago['monto']);

        // Obtener el monto actual del ingreso pendiente
        $consulta = $conexion->prepare("SELECT monto FROM pagos_pendientes WHERE id = ?");
        $consulta->bind_param('i', $id);
        $consulta->execute();
        $resultado = $consulta->get_result();
        $registro = $resultado->fetch_assoc();

        if (!$registro) {
            $errores[] = "No se encontró el pago pendiente con ID $id";
            continue;
        }

        $montoActual = floatval($registro['monto']);

        if ($montoEliminar >= $montoActual) {
            // Eliminar completamente
            $eliminar = $conexion->prepare("DELETE FROM pagos_pendientes WHERE id = ?");
            $eliminar->bind_param("i", $id);
            if (!$eliminar->execute()) {
                $errores[] = "Error al eliminar el pago completo con ID $id";
            }
        } else {
            // Actualizar con monto restante
            $nuevoMonto = $montoActual - $montoEliminar;
            $actualizar = $conexion->prepare("UPDATE pagos_pendientes SET monto = ? WHERE id = ?");
            $actualizar->bind_param("di", $nuevoMonto, $id);
            if (!$actualizar->execute()) {
                $errores[] = "Error al actualizar el pago parcial con ID $id";
            }
        }
    }

    echo empty($errores) ? json_encode("Exito") : json_encode(["Errores" => $errores]);
} else {
    echo json_encode("No recibe datos válidos");
}
?>
