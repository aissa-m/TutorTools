<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

// Asegúrate de que incluyes tu archivo de conexión
include('conexion.php');

// Obtén el idProfe del query string
$idProfe = isset($_GET['idProfe']) ? mysqli_real_escape_string($conexion, $_GET['idProfe']) : '';

// Modifica tu consulta SQL para filtrar por idProfe
$query = "SELECT * FROM reservas WHERE idProfe = '{$idProfe}'";

$result = mysqli_query($conexion, $query);

$events = [];
while ($row = mysqli_fetch_assoc($result)) {
    $events[] = [
        'id' => $row['id'],
        'title' => $row['titulo'],
        'start' => $row['inicio'],
        'end' => $row['fin'],
        'color' => $row['color'] ?? null, // Color de fondo (opcional)
        'textColor' => $row['textColor'], // Color del texto
        'description' => $row['descripcion'], // Descripción (opcional)
        // Agrega aquí más propiedades si son necesarias
    ];
}

echo json_encode($events);

