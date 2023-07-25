
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inicio de Sesion</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<style>
    body {
        background-image: url("https://newsdatic.files.wordpress.com/2016/12/utez1.jpg");
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center center;
    }
    .jumbotron {
        backdrop-filter: blur(8px); /* Efecto de desenfoque */
        background-color: rgba(255, 255, 255, 0.5); /* Fondo con transparencia */
        padding: 2rem; /* Espaciado interno para evitar que el contenido se desborde */
    }
    .container {
        backdrop-filter: blur(8px); /* Efecto de desenfoque */
        background-color: rgba(255, 255, 255, 0.5); /* Fondo con transparencia */
        padding: 2rem; /* Espaciado interno para evitar que el contenido se desborde */
    }
</style>

<body >
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
                    <a class="nav-link" href="#">Inicio</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
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
            <h6>¿No tienes cuenta? <a href="registro.jsp">Registrate Aqui!</a></h6>
            <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
        </form>

    </div>
</div>

</body>
</html>
