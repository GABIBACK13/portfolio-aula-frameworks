package com.mycompany.cep.form.frameworks;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AppController {

    @GetMapping({"/index.htm", "/index"})
    public String index() {
        return "menu";
    }
}
