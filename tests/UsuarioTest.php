<?php

    use PHPUnit\Framework\TestCase;
    use app\model\Usuario;
    use app\dao\DaoUsuario;

    class UsuarioTest extends TestCase{

        public function testLogin(){
            $u = new Usuario();
            $u->setEmail('gujoia10@gmail.com');
            $u->setSenha('12345678');
            $dados = DaoUsuario::buscar($u,0);
            $this->assertEquals('Gustavo de Souza Costa Joia',$dados['nome']);
        }

        public function testSignin(){
            $u = new Usuario();
            $data = ['Gugu','48059265890','joia@gmail.com','1234','12345678','30/05/2005'];
            $u->setNome($data[0]);
            $u->setCpf($data[1]);
            $u->setDataNasc($data[5]);
            $u->setEmail($data[2]);
            $u->setSenha($data[3]);
            $u->setTelefone($data[4]);
            $registrou = DaoUsuario::cadastrar($u);
            $this->assertTrue($registrou);
            
        }

    }

?>