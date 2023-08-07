<?php 
include_once 'conexao.php';

$idCliente = 52;
//$idCliente = $_POST['idCliente'];
  
$query = $pdo->query("SELECT * FROM clientes WHERE idCliente = '$idCliente'");
$resultado = $query->fetchAll(PDO::FETCH_ASSOC);

echo ($resultado) ? json_encode($resultado) : json_encode("Dados nao encontrados");

?>