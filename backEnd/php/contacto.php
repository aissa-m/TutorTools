<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../vendor/autoload.php'; 

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

$mail = new PHPMailer(true);

try {
    // Recoger los datos del formulario
    $email_usuario = isset($_POST['email']) ? $_POST['email'] : '';
    $mensaje_usuario = isset($_POST['mensaje']) ? $_POST['mensaje'] : '';

    // Configuración del servidor SMTP
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'issaequipoimagen@gmail.com'; // Sustituye por tu dirección de correo de Gmail
    $mail->Password = 'zcmrhxsqebxqonyo'; // Sustituye por tu contraseña de aplicación de Gmail
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port = 587;

    // Destinatarios
    $mail->setFrom('issaequipoimagen@gmail.com', 'Tutor-Tools Contacto'); // Correo y nombre que aparecerán como "De"
    $mail->addAddress('issaequipoimagen@gmail.com', 'Admin'); // Tu dirección de correo a la que llegarán los mensajes

    // Contenido
    $mail->isHTML(true);
    $mail->Subject = 'Nuevo mensaje de contacto de Tutor-Tools';
    $mail->Body = "
    <html>
        <head>
        <style>
            body { font-family: Arial, sans-serif; }
            .container { background-color: #f2f2f2; padding: 20px; border-radius:5px;}
            h2 { color: #333; }
            .info { margin-bottom: 20px; }
            .info strong { color: #000; }
        </style>
        </head>
        <body>
        <div class='container'>
            <h2>Nuevo Mensaje de Contacto</h2>
            <div class='info'>
            <strong>Email:</strong> {$email_usuario}
            </div>
            <div class='info'>
            <strong>Mensaje:</strong>
            <p>{$mensaje_usuario}</p>
            </div>
        </div>
        </body>
    </html>";
    $mail->AltBody = "Email: {$email_usuario}\nMensaje:\n{$mensaje_usuario}";


    $mail->send();
    echo json_encode(['success' => true, 'message' => 'El mensaje ha sido enviado con éxito.']);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => "El mensaje no pudo ser enviado. Error: {$mail->ErrorInfo}"]);
}
