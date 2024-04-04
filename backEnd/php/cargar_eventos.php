<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
session_start();
// Verificar la autenticación del usuario
if (!isset($_SESSION['loged'])) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}
// Asegúrate de que incluyes tu archivo de conexión
include ('conexion.php');

// Obtén el idProfe del query string
// $idProfe = isset($_GET['idProfe']) ? mysqli_real_escape_string($conexion, $_GET['idProfe']) : '';
$idProfe = $_SESSION['userId'];

if ($idProfe) {
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
}
else{
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}
