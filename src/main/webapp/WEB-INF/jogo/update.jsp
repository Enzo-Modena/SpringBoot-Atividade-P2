<%@ page contentType = "text/html; charset=UTF-8" language = "java" %>
<%@ taglib uri = "jakarta.tags.core" prefix = "c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jogo Update</title>
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
        <h1>Atualizar Jogo</h1>

        <a href="/jogo/list">Jogo List</a>

        <form action="/jogo/update" method="post">
            <input type="hidden" name="id" value="${jogo.id}">

            <div class="mb-3">
                <label for="titulo" class="form-label">Titulo</label>
                <input type="text" name="titulo" value="${jogo.titulo}" class="form-control mb-3">
            </div>

            <div class="mb-3">
                <label for="id_modo" class="form-label">Modo</label>
                <select name="id_modo" class="form-select">
                    <c:forEach var="modo" items="${modos}">
                        <option value="${modo.id}" ${(jogo.modo.id == modo.id) ? "selected":""}>${modo.descricao}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Genero</label><br>
                <c:forEach var="genero" items="${generos}">
                    <input type="checkbox" name="id_genero" value="${genero.id}" class="form-check-input" ${(jogo.generos.contains(genero)) ? "checked":""}>
                    <label class="form-check-label">${genero.nome}</label><br>
                </c:forEach>
            </div>

            <div class="mb-3">
                <label class="form-label">Plataforma</label><br>
                <c:forEach var="plataforma" items="${plataformas}">
                    <input type="checkbox" name="id_plataforma" value="${plataforma.id}" class="form-check-input" ${(jogo.plataformas.contains(plataforma)) ? "checked":""}>
                    <label class="form-check-label">${plataforma.descricao}</label><br>
                </c:forEach>
            </div>

            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </section>
</body>
</html>