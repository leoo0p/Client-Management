<?php
include_once 'conexao.php';

$Nome = $_POST['Nome'];
$Email = $_POST['Email'];
$Telefone = $_POST['Telefone']; 

$query = $pdo->query("INSERT INTO clientes (Nome, Email, Telefone, Permissao) VALUES ('$Nome', '$Email', '$Telefone', 'Cliente')");

?>