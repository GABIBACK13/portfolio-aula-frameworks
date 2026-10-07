<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Atividades práticas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/css/plain.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-white mb-4">
            <div class="container">
                <span class="navbar-brand mb-0 h1">Frameworks — CEP</span>
                <div class="navbar-nav">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/index.htm">Menu</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/atividade2/index.html">Atividade 2</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/cadastro.htm">Atividade 3</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/atividade4/index.html">Atividade 4</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/cadastros.htm">Lista A3</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/clientes.htm">Lista A4</a>
                </div>
            </div>
        </nav>
        <main class="container">
            <h1 class="page-title">Menu das atividades práticas</h1>
            <p class="text-muted mb-4">Selecione uma atividade para abrir o formulário correspondente.</p>
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="h5 card-title">Atividade 2</h2>
                            <p class="card-text">Cadastro de endereço com HTML5, CSS3 e JavaScript consumindo a API ViaCEP.</p>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/atividade2/index.html">Abrir</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="h5 card-title">Atividade 3</h2>
                            <p class="card-text">Formulário de cadastro com Spring Web MVC e Bootstrap 5.</p>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/cadastro.htm">Abrir</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="h5 card-title">Atividade 4</h2>
                            <p class="card-text">Cadastro de cliente com validação jQuery e preenchimento por CEP.</p>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/atividade4/index.html">Abrir</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
