<?php
include 'conexion.php';
session_start();
$data = json_decode(file_get_contents('php://input'), true);
if (!isset($_SESSION['loged'])) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}

if (isset($_SESSION['userId'])) {

    $idProfe = $_SESSION['userId'];
    $consulta = $conexion->prepare('SELECT i.fecha, i.monto, a.nombre, i.id
                FROM ingresos i 
                JOIN alumnos a on a.id = i.alumno_id
                WHERE i.idProfe = ?
                ORDER BY i.fecha ASC
            ');
    $consulta->bind_param('i', $idProfe);
    $consulta->execute();
    $res = $consulta->get_result();

    $datos = [];

    if ($res->num_rows > 0) {
        $datos = $res->fetch_all(MYSQLI_ASSOC);
        $datos = array_reverse($datos);
        echo json_encode($datos);
    } else {
        echo json_encode('No hay datos');
    }
}