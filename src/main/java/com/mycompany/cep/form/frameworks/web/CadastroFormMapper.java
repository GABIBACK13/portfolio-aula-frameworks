package com.mycompany.cep.form.frameworks.web;

import com.mycompany.cep.form.frameworks.model.CadastroCliente;
import com.mycompany.cep.form.frameworks.model.CadastroUsuario;
import com.mycompany.cep.form.frameworks.model.DadosCadastro;

final class CadastroFormMapper {

    private CadastroFormMapper() {
    }

    static void apply(
            DadosCadastro target,
            String nome,
            String sobrenome,
            String email,
            String senha,
            String cep,
            String rua,
            String bairro,
            String cidade,
            String estado,
            String numero,
            String complemento) {
        target.setNome(nome);
        target.setSobrenome(sobrenome);
        target.setEmail(email);
        target.setSenha(senha);
        target.setCep(cep);
        target.setRua(rua);
        target.setBairro(bairro);
        target.setCidade(cidade);
        target.setEstado(estado);
        target.setNumero(numero);
        target.setComplemento(complemento);
    }

    static CadastroUsuario toUsuario(
            String nome,
            String sobrenome,
            String email,
            String senha,
            String cep,
            String rua,
            String bairro,
            String cidade,
            String estado,
            String numero,
            String complemento) {
        CadastroUsuario usuario = new CadastroUsuario();
        apply(usuario, nome, sobrenome, email, senha, cep, rua, bairro, cidade, estado, numero, complemento);
        return usuario;
    }

    static CadastroCliente toCliente(
            String nome,
            String sobrenome,
            String email,
            String senha,
            String cep,
            String rua,
            String bairro,
            String cidade,
            String estado,
            String numero,
            String complemento) {
        CadastroCliente cliente = new CadastroCliente();
        apply(cliente, nome, sobrenome, email, senha, cep, rua, bairro, cidade, estado, numero, complemento);
        return cliente;
    }
}
