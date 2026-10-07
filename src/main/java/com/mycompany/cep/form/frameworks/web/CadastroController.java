package com.mycompany.cep.form.frameworks.web;

import com.mycompany.cep.form.frameworks.dao.CadastroUsuarioDao;
import com.mycompany.cep.form.frameworks.model.CadastroUsuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CadastroController {

    private final CadastroUsuarioDao cadastroUsuarioDao;

    @Autowired
    public CadastroController(CadastroUsuarioDao cadastroUsuarioDao) {
        this.cadastroUsuarioDao = cadastroUsuarioDao;
    }

    @GetMapping({"/cadastro.htm", "/cadastro"})
    public String form() {
        return "cadastro";
    }

    @PostMapping({"/cadastro.htm", "/cadastro"})
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
        CadastroUsuario usuario = CadastroFormMapper.toUsuario(
                nome, sobrenome, email, senha, cep, rua, bairro, cidade, estado, numero, complemento);
        cadastroUsuarioDao.save(usuario);
        return "redirect:/cadastros.htm";
    }

    @GetMapping({"/cadastros.htm", "/cadastros"})
    public String list(Model model) {
        model.addAttribute("cadastros", cadastroUsuarioDao.listAll());
        return "lista-usuarios";
    }
}
