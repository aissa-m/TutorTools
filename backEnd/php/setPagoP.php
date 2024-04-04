<?php 
include 'conexion.php';
session_start();
// Verificar la autenticación del usuario
if (!isset($_SESSION['loged'])) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}

if ($_SERVER['REQUEST_METHOD']==='POST' && isset($_SESSION['userId'])) {
    $alumno_id=$_POST['alumno_id'];
    $monto = $_POST['monto'];
    $fecha = $_POST['fecha'];
    $horas = $_POST['horas'];
    $idProfe = $_SESSION['userId'];

    $consulta = $conexion->prepare('INSERT INTO pagos_pendientes(fecha, horas, monto, alumno_id, idProfe) VALUES (?,?,?,?,?)');
    $consulta->bind_param('sddii', $fecha, $horas, $monto, $alumno_id, $idProfe);
    if($consulta->execute()){
       echo json_encode('Exito'); 
    }
    else{
        echo json_encode('Error'); 
    }


}
else{
    echo json_encode('No recibe datos'); 
}