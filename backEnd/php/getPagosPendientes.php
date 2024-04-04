<?php
include 'conexion.php';

session_start();
// Verificar la autenticación del usuario
if (!isset($_SESSION['loged'])) {
    http_response_code(403); // Forbidden
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}

if (isset($_SESSION['userId'])) {
    $idProfe = $_SESSION['userId'];
    $consulta = $conexion->
        prepare('SELECT p.fecha, p.monto, a.nombre, p.horas, p.id
                FROM pagos_pendientes p 
                JOIN alumnos a on a.id = p.alumno_id
                WHERE p.idProfe = ?
            ;');
    $consulta->bind_param('i', $idProfe);
    $consulta->execute();
    $res = $consulta->get_result();

    $datos = [];

    if ($res->num_rows > 0) {
        $datos = $res->fetch_all(MYSQLI_ASSOC);
        $datos = array_reverse($datos);
        echo json_encode($datos);
    } else {
        echo json_encode('No hay datos');
    }
}
else{
    echo json_encode(['error'=> 'Datos inexistentes.']);
}