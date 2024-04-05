<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
session_start();
include 'conexion.php'; 
// Verificar la autenticación del usuario
if (!isset($_SESSION['loged'])) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}

if (isset($_SESSION['userId'])) {
    $idProfe = $_SESSION['userId'];
    $consulta = $conexion->prepare('SELECT * FROM alumnos WHERE idProfe = ?');
    $consulta->bind_param('i', $idProfe);

    if ($consulta->execute()) {
        $resultado = $consulta->get_result();
        $alumnos = [];

        if ($resultado->num_rows > 0) {
            while ($fila = $resultado->fetch_assoc()) {
                $alumnos[] = $fila;
            }
            echo json_encode(["success" => true, "alumnos" => $alumnos]);
        } else {
            echo json_encode(["success" => false, "message" => "No se encontraron alumnos"]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "Error al ejecutar la consulta"]);
    }
    $consulta->close();
} else {
    echo json_encode(["success" => false, "message" => "Datos incompletos o id inválido"]);
}
$conexion->close();
?>
