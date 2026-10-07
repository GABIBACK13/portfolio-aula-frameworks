# Documentação — cep-form-frameworks

Projeto WAR Maven (JDK 17, Tomcat 8.5, Spring MVC 5.3, Hibernate 5.6, SQLite) que reúne as atividades práticas da disciplina em um único deploy, com context path `/cep-form-frameworks`.

## Persistência (Spring MVC + Hibernate)

### Objetivo

Deixar explícita a arquitetura MVC nas atividades 3 e 4: o **Controller** recebe o POST, o **DAO** persiste via **Hibernate**, e uma **JSP** lista os registros após o cadastro (padrão **POST → redirect → GET**).

### Banco de dados

- **Arquivo:** `~/cep-form-frameworks/cadastros.sqlite` (criado na primeira subida da aplicação). As tabelas são criadas com `CREATE TABLE IF NOT EXISTS` ao iniciar o `DataSource`.
- Se apagar o `.sqlite`, reinicie o Tomcat (Run no NetBeans) para o Spring subir de novo e recriar as tabelas.
- **Tabelas separadas:**
  - `cadastro_usuario` — formulário da **Atividade 3** (`cadastro.htm`).
  - `cadastro_cliente` — formulário da **Atividade 4** (`cliente.htm`).

### Camadas Java

| Camada | Pacote / classe | Função |
|--------|-----------------|--------|
| Config | `config.HibernateConfig` | `DataSource` SQLite, `SessionFactory`, `HibernateTransactionManager` |
| Dialeto | `config.SQLiteDialect` | Mapeamento de tipos e `last_insert_rowid()` para IDs |
| Modelo | `model.DadosCadastro` | `@MappedSuperclass` com campos do formulário |
| Entidade A3 | `model.CadastroUsuario` | `@Entity` → tabela `cadastro_usuario` |
| Entidade A4 | `model.CadastroCliente` | `@Entity` → tabela `cadastro_cliente` |
| DAO | `dao.CadastroUsuarioDao`, `dao.CadastroClienteDao` | `save()` e `listAll()` com `@Transactional` |
| Controller | `web.CadastroController` | GET/POST `cadastro.htm`, GET `cadastros.htm` |
| Controller | `web.ClienteController` | POST `cliente.htm`, GET `clientes.htm` |
| Menu | `AppController` | GET `index.htm` → `menu.jsp` |

`dispatcher-servlet.xml` inclui `<tx:annotation-driven/>` para transações nos DAOs.

### Fluxos após cadastrar

**Atividade 3**

1. `GET /cadastro.htm` → `cadastro.jsp`
2. `POST /cadastro.htm` → `CadastroController` → `CadastroUsuarioDao.save()` → `redirect:/cadastros.htm`
3. `GET /cadastros.htm` → `lista-usuarios.jsp` (tabela sem coluna senha)

**Atividade 4**

1. `atividade4/index.html` — validação jQuery no cliente
2. Se válido, `POST /cliente.htm` → `ClienteController` → `CadastroClienteDao.save()` → `redirect:/clientes.htm`
3. `GET /clientes.htm` → `lista-clientes.jsp`

A **Atividade 2** não grava no banco (apenas ViaCEP no navegador).

### URLs úteis

| Recurso | URL |
|---------|-----|
| Menu | `/cep-form-frameworks/index.htm` |
| Formulário A3 | `/cep-form-frameworks/cadastro.htm` |
| Lista A3 | `/cep-form-frameworks/cadastros.htm` |
| Formulário A4 | `/cep-form-frameworks/atividade4/index.html` |
| Lista A4 | `/cep-form-frameworks/clientes.htm` |

### Build e execução

NetBeans: **Clean and Build** e **Run** no Tomcat configurado.

### Dependências Maven (persistência)

- `spring-orm` (mesma versão do `spring-webmvc`)
- `hibernate-core` 5.6.15.Final
- `sqlite-jdbc` (driver Xerial)

Hibernate 5 usa `javax.persistence` (compatível com Tomcat 8.5). Hibernate 6 exigiria Jakarta EE.
