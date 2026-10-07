<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clientes — Atividade 4</title>
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/cadastro.htm">Atividade 3</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/atividade4/index.html">Atividade 4</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/cadastros.htm">Lista A3</a>
                    <a class="nav-link active" href="${pageContext.request.contextPath}/clientes.htm">Lista A4</a>
                </div>
            </div>
        </nav>
        <main class="container">
            <h1 class="page-title">Clientes gravados (Atividade 4)</h1>
            <p class="text-muted">Dados persistidos via Spring MVC + Hibernate na tabela <code>cadastro_cliente</code>.</p>
            <p>
                <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/atividade4/index.html">Novo cadastro</a>
            </p>
            <c:choose>
                <c:when test="${empty clientes}">
                    <p class="alert alert-light border">Nenhum cliente encontrado.</p>
                </c:when>
                <c:otherwise>
                    <div class="table-responsive">
                        <table class="table table-bordered table-sm">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Nome</th>
                                    <th>Sobrenome</th>
                                    <th>E-mail</th>
                                    <th>CEP</th>
                                    <th>Rua</th>
                                    <th>Bairro</th>
                                    <th>Cidade</th>
                                    <th>UF</th>
                                    <th>Nº</th>
                                    <th>Complemento</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${clientes}">
                                    <tr>
                                        <td><c:out value="${item.id}"/></td>
                                        <td><c:out value="${item.nome}"/></td>
                                        <td><c:out value="${item.sobrenome}"/></td>
                                        <td><c:out value="${item.email}"/></td>
                                        <td><c:out value="${item.cep}"/></td>
                                        <td><c:out value="${item.rua}"/></td>
                                        <td><c:out value="${item.bairro}"/></td>
                                        <td><c:out value="${item.cidade}"/></td>
                                        <td><c:out value="${item.estado}"/></td>
                                        <td><c:out value="${item.numero}"/></td>
                                        <td><c:out value="${item.complemento}"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </main>
    </body>
</html>
