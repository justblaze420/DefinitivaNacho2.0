
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("atributoAEliminar");
%>
<%
    session.invalidate();
%>
<html>
<head>
    <title>Inicio de Sesion</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="shortcut icon" href="assets/img/DALL·E.ico" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet"  media="all" href="style.css">
</head>
<style>
    body{
        background: forestgreen;
        min-height: 100vh;
    }

    .jumbotron {
        backdrop-filter: blur(8px);
        background-color: rgba(255, 255, 255, 0.5);
        padding: 2rem;
    }
    .container {
        backdrop-filter: blur(8px);
        background-color: rgba(255, 255, 255, 0.5);
        padding: 2rem;
    }
</style>

<body style="max-width: 1300px; margin: 0 auto; overflow: hidden;">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
        <a class="navbar-brand" href="index.jsp"><img src="assets/img/DALL·E.png" width="40" height="40">  SRP UTEZ</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Salir</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<div class='ripple-background'>
    <div class='circle xxlarge shade1'></div>
    <div class='circle xlarge shade2'></div>
    <div class='circle large shade3'></div>
    <div class='circle mediun shade4'></div>
    <div class='circle small shade5'></div>

<div class="container mt-4">
    <div class="jumbotron">
        <h1 class="display-4">Iniciar Sesión</h1>
        <form method="post" action="usuario-servlet">
            <div class="form-group">
                <label for="usuario">Usuario:</label>
                <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingresa tu usuario" required>
            </div>
            <div class="form-group">
                <label for="contrasena">Contraseña:</label>
                <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Ingresa tu contraseña" required>
            </div>

            <button type="submit" class="btn btn-outline-primary">Iniciar Sesión</button>
        </form>

        <center><p class="mb-0"><small>Todos los derechos reservados &copy; 2023 - SRP: Sistema Registro Personal UTEZ</small></p></center>
    </div>
</div>
</div>
</body>
</html>
