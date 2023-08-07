<?php 
include_once 'conexao.php';

$idCliente = $_POST['idCliente'];

$query = $pdo->query("DELETE FROM clientes WHERE idCliente = '$idCliente'");

?>