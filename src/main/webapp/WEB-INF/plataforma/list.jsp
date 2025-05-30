<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plataforma List</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <ul class="navbar-nav">
                <li class="nav-item me-3">
                    <a class="nav-link active" href="/modo/list">Modos de Jogo</a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link active" href="/genero/list">Gêneros de Jogo</a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link active" aria-current="page" href="/plataforma/list">Plataformas de Jogo</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/jogo/list">Jogos</a>
                </li>
            </ul>
        </div>
    </nav>

    <section class="mx-3">
        <h1>Lista de Plataformas</h1>

        <a href="/plataforma/insert">Plataforma Insert</a>

        <table class="table">
            <tr>
                <th>ID</th>
                <th>Descrição</th>
                <th>Ações</th>
            </tr>
            <c:forEach var="plataforma" items="${plataformas}">
                <tr>
                    <td>${plataforma.id}</td>
                    <td>${plataforma.descricao}</td>
                    <td>
                        <a href="/plataforma/update/${plataforma.id}" class="btn btn-primary">Editar</a>
                        <a href="/plataforma/delete/${plataforma.id}" class="btn btn-danger">Remover</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </section>
</body>
</html>