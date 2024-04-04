<?php
include 'conexion.php';
session_start();
// Verificar la autenticación del usuario
if (!isset($_SESSION['loged'])) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}
if (isset($_SESSION['userId'])) {
    $id = $_SESSION['userId'];

    $consulta = $conexion->prepare('SELECT * FROM usuarios WHERE id = ?');
    $consulta->bind_param('i', $id);
    $consulta->execute();
    $datos = [];
    if ($consulta->execute()) {
        $res = $consulta->get_result();

        if ($res->num_rows > 0) {
            while ($fila = $res->fetch_assoc()) {
                $datos[] =$fila;
            }
        }
    }
    echo json_encode($datos);
} else {
    echo json_encode(['error' => 'No se ha recibido el id']);
}

