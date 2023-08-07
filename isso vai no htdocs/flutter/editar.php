<?php
include_once 'conexao.php';

$idCliente = $_POST['idCliente'];
$Nome = $_POST['Nome'];
$Email = $_POST['Email'];
$Telefone = $_POST['Telefone']; 
$Permissao = $POST['Permissao'];


if(($Nome=="")||($Email=="")||($Telefone=="")||($Permissao=="")){
    if($Nome!=""){
        //update name
        $query = $pdo->query("UPDATE clientes SET Nome = '$Nome' WHERE idCliente = '$idCliente'");
    }
    if($Email!=""){
        //update email
        $query = $pdo->query("UPDATE clientes SET Email = '$Email' WHERE idCliente = '$idCliente'");
    }
    if($Telefone!=""){
        //update telefone
        $query = $pdo->query("UPDATE clientes SET Telefone = '$Telefone' WHERE idCliente = '$idCliente'");
    }
    if($Permissao!=""){
        //update permissao
        $query = $pdo->query("UPDATE clientes SET Permissao = '$Permissao' WHERE idCliente = '$idCliente'");
    }

}
else{
    $query = $pdo->query("UPDATE clientes SET nome = '$Nome', email = '$Email', telefone = '$Telefone', permissao = '$Permissao' WHERE idCliente = '$idCliente'");
}

?>