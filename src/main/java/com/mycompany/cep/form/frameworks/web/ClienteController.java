package com.mycompany.cep.form.frameworks.web;

import com.mycompany.cep.form.frameworks.dao.CadastroClienteDao;
import com.mycompany.cep.form.frameworks.model.CadastroCliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ClienteController {

    private final CadastroClienteDao cadastroClienteDao;

    @Autowired
    public ClienteController(CadastroClienteDao cadastroClienteDao) {
        this.cadastroClienteDao = cadastroClienteDao;
    }

    @PostMapping({"/cliente.htm", "/cliente"})
    public String submit(
            @RequestParam String nome,
            @RequestParam String sobrenome,
            @RequestParam String email,
            @RequestParam String senha,
            @RequestParam String cep,
            @RequestParam String rua,
            @RequestParam String bairro,
            @RequestParam String cidade,
            @RequestParam String estado,
            @RequestParam String numero,
            @RequestParam(required = false) String complemento) {
        CadastroCliente cliente = CadastroFormMapper.toCliente(
                nome, sobrenome, email, senha, cep, rua, bairro, cidade, estado, numero, complemento);
        cadastroClienteDao.save(cliente);
        return "redirect:/clientes.htm";
    }

    @GetMapping({"/clientes.htm", "/clientes"})
    public String list(Model model) {
        model.addAttribute("clientes", cadastroClienteDao.listAll());
        return "lista-clientes";
    }
}
