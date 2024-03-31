<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
header('Content-Type: application/json');
// Incluir conexión a la base de datos
include('conexion.php');

$query = "SELECT * FROM reservas";
$result = mysqli_query($conexion, $query);
$events = [];
while($row = mysqli_fetch_assoc($result)) {
    $events[] = [
        'id' => $row['id'],
        'title' => $row['titulo'],
        'start' => $row['inicio'],
        'end' => $row['fin'],
        'color' => $row['color'] ?? null, // Color de fondo (opcional)
        'textColor' => $row['textColor'], // Color del texto
        'description' => $row['descripcion'] // Descripción (opcional)
    ];
}
echo json_encode($events);
