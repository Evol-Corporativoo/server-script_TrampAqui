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

    }

?>