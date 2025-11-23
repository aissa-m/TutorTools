<?php
include 'conexion.php';

$data = json_decode(file_get_contents('php://input'), true);
session_start();

header('Content-Type: application/json');

// Verificar la autenticación del usuario
if (!isset($_SESSION['loged'])) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}

$idProfe = $_SESSION["userId"];

if ($data && $idProfe && isset($data['id']) && isset($data['tipo'])) {
    $id = (int)$data['id'];
    $tipo = $data['tipo'];
    $tabla = '';

    switch ($tipo) {
        case 'alumno':
            $tabla = 'alumnos';
            break;
        case 'ingreso':
            $tabla = 'ingresos';
            break;
        case 'pendiente':
            $tabla = 'pagos_pendientes';
            break;
    }

    if ($tabla) {
        $consulta = $conexion->prepare("DELETE FROM $tabla WHERE id = ? and idProfe = ?");
        $consulta->bind_param('ii', $id, $idProfe);
        if ($consulta->execute()) {
            if ($conexion->affected_rows > 0) {
                echo json_encode('Exito');
            } else {
                echo json_encode('No se encontró el registro a eliminar');
            }
        } else {
            echo json_encode('Error al eliminar: ' . $consulta->error);
        }
        
    } else {
        echo json_encode('Tipo de registro no válido');
    }
} else {
    echo json_encode('Datos incompletos');
}
