<?php

    require_once('../model/Usuario.php');
    require_once('../model/Conexao.php');

    class DaoUsuario{

        public static function cadastrar($usuario){

            $conexao = Conexao::conectar();
            $insert = 'INSERT INTO tbUsuario(nomeUsuario, cpfUsuario, emailUsuario, telefoneUsuario, dataNascUsuario, senhaUsuario)
                       VALUES (?,?,?,?,?,?)';
            $prepare = $conexao->prepare($insert);
            $prepare->bindValue(1, $usuario->getNome());
            $prepare->bindValue(2, $usuario->getCpf());
            $prepare->bindValue(3, $usuario->getEmail());
            $prepare->bindValue(4, $usuario->getTelefone());
            $prepare->bindValue(5, $usuario->getDataNasc());
            $prepare->bindValue(6, password_hash($usuario->getSenha(),PASSWORD_DEFAULT));

            $prepare->execute();

            return true;

        }

        public static function logar($usuario, $campo){

            $conexao = Conexao::conectar();

            if($campo == 0){
                $select = 'SELECT COUNT(idUsuario) AS contagem FROM tbUsuario
                       WHERE (emailUsuario LIKE ? AND senhaUsuario LIKE ?)';
                $prepare = $conexao->prepare($select);
                $prepare->bindValue(1, $usuario->getEmail());
                $prepare->bindValue(2, $usuario->getSenha());
            } else {
                $select = 'SELECT COUNT(idUsuario) AS contagem FROM tbUsuario
                       WHERE (cpfUsuario LIKE ? AND senhaUsuario LIKE ?)';
                $prepare = $conexao->prepare($select);
                $prepare->bindValue(1, $usuario->getCpf());
                $prepare->bindValue(2, $usuario->getSenha());
            }

            $prepare->execute();

            $lista = $prepare->fetch(PDO::FETCH_ASSOC);
            $contagem = $lista['contagem'];

            if($contagem >= 1){
                return [true];
            } else {
                return [false];
            }

        }

        public static function buscar($usuario, $campo){

            $conexao = Conexao::conectar();
            if($campo == 0){
                $select = 'SELECT * FROM tbUsuario
                       WHERE (emailUsuario LIKE ? AND senhaUsuario LIKE ?)';
                $prepare = $conexao->prepare($select);
                $prepare->bindValue(1, $usuario->getEmail());
                $prepare->bindValue(2, $usuario->getSenha());
            } else {
                $select = 'SELECT * FROM tbUsuario
                       WHERE (cpfUsuario LIKE ? AND senhaUsuario LIKE ?)';
                $prepare = $conexao->prepare($select);
                $prepare->bindValue(1, $usuario->getCpf());
                $prepare->bindValue(2, $usuario->getSenha());
            }
            $prepare->execute();
            $lista = $prepare->fetch(PDO::FETCH_ASSOC);
            $novo = new Usuario();
            $novo->setId($lista['idUsuario']);
            $novo->setNome($lista['nomeUsuario']);
            $novo->setCpf($lista['cpfUsuario']);
            $novo->setTelefone($lista['telefoneUsuario']);
            $novo->setDataNasc($lista['dataNascUsuario']);
            $novo->setEmail($lista['emailUsuario']);
            $novo->setSenha($lista['senhaUsuario']);

            return $novo->emArray();

        }

    }

?>