<?php
include_once 'conexao.php';

$dados = array();

$query = $pdo->query("SELECT * FROM clientes");
$resultado = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($resultado); $i++) {
    foreach ($resultado[$i] as $key => $value) {
        $dados = $resultado;
    }
}

echo ($resultado) ? json_encode($dados) : json_encode("Dados não encontrados")

?>