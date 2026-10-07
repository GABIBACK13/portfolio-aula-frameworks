<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulário de Cadastro</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/css/plain.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-white mb-4">
            <div class="container">
                <span class="navbar-brand mb-0 h1">Frameworks — CEP</span>
                <div class="navbar-nav">
                    <a class="nav-link" href="${pageContext.request.contextPath}/index.htm">Menu</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/atividade2/index.html">Atividade 2</a>
                    <a class="nav-link active" href="${pageContext.request.contextPath}/cadastro.htm">Atividade 3</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/atividade4/index.html">Atividade 4</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/cadastros.htm">Lista A3</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/clientes.htm">Lista A4</a>
                </div>
            </div>
        </nav>
        <main class="container">
            <h1 class="page-title">Formulário de Cadastro</h1>
            <p class="text-muted">Ao cadastrar, os dados são salvos no SQLite e você é redirecionado para a listagem.</p>
            <p id="cep-msg" class="text-danger mb-3" hidden></p>
            <form class="row g-3" method="post" action="${pageContext.request.contextPath}/cadastro.htm">
                <div class="col-md-6">
                    <label for="nome" class="form-label">Nome</label>
                    <input type="text" class="form-control" id="nome" name="nome" required>
                </div>
                <div class="col-md-6">
                    <label for="sobrenome" class="form-label">Sobrenome</label>
                    <input type="text" class="form-control" id="sobrenome" name="sobrenome" required>
                </div>
                <div class="col-md-6">
                    <label for="email" class="form-label">E-mail</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="col-md-6">
                    <label for="senha" class="form-label">Senha</label>
                    <input type="password" class="form-control" id="senha" name="senha" required>
                </div>
                <div class="col-12"><hr class="my-2"></div>
                <div class="col-md-4">
                    <label for="cep" class="form-label">CEP</label>
                    <input type="text" class="form-control" id="cep" name="cep" maxlength="9" required>
                </div>
                <div class="col-md-8">
                    <label for="rua" class="form-label">Rua</label>
                    <input type="text" class="form-control" id="rua" name="rua" required>
                </div>
                <div class="col-md-4">
                    <label for="bairro" class="form-label">Bairro</label>
                    <input type="text" class="form-control" id="bairro" name="bairro" required>
                </div>
                <div class="col-md-4">
                    <label for="cidade" class="form-label">Cidade</label>
                    <input type="text" class="form-control" id="cidade" name="cidade" required>
                </div>
                <div class="col-md-4">
                    <label for="estado" class="form-label">Estado</label>
                    <input type="text" class="form-control" id="estado" name="estado" maxlength="2" required>
                </div>
                <div class="col-md-4">
                    <label for="numero" class="form-label">Número</label>
                    <input type="text" class="form-control" id="numero" name="numero" required>
                </div>
                <div class="col-md-8">
                    <label for="complemento" class="form-label">Complemento</label>
                    <input type="text" class="form-control" id="complemento" name="complemento">
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Cadastrar</button>
                </div>
            </form>
        </main>
        <script src="${pageContext.request.contextPath}/js/viacep.js"></script>
    </body>
</html>
