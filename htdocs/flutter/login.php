<?php

// Inclusão do arquivo de conexão
include_once 'conexao.php';

// Inicialização do array responsável pela resposta à API
$response = array();

// Verifique se email e senha foram enviados via POST
if(isset($_POST['Email']) && isset($_POST['Senha'])){
    $email = $_POST['Email'];
    $senha = $_POST['Senha'];

    // Consulta SQL para verificar as informações do usuário
    $consulta = $pdo->prepare("SELECT * FROM clientes WHERE email = :email AND senha = :senha");
    $consulta->bindParam(':email', $email);
    $consulta->bindParam(':senha', $senha);
    $consulta->execute();

    // Verifique se o usuário foi encontrado no banco de dados
    if($consulta->rowCount() > 0){
        // O usuário encontrado, retorna 'success'
        $response['status'] = 'success';
    } else {
        // O usuário não encontrado, retorna 'error'
        $response['status'] = 'error';
    }
} else {
    // Se 'email' e 'senha' não forem fornecidos, retorna 'error'
    $response['status'] = 'error';
    //$response['message'] = 'Email e senha são obrigatórios.';
}

// Retorna a resposta em JSON
echo json_encode($response);
?>
