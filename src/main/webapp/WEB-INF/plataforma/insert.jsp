<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Plataforma Insert</title>
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
        <h1>Nova Plataforma</h1>

        <a href="/plataforma/list">Plataforma List</a>

        <form action="/plataforma/insert" method="post">
            <label for="descricao" class="form-label">Descrição</label>
            <input type="text" name="descricao" class="form-control mb-3">
            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </section>
</body>
</html>