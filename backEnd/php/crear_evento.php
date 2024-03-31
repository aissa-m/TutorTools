<?php
// Incorporar el archivo de conexión a la base de datos.
include 'conexion.php';

// Configuración de CORS para permitir llamadas desde cualquier origen
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

// Recoger datos del POST
$titulo = $_POST['titulo'] ?? '';
$descripcion = $_POST['descripcion'] ?? '';
$inicio = $_POST['inicio'] ?? '';
$fin = $_POST['fin'] ?? '';
$color = $_POST['color'] ?? '';
$textColor = $_POST['textColor'] ?? '';
$idProfe = $_POST['idProfe'] ?? '';

// Preparar y ejecutar la consulta SQL para insertar el nuevo evento
$sql = "INSERT INTO reservas (titulo, descripcion, inicio, fin, color, textColor, idProfe) VALUES (?, ?, ?, ?, ?, ?, ?)";

// Preparar la declaración
if($stmt = $conexion->prepare($sql)) {
    // Vincular parámetros
    $stmt->bind_param("ssssssi", $titulo, $descripcion, $inicio, $fin, $color, $textColor,$idProfe);
    
    // Ejecutar la declaración
    if($stmt->execute()) {
        // Éxito en la inserción
        echo json_encode(['success' => true, 'message' => 'Evento creado con éxito.']);
    } else {
        // Error en la inserción
        echo json_encode(['success' => false, 'message' => 'Error al crear el evento: ' . $stmt->error]);
    }
    
    // Cerrar la declaración
    $stmt->close();
} else {
    // Error en la preparación de la declaración
    echo json_encode(['success' => false, 'message' => 'Error al preparar la declaración: ' . $conexion->error]);
}

// Cerrar la conexión
$conexion->close();

