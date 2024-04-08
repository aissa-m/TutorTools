<?php
// Incluir el archivo de conexión a la base de datos
include 'conexion.php'; // Asegúrate de que este path sea correcto

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../vendor/autoload.php';

if (isset($_POST['email'], $_POST['nombre'], $_POST['asignatura'], $_POST['password'])) {
    $email = $_POST['email'];
    $nombre = $_POST['nombre'];
    $asignatura = $_POST['asignatura'];
    $password = $_POST['password'];

    // Hash de la contraseña
    $passwordHash = password_hash($password, PASSWORD_DEFAULT);

    // Preparar la sentencia SQL para insertar los datos
    $query = "INSERT INTO usuarios (nombre, email, asignatura, contra) VALUES (?, ?, ?, ?)";

    $stmt = $conexion->prepare($query);

    if ($stmt) {
        $stmt->bind_param("ssss", $nombre, $email, $asignatura, $passwordHash);

        if ($stmt->execute()) {
            // Aquí inicia el envío de correo
            $mail = new PHPMailer(true);

            try {
                $mail->isSMTP();
                $mail->Host = 'smtp.gmail.com';
                $mail->SMTPAuth = true;
                $mail->Username = 'issaequipoimagen@gmail.com';
                $mail->Password = 'biffulmsefcedcjk'; // Usa una contraseña de aplicación en producción
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                $mail->Port = 587;
            
                // Correo al usuario
                $mail->setFrom('issaequipoimagen@gmail.com', 'Tutor-Tools Registro');
                $mail->addAddress($email, $nombre); // Destinatario
            
                $mail->isHTML(true);
                $mail->Subject = 'Bienvenido a Tutor-Tools';
                $mail->Body = "
                <html>
                    <body style='font-family: Arial, sans-serif; background-color: #f0f0f0; padding: 20px;'>
                        <div style='max-width: 600px; margin: auto; background-color: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);'>
                            <h2 style='color: #0cad95; text-align: center;'>¡Bienvenido a Tutor-Tools, {$nombre}!</h2>
                            <div style='background-color: #f9f9f9; padding: 15px; margin-bottom: 20px; border-left: 5px solid #0cad95;'>
                                <ul style='list-style-type: none; padding: 0;'>
                                    <li>Estamos emocionados de tenerte a bordo. Gracias por registrarte en nuestra plataforma.</li>
                                    <li>Con <strong>Tutor-Tools</strong>, podrás gestionar tus clases, ingresos y mucho más de manera eficiente.</li>
                                    <li>Si tienes alguna pregunta, no dudes en <a href='mailto:issaequipoimagen@gmail.com' style='color: #0cad95; text-decoration: none; font-weight: bold;'>contactarnos</a>.</li>
                                </ul>
                            </div>
                            <p>Saludos,</p>
                            <p>El equipo de Tutor-Tools</p>
                            <p style='text-align: center;'>Revisa la <a href='https://www.tutor-tools.click/web/home.html' style='color: #0cad95; text-decoration: none; font-weight: bold;'>plataforma</a> para más detalles.</p>
                        </div>
                    </body>
                </html>
                ";
            
                $mail->send();
            
                // Resetear el objeto PHPMailer para enviar un nuevo correo
                $mail->ClearAddresses();
            
                // Correo al administrador
                $mail->addAddress('issaequipoimagen@gmail.com', 'Administrador de Tutor-Tools'); // Cambia esto por tu correo electrónico real
            
                $mail->Subject = 'Nuevo registro en Tutor-Tools';
                $mail->Body = "
                <html>
                    <body style='font-family: Arial, sans-serif; background-color: #f0f0f0; padding: 20px;'>
                        <div style='max-width: 600px; margin: auto; background-color: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);'>
                            <h2 style='color: #0cad95; text-align: center;'>Nuevo Registro en Tutor-Tools</h2>
                            <p>Se ha registrado un nuevo usuario en Tutor-Tools:</p>
                            <div style='background-color: #f9f9f9; padding: 15px; margin-bottom: 20px; border-left: 5px solid #0cad95;'>
                                <ul style='list-style-type: none; padding: 0;'>
                                    <li><strong>Nombre:</strong> {$nombre}</li>
                                    <li><strong>Email:</strong> {$email}</li>
                                    <li><strong>Asignatura:</strong> {$asignatura}</li>
                                </ul>
                            </div>
                            <p style='text-align: center;'>Revisa la <a href='https://www.tutor-tools.click/web/home.html' style='color: #0cad95; text-decoration: none; font-weight: bold;'>plataforma</a> para más detalles.</p>
                        </div>
                    </body>
                </html>
                ";
            
                $mail->send();
            
                echo json_encode(["success" => true, "message" => "Registro exitoso y correos enviados"]);
            } catch (Exception $e) {
                echo json_encode(["success" => false, "message" => "Registro exitoso, pero los correos no pudieron ser enviados. Error: " . $mail->ErrorInfo]);
            }            
        } else {
            echo json_encode(["success" => false, "message" => "Error al registrar el usuario"]);
        }

        $stmt->close();
    } else {
        echo json_encode(["success" => false, "message" => "Error en la base de datos"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Datos incompletos"]);
}

$conexion->close();

