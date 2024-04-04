<?php
include 'conexion.php';
session_start();
if (!isset($_SESSION['loged'])) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}

if (isset($_SESSION['userId'])) {
    $idProfe = $_SESSION['userId'];
    $consulta = $conexion->prepare('SELECT SUM(monto) AS total FROM pagos_pendientes WHERE idProfe = ?');
    $consulta->bind_param('i', $idProfe);
    $consulta->execute();
    $res = $consulta->get_result();

    $total = 0;

    if ($fila = $res->fetch_assoc()) {
        $total = $fila['total'] === null ? 0 : $fila['total'];
        echo json_encode($total);
    }
    else{
        echo json_encode('No hay datos');
    }

}
