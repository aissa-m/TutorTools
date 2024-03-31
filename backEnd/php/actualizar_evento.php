<?php
require 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $titulo = $_POST['titulo'];
    $descripcion = $_POST['descripcion'];
    $inicio = $_POST['inicio'];
    $fin = $_POST['fin'];
    $color = $_POST['color'];
    $textColor = $_POST['textColor'];

    $query = "UPDATE reservas SET titulo = ?, descripcion = ?, inicio = ?, fin = ?, color = ?, textColor = ? WHERE id = ?";
    $stmt = $conexion->prepare($query);
    $stmt->bind_param("ssssssi", $titulo, $descripcion, $inicio, $fin, $color, $textColor, $id);

    if ($stmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Error al editar el evento.']);
    }

    $stmt->close();
    $conexion->close();
}
