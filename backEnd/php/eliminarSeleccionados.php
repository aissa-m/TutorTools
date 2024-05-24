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
    $errores = [];

    foreach ($ids as $id) {
        // Eliminar el pago pendiente
        $eliminar = $conexion->prepare('DELETE FROM pagos_pendientes WHERE id = ?');
        $eliminar->bind_param('i', $id);

        if (!$eliminar->execute()) {
            $errores[] = "Error al eliminar el pago pendiente con ID $id";
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
