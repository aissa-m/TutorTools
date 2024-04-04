<?php
// config.php
header('Content-Type: application/javascript');
require_once '../../vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable("c:\\Users\\Admin\\Desktop\\Casa\\Yo\\Proyectos\\Tutor-Tools\\");
$dotenv->load();

echo "const BACKEND_URL = '" . htmlspecialchars($_ENV['BACKEND_URL'], ENT_QUOTES, "UTF-8") . "';";

