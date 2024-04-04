<?php

// Habilitar CORS y definir el content type
header('Access-Control-Allow-Origin: https://www.tutor-tools.click');
header('Content-Type: application/json');

// Simulación de un mapeo de acciones a endpoints de backend
$routes = [
    'getAlumnos' => 'backEnd/php/alumnos.php',
    'login' => 'backEnd/php/login.php',
    'reg' => 'backEnd/php/register.php'
    // Agrega más rutas según sea necesario
];

$request = json_decode(file_get_contents('php://input'), true);
if (!$request) {
    http_response_code(400); // Bad Request si no hay cuerpo en la solicitud
    echo json_encode(['error' => 'Solicitud inválida']);
    exit;
}
$action = $request['action'] ?? '';
$data = $request['data'] ?? [];

if (!array_key_exists($action, $routes)) {
    http_response_code(404); // Not Found si la acción no existe
    echo json_encode(['error' => 'Acción no encontrada']);
    exit;
}
$scriptPath = $routes[$action];
include($scriptPath);

