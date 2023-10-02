<?php


    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: Content-Type");

    use app\dao\DaoUsuario;
    use app\model\Usuario;

    $usuario = new Usuario();
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $campo = 0;

    if(filter_var($data[0], FILTER_VALIDATE_EMAIL)){
        $usuario->setEmail($data[0]);
    } else {
        $usuario->setCpf($data[0]);
        $campo = 1;
    }
    $usuario->setSenha($data[1]);

    $novoUsuario = DaoUsuario::buscar($usuario, $campo);

    echo json_encode($novoUsuario);

?>