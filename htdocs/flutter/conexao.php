<?php 
//conexao com o banco

$banco = 'loja';
$host = 'localhost';
$usuario = 'root';
$senha = '';

try {
    $pdo = new PDO("mysql:dbname=$banco;host=$host", $usuario, $senha);
}
catch(PDOException $e) {
    echo "Erro: ".$e->getMessage();
    exit;
}
?>