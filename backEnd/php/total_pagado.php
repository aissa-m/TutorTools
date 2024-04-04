<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
header('Content-Type: application/json');
include 'conexion.php';
session_start();
// Verificar la autenticación del usuario
if (!isset($_SESSION['loged'])) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}


if (isset($_GET['id']) && isset($_SESSION['userId'])) {
    // Prepara la consulta
    $id = $_GET['id'];
    $idProfe = $_SESSION['userId'];
    $consulta = $conexion->prepare('SELECT SUM(monto) as total_pagado FROM ingresos WHERE alumno_id = ? and idProfe = ?');
    $consulta->bind_param('ii', $id, $idProfe);
    // Ejecuta la consulta
    $consulta->execute();

    // Obtiene el resultado
    $resultado = $consulta->get_result();

    $datos = 0;
    // Verifica si hay datos
    if ($resultado->num_rows > 0) {
        // Obtiene los datos como un array asociativo
        $fila = $resultado->fetch_assoc();
        // Envía los datos en formato JSON
        echo json_encode($fila);
    } else {
        // Si no hay datos, envía un mensaje de error en formato JSON
        echo json_encode(['error' => 'No se encontraron datos']);
    }

}
else {
    echo json_encode('Eorrrrrrrrrror');
}
// Cierra la consulta y la conexión como buena práctica


