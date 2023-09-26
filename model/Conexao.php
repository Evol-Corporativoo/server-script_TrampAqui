<?php

    class Conexao{

        public static function conectar(){

            $conexao = new PDO('mysql:host=localhost;dbname=bdtrampaqui;charset=utf8', 'root', '');
            //$conexao = new PDO('mysql:host=localhost;dbname=bdtrampaqui;charset=utf8', 'root', '');
            $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $conexao;
        }
    }

?>