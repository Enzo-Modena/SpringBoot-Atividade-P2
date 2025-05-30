<%@ page contentType = "text/html; charset=UTF-8" language = "java"%>
<%@ taglib uri = "jakarta.tags.core" prefix = "c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jogo Insert</title>
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
        <h1>Novo Jogo</h1>

        <a href="/jogo/list">Jogo List</a>

        <form action="/jogo/insert" method="post">
            <div class="mb-3">
                <label for="titulo" class="form-label">Titulo</label>
                <input type="text" name="titulo" class="form-control mb-3">
            </div>

            <div class="mb-3">
                <label for="id_plataforma" class="form-label">Plataforma</label><br>
                <c:forEach var="plataforma" items="${plataformas}">
                    <input type="checkbox" name="id_plataforma" value="${plataforma.id}" class="form-check-input">
                    <label for="id_plataforma" class="form-check-label">${plataforma.descricao}</label><br>
                </c:forEach>
            </div>

            <div class="mb-3">
                <label for="" class="form-label">Generos</label><br>
                <c:forEach var="genero" items="${generos}">
                    <input type="checkbox" name="id_genero" value="${genero.id}" class="form-check-input">
                    <label for="id_genero" class="form-check-label">${genero.nome}</label><br>
                </c:forEach>
            </div>

            <div class="mb-3">
                <label for="id_modo" class="form-label">Modo</label>
                <select name="id_modo" class="form-select">
                    <c:forEach var="modo" items="${modos}">
                        <option value="${modo.id}">${modo.descricao}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </section>
</body>
</html>