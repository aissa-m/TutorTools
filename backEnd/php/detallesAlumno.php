<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: X-Requested-With, Content-Type');
header('Content-Type: application/json');
include 'conexion.php';

session_start();
// Verificar la autenticación del usuario
if (!isset($_SESSION['loged'])) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}

$idProfe = $_SESSION["userId"];
// Asegúrate de validar y sanear el ID para prevenir inyecciones SQL
$alumnoId = isset($_GET['id']) ? (int) $_GET['id'] : 0;

// Prepara la consulta con parámetros para evitar inyecciones SQL
$consulta = $conexion->prepare('SELECT * FROM alumnos WHERE id = ? and idProfe = ?');

// Vincula el parámetro 'id' a la consulta
$consulta->bind_param('ii', $alumnoId, $idProfe);

// Ejecuta la consulta
$consulta->execute();

// Obtiene el resultado
$resultado = $consulta->get_result();

// Verifica si hay datos
if($resultado->num_rows > 0){
    // Obtiene los datos como un array asociativo
    $datos = $resultado->fetch_assoc(); // Cambiado a fetch_assoc() ya que esperamos un solo resultado
    
    // Envía los datos en formato JSON
    echo json_encode($datos);
} else {
    // Si no hay datos, envía un mensaje de error en formato JSON
    echo json_encode(['error' => 'No se encontraron datos para el ID proporcionado']);
}

// Cierra la consulta y la conexión como buena práctica
$consulta->close();
$conexion->close();
?>
