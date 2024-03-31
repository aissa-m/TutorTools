<?php
require 'conexion.php';
if(isset($_POST['id'])) {
    $id = $_POST['id'];
    // Asume conexión $conexion a la base de datos
    $sql = "DELETE FROM reservas WHERE id = ?";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("i", $id);
    if($stmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => 'No se pudo eliminar el evento.']);
    }
    $stmt->close();
} else {
    echo json_encode(['success' => false, 'message' => 'ID del evento no proporcionado.']);
}

