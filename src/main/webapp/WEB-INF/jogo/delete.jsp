<%@ page contentType = "text/html; charset=UTF-8" language = "java" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jogo Delete</title>
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
        <h1>Deletar Jogo</h1>

        <a href="/jogo/list">Jogo List</a>

        <form action="/jogo/delete" method="post">
            <input type="hidden" name="id" value="${jogo.id}">
            <label for="titulo" class="form-label">Titulo</label>
            <input type="text" name="titulo" value="${jogo.titulo}" class="form-control mb-3" readonly>

            <button type="submit" class="btn btn-danger">Deletar</button>
        </form>
    </section>
</body>
</html>