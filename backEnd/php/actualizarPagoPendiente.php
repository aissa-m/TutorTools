<?php
include 'conexion.php';
$data = json_decode(file_get_contents('php://input'), true);
session_start();

// Verificar autenticación
if (!isset($_SESSION['loged'])) {
    http_response_code(403);
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}

if (!isset($data['id']) || !isset($data['monto'])) {
    echo json_encode("Datos incompletos");
    exit;
}

$idPendiente = intval($data['id']);
$nuevoMonto  = floatval($data['monto']);
$idProfe     = $_SESSION['userId'];

if ($idPendiente <= 0 || $nuevoMonto <= 0) {
    echo json_encode("Datos inválidos");
    exit;
}

// Actualizar solo si el pago pendiente pertenece a este profe
$actualizar = $conexion->prepare(
    "UPDATE pagos_pendientes 
     SET monto = ? 
     WHERE id = ? AND idProfe = ?"
);
$actualizar->bind_param("dii", $nuevoMonto, $idPendiente, $idProfe);

if ($actualizar->execute()) {
    if ($actualizar->affected_rows > 0) {
        echo json_encode("Exito");
    } else {
        echo json_encode("No se ha actualizado ningún registro (¿pertenece este pago a tu usuario?).");
    }
} else {
    echo json_encode("Error al actualizar el pago pendiente");
}
