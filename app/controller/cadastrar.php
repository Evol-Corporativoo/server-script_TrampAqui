<?php

    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: Content-Type");

    use app\model\Usuario;
    use app\dao\DaoUsuario;

    $json = file_get_contents('php://input');
    $data = json_decode($json);
    
    $usuario = new Usuario();
    $usuario->setNome($data[0]);
    $usuario->setCpf($data[1]);
    $usuario->setDataNasc($data[5]);
    $usuario->setEmail($data[2]);
    $usuario->setSenha($data[3]);
    $usuario->setTelefone($data[4]);

    $cadastrou = DaoUsuario::cadastrar($usuario);
    echo json_encode($cadastrou);

?>