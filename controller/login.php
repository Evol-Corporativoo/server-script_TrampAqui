<?php

    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: Content-Type");

    require_once('../dao/DaoUsuario.php');
    require_once('../model/Usuario.php');

    $json = file_get_contents('php://input');
    $data = json_decode($json);

    $usuario = new Usuario();
    $campo = 0;

    if(filter_var($data[0], FILTER_VALIDATE_EMAIL)){
        $usuario->setEmail($data[0]);
    } else {
        $usuario->setCpf($data[0]);
        $campo = 1;
    }

    $usuario->setSenha($data[1]);

    $dados_login = DaoUsuario::logar($usuario,$campo);
    echo(json_encode($dados_login));

?>