<?php
include 'conexion.php';
$data = json_decode(file_get_contents('php://input'), true);
session_start();

// Verificar autenticación
if (!isset($_SESSION['loged'])) {
    http_response_code(403);
    echo json_encode(["error" => "Acceso denegado"]);
    exit;
}

if (!isset($data['nombre_alumno']) || !isset($data['importe'])) {
    echo json_encode("Datos incompletos");
    exit;
}

$nombreAlumno = $data['nombre_alumno'];
$importePago  = floatval($data['importe']);
$idProfe      = $_SESSION['userId'];

if ($importePago <= 0) {
    echo json_encode("Importe inválido");
    exit;
}

// 1. Buscar alumno por nombre e idProfe
$consultaAlumno = $conexion->prepare(
    "SELECT id FROM alumnos WHERE nombre = ? AND idProfe = ? LIMIT 1"
);
$consultaAlumno->bind_param("si", $nombreAlumno, $idProfe);
$consultaAlumno->execute();
$resAlumno = $consultaAlumno->get_result();

if ($resAlumno->num_rows === 0) {
    echo json_encode("Alumno no encontrado");
    exit;
}

$alumno = $resAlumno->fetch_assoc();
$alumnoId = intval($alumno['id']);


// 2. Traer TODOS los pagos pendientes ordenados por fecha ascendente
$consultaPend = $conexion->prepare(
    "SELECT id, monto FROM pagos_pendientes 
     WHERE alumno_id = ? AND idProfe = ?
     ORDER BY fecha ASC, id ASC"
);
$consultaPend->bind_param("ii", $alumnoId, $idProfe);
$consultaPend->execute();
$pendientes = $consultaPend->get_result();

if ($pendientes->num_rows === 0) {
    echo json_encode("No hay pagos pendientes para este alumno");
    exit;
}

// 3. Calcular total pendiente
$totalPendiente = 0;
$lista = [];
while ($row = $pendientes->fetch_assoc()) {
    $row['monto'] = floatval($row['monto']);
    $lista[] = $row;
    $totalPendiente += $row['monto'];
}

if ($importePago > $totalPendiente) {
    echo json_encode("El importe supera el total pendiente");
    exit;
}


// 4. Repartir el pago comenzando por los pendientes más antiguos
$restante = $importePago;

// Hacemos BEGIN manual porque mysqli no hace autocommit OFF automáticamente
$conexion->begin_transaction();

try {

    foreach ($lista as $p) {
        if ($restante <= 0) break;

        $idPend  = intval($p['id']);
        $monto   = $p['monto'];

        if ($restante >= $monto) {
            // Pago completo → eliminar pendiente
            $restante -= $monto;

            $del = $conexion->prepare("DELETE FROM pagos_pendientes WHERE id = ?");
            $del->bind_param("i", $idPend);
            $del->execute();

        } else {
            // Pago parcial → actualizar monto
            $nuevoMonto = $monto - $restante;
            $restante = 0;

            $upd = $conexion->prepare("UPDATE pagos_pendientes SET monto = ? WHERE id = ?");
            $upd->bind_param("di", $nuevoMonto, $idPend);
            $upd->execute();
        }
    }

    // 5. Insertar pago total en ingresos
    // tu BD usa monto INT → se redondea
    $montoEntero = (int) round($importePago);

    $fechaHoy = date('Y-m-d');

    $insertIng = $conexion->prepare(
        "INSERT INTO ingresos (alumno_id, monto, fecha, idProfe) 
         VALUES (?, ?, ?, ?)"
    );
    $insertIng->bind_param("iisi", $alumnoId, $montoEntero, $fechaHoy, $idProfe);
    $insertIng->execute();

    // All OK → commit
    $conexion->commit();

    echo json_encode("Exito");

} catch (Exception $e) {
    $conexion->rollback();
    echo json_encode("Error: " . $e->getMessage());
}
