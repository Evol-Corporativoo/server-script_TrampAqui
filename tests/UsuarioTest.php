<?php

    use PHPUnit\Framework\TestCase;
    use model\Usuario;

    class UsuarioTest extends TestCase{

        public function testCreate(){
            $u = new Usuario();
            $u->setNome('Joia');
            $this->assertEquals('Joia',$u->getNome());
        }

    }

?>