# cep-form-frameworks

Projeto WAR Maven (Java 17, Tomcat 8.5, Spring MVC, Hibernate, SQLite) que reúne as quatro atividades práticas da disciplina em um único deploy. Context path: `/cep-form-frameworks`.

**Execução:** NetBeans → Clean and Build → Run (Tomcat). Build via Maven: `mvn package` (ambiente JDK 17).

---

## Atividade 1 — Tomcat e Spring Web MVC

Configuração do servidor e estrutura base da aplicação web servido pelo Spring após o deploy no Tomcat.

### Arquitetura de pastas (principal)

```
cep-form-frameworks/
├── pom.xml                          # Dependências Maven (Spring, Hibernate, SQLite, JSTL)
├── nb-configuration.xml             # Deploy Tomcat no NetBeans
├── DOCUMENTACAO.md                  # Documentação técnica detalhada
└── src/main/
    ├── java/com/mycompany/cep/form/frameworks/
    │   ├── AppController.java       # GET index.htm → menu
    │   ├── config/                  # Hibernate, dialeto SQLite, criação das tabelas
    │   ├── dao/                     # Persistência (atividades 3 e 4)
    │   ├── model/                   # Entidades JPA
    │   └── web/                     # Controllers MVC e mapeamento de formulários
    └── webapp/
        ├── index.jsp                # Welcome file → redirect
        ├── css/plain.css            # Estilo Bootstrap
        ├── js/viacep.js             # ViaCEP compartilhado (atividades 2 e 3)
        ├── META-INF/context.xml     # Context path da aplicação
        ├── atividade2/              # HTML estático — atividade 2
        ├── atividade4/              # HTML estático — atividade 3 e 4
        └── WEB-INF/
            ├── web.xml              # DispatcherServlet (*.htm), welcome file
            ├── dispatcher-servlet.xml # Scan Spring, views JSP, recursos estáticos
            ├── redirect.jsp         # Redireciona para index.htm
            └── jsp/                 # menu, cadastro, listagens
```


| Arquivo                          | Função                                                                                        |
| -------------------------------- | --------------------------------------------------------------------------------------------- |
| `web.xml`                        | Registra o `DispatcherServlet` Spring em `*.htm` e define `index.jsp` como entrada            |
| `dispatcher-servlet.xml`         | Component-scan, view resolver (`/WEB-INF/jsp/`), transações, recursos `/css` e `/js`          |
| `HibernateConfig.java`           | `DataSource` SQLite em `~/cep-form-frameworks/cadastros.sqlite`, `SessionFactory`, transações |
| `DatabaseSchemaInitializer.java` | `CREATE TABLE IF NOT EXISTS` para as tabelas de cadastro                                      |


---



## Atividade 2 — HTML5, CSS3, JavaScript e ViaCEP

**URL:** `/cep-form-frameworks/atividade2/index.html`

### Funcionalidades

- Formulário de endereço com Bootstrap 5: CEP, rua, bairro, cidade, estado, número e complemento.
- Máscara do CEP (`#####-###`) enquanto o usuário digita.
- Consulta à API [ViaCEP](https://viacep.com.br/) com `fetch` ao completar 8 dígitos; preenche rua, bairro, cidade e UF.
- Mensagens para CEP inexistente ou falha de rede.



### Validações

- Campos de endereço principal com `required` no HTML5 (CEP, rua, bairro, cidade, estado).
- Número e complemento opcionais no formulário.
- Não há envio ao servidor nem persistência.



### Arquivos

- `atividade2/index.html` — estrutura do formulário e navbar.
- `atividade2/css/style.css` — ajustes de layout.
- `js/viacep.js` — lógica ViaCEP (compartilhado com a atividade 3).

---



## Atividade 3 — Spring MVC, Bootstrap e persistência

**Formulário:** `/cep-form-frameworks/cadastro.htm`  
**Listagem:** `/cep-form-frameworks/cadastros.htm`

### Funcionalidades

- Formulário “Formulário de Cadastro” renderizado em JSP (`cadastro.jsp`) com classes Bootstrap.
- Campos: nome, sobrenome, e-mail, senha, CEP, rua, bairro, cidade, estado, número e complemento.
- Preenchimento automático do endereço via `viacep.js` (mesmo comportamento da atividade 2).
- `POST` tratado por `CadastroController`: monta `CadastroUsuario`, salva com `CadastroUsuarioDao` + Hibernate na tabela `cadastro_usuario`.
- Após cadastrar, redirecionamento para a listagem (`cadastros.htm`) com tabela de registros.



### Validações

- Campos obrigatórios no HTML (`required`), exceto complemento.
- Validação de formato do e-mail delegada ao `type="email"` do navegador no submit.
- No servidor, parâmetros obrigatórios via `@RequestParam`; complemento opcional (`required = false`).



### Camadas MVC (visíveis na entrega)


| Camada               | Exemplo                                 |
| -------------------- | --------------------------------------- |
| View                 | `cadastro.jsp`, `lista-usuarios.jsp`    |
| Controller           | `CadastroController`                    |
| Model / persistência | `CadastroUsuario`, `CadastroUsuarioDao` |


---



## Atividade 4 — jQuery, validação e persistência

**Formulário:** `/cep-form-frameworks/atividade4/index.html`  
**Listagem:** `/cep-form-frameworks/clientes.htm`

### Funcionalidades

- Formulário de cadastro de cliente com Bootstrap 5, bloco separado para endereço.
- ViaCEP em `main.js` (jQuery + `$.getJSON`) ao digitar o CEP.
- Validação em `validation.js` antes do envio; se válido, `POST` para `cliente.htm`.
- `ClienteController` persiste em `CadastroCliente` / tabela `cadastro_cliente` e redireciona para `clientes.htm`.



### Validações (JavaScript / jQuery)

- Todos os campos com `required` validados no `submit` e no `blur`.
- E-mail validado com expressão regular (`^[^\s@]+@[^\s@]+\.[^\s@]+$`).
- Feedback visual Bootstrap: `is-invalid` e `invalid-feedback`.
- Se houver erro, o envio é bloqueado (`preventDefault`); se tudo ok, o formulário segue para o Spring.
- Complemento permanece opcional (sem `required`).



### Arquivos

- `atividade4/index.html` — formulário e `action="../cliente.htm"`.
- `atividade4/js/main.js` — ViaCEP.
- `atividade4/js/validation.js` — validações.

---



## Referências

APACHE NETBEANS. Apache NetBeans — Download e documentação. Disponível em: <https://netbeans.apache.org/>. Acesso em: 02 de out. de 2026.

APACHE NETBEANS. Início rápido: aplicações web com Spring (pt-BR). Disponível em: <https://netbeans.apache.org/kb/docs/web/quickstart-webapps-spring_pt_BR.html>. Acesso em: 02 de out. de 2026.

APACHE TOMCAT. Apache Tomcat 8 — Documentação. Disponível em: <https://tomcat.apache.org/tomcat-8.5-doc/index.html>. Acesso em: 02 de out. de 2026.

APACHE TOMCAT. Apache Tomcat 8.5 — Download. Disponível em: <https://tomcat.apache.org/download-80.cgi>. Acesso em: 02 de out. de 2026.

BOOTSTRAP. Bootstrap Components — Navbar. Disponível em: <https://getbootstrap.com/docs/5.0/components/navbar/>. Acesso em: 02 de out. de 2026.

BOOTSTRAP. Bootstrap Forms. Disponível em: <https://getbootstrap.com/docs/5.0/forms/overview/>. Acesso em: 02 de out. de 2026.

BOOTSTRAP. Bootstrap Validation. Disponível em: <https://getbootstrap.com/docs/5.0/forms/validation/>. Acesso em: 02 de out. de 2026.

BOOTSTRAP. Getting started with Bootstrap. Disponível em: <https://getbootstrap.com/docs/5.0/getting-started/introduction/>. Acesso em: 02 de out. de 2026.

Documentação do projeto: [DOCUMENTACAO.md](DOCUMENTACAO.md).

JQUERY. Download jQuery 3.x. Disponível em: <https://jquery.com/download/>. Acesso em: 02 de out. de 2026.

JQUERY. jQuery API Documentation. Disponível em: <https://api.jquery.com/>. Acesso em: 02 de out. de 2026.

JQUERY. jQuery.getJSON(). Disponível em: <https://api.jquery.com/jQuery.getJSON/>. Acesso em: 02 de out. de 2026.

SPRING. Serving Web Content with Spring MVC. Disponível em: <https://spring.io/guides/gs/serving-web-content/>. Acesso em: 02 de out. de 2026.

SPRING. Spring Framework Reference — Web MVC. Disponível em: <https://docs.spring.io/spring-framework/docs/5.3.x/reference/html/web.html>. Acesso em: 02 de out. de 2026.

SPRING. Spring MVC — @Controller e mapeamento de requisições. Disponível em: <https://docs.spring.io/spring-framework/docs/5.3.x/reference/html/web.html#mvc-ann-controller>. Acesso em: 02 de out. de 2026.

VIACEP. Exemplo de consulta por CEP (JSON). Disponível em: <https://viacep.com.br/ws/01001000/json/>. Acesso em: 01 de out. de 2026.

VIACEP. Webservice de CEP. Disponível em: <https://viacep.com.br/>. Acesso em: 01 de out. de 2026.

