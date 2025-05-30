<%@ page contentType = "text/html; charset=UTF-8" language = "java"%>
<%@ taglib uri = "jakarta.tags.core" prefix = "c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jogos List</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <ul class="navbar-nav">
                <li class="nav-item me-3">
                    <a class="nav-link active" aria-current="page" href="/modo/list">Modos de Jogo</a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link active" href="/genero/list">Gêneros de Jogo</a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link active" href="/plataforma/list">Plataformas de Jogo</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/jogo/list">Jogos</a>
                </li>
            </ul>
        </div>
    </nav>

    <section class="mx-3">
        <h1>Lista de Jogos</h1>

        <a href="/jogo/insert">Jogo Insert</a>

        <table class="table">
            <tr>
                <th>ID</th>
                <th>Titulo</th>
                <th>Modo</th>
                <th>Plataforma(s)</th>
                <th>Gênero(s)</th>
                <th>Ações</th>
            </tr>
            <c:forEach var="jogo" items="${jogos}">
                <tr>
                    <td>${jogo.id}</td>
                    <td>${jogo.titulo}</td>
                    <td>${jogo.modo.descricao}</td>
                    <td>
                        <c:forEach var="plataforma" items="${jogo.plataformas}">
                            ${plataforma.descricao}<c:if test="${!loop.last}">, </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach var="genero" items="${jogo.generos}">
                            ${genero.nome}<c:if test="${!loop.last}">, </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <a href="/jogo/update/${jogo.id}" class="btn btn-primary btn-sm">Editar</a>
                        <a href="/jogo/delete/${jogo.id}" class="btn btn-danger btn-sm">Remover</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </section>
</body>
</html>