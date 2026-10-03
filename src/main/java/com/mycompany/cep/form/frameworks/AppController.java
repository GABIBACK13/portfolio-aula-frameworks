package com.mycompany.cep.form.frameworks;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AppController {

    @GetMapping({"/index.htm", "/index"})
    public String index() {
        return "menu";
    }

    @GetMapping({"/cadastro.htm", "/cadastro"})
    public String cadastroForm() {
        return "cadastro";
    }

    @PostMapping({"/cadastro.htm", "/cadastro"})
    public String cadastroSubmit(
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
            @RequestParam(required = false) String complemento,
            Model model) {
        model.addAttribute("mensagem", "Cadastro recebido com sucesso para " + nome + " " + sobrenome + ".");
        return "cadastro";
    }
}
