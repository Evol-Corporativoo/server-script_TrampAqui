<?php

    namespace app\dao;

    use app\model\Usuario;
    use app\model\Conexao;
    use \PDO;

    class DaoUsuario{

        public static function cadastrar(Usuario $usuario){

            $conexao = Conexao::conectar();
            $insert = 'INSERT INTO tbUsuario(nomeUsuario, cpfUsuario, emailUsuario, telefoneUsuario, dataNascUsuario, senhaUsuario)
                       VALUES (?,?,?,?,?,?)';
            $prepare = $conexao->prepare($insert);
            $prepare->bindValue(1, $usuario->getNome());
            $prepare->bindValue(2, $usuario->getCpf());
            $prepare->bindValue(5, $usuario->getDataNasc());
            $prepare->bindValue(3, $usuario->getEmail());
            $prepare->bindValue(6, $usuario->getSenha());
            $prepare->bindValue(4, $usuario->getTelefone());

            $prepare->execute();

            return true;

        }

        public static function logar(Usuario $usuario, $campo){

            $conexao = Conexao::conectar();

            if($campo == 0){
                $select = 'SELECT COUNT(idUsuario) AS contagem FROM tbUsuario
                       WHERE (emailUsuario = ?)';
                $prepare = $conexao->prepare($select);
                $prepare->bindValue(1, $usuario->getEmail());
                $data = 'SELECT * from tbUsuario WHERE emailUsuario = ?';
                $p = $conexao->prepare($data);
            } else {
                $select = 'SELECT COUNT(idUsuario) AS contagem FROM tbUsuario
                       WHERE (cpfUsuario = ?)';
                $prepare = $conexao->prepare($select);
                $prepare->bindValue(1, $usuario->getCpf());
                $data = 'SELECT * from tbUsuario WHERE cpfUsuario = ?';
                $p = $conexao->prepare($data);
            }

            $prepare->execute();

            $lista = $prepare->fetch(PDO::FETCH_ASSOC);
            $contagem = $lista['contagem'];

            if($contagem >= 1){
                $p->execute();
                $array_p = $p->fetch(PDO::FETCH_ASSOC);
                if(password_verify($usuario->getSenha(),$array_p['senhaUsuario'])){
                    return [true, $array_p];
                }
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