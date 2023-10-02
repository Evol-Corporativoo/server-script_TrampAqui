<?php

namespace model;

class Usuario {
    private $id;
    private $nome;
    private $dataNasc;
    private $cpf;
    private $telefone;
    private $email;
    private $senha;
    private $acesso;

    public function emArray(){
        return [
            'id'=>$this->id,
            'nome'=>$this->nome,
            'dataNasc'=>$this->dataNasc,
            'cpf'=>$this->cpf,
            'telefone'=>$this->telefone,
            'email'=>$this->email,
            'senha'=>$this->senha,
            'acesso'=>$this->acesso
        ];
    }


    public function getTelefone(){
        return $this->telefone;
    }

    public function setTelefone($telefone){
        $this->telefone = $telefone;
    }

    public function getCpf(){
        return $this->cpf;
    }

    public function setCpf($cpf){
        $this->cpf = $cpf;
    }

    // Getter para $id
    public function getId() {
        return $this->id;
    }

    // Setter para $id
    public function setId($id) {
        $this->id = $id;
    }

    // Getter para $nome
    public function getNome() {
        return $this->nome;
    }

    // Setter para $nome
    public function setNome($nome) {
        $this->nome = $nome;
    }

    // Getter para $dataNasc
    public function getDataNasc() {
        return $this->dataNasc;
    }

    // Setter para $dataNasc
    public function setDataNasc($dataNasc) {
        $this->dataNasc = $dataNasc;
    }

    // Getter para $email
    public function getEmail() {
        return $this->email;
    }

    // Setter para $email
    public function setEmail($email) {
        $this->email = $email;
    }

    // Getter para $senha
    public function getSenha() {
        return $this->senha;
    }

    // Setter para $senha
    public function setSenha($senha) {
        $this->senha = $senha;
    }

    // Getter para $acesso
    public function getAcesso() {
        return $this->acesso;
    }

    // Setter para $acesso
    public function setAcesso($acesso) {
        $this->acesso = $acesso;
    }
}

?>