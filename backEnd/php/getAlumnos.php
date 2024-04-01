<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
header('Content-Type: application/json');
include 'conexion.php';
// Inicia sesión PHP (si aún no se ha iniciado)
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Verifica si el usuario está autenticado
// Asegúrate de ajustar esta condición según tu lógica de autenticación
if (!isset($_SESSION['loged']) || $_SESSION['loged'] != true) {
    echo json_encode(['error' => 'Acceso denegado. Usuario no autenticado.']);
    exit; // Detiene la ejecución del script
}
// Prepara la consulta
$consulta = $conexion->prepare('SELECT * FROM alumnos');

// Ejecuta la consulta
$consulta->execute();

// Obtiene el resultado
$resultado = $consulta->get_result();

$datos = [];
// Verifica si hay datos
if($resultado->num_rows > 0){
    // Obtiene los datos como un array asociativo
    $datos = $resultado->fetch_all(MYSQLI_ASSOC);
    $datos = array_reverse($datos);
    // Envía los datos en formato JSON
    echo json_encode($datos);
} else {
    // Si no hay datos, envía un mensaje de error en formato JSON
    echo json_encode(['error' => 'No se encontraron datos']);
}

// Cierra la consulta y la conexión como buena práctica
$consulta->close();
$conexion->close();