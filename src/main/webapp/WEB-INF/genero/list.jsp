<%@ page contentType = "text/html; charset=UTF-8" language = "java"%>
<%@ taglib uri = "jakarta.tags.core" prefix = "c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Genero List</title>
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
        <h1>Lista de Gêneros</h1>
        
        <a href="/genero/insert">Gênero Insert</a>
        
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Ações</th>
            </tr>
            <c:forEach var="genero" items="${generos}">
                <tr>
                    <td>${genero.id}</td>
                    <td>${genero.nome}</td>
                    <td>
                        <a href="/genero/update/${genero.id}" class="btn btn-primary">Editar</a>
                        <a href="/genero/delete/${genero.id}" class="btn btn-danger">Remover</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </section>
</body>
</html>
