<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.example.definitivanacho2.controller.UsuarioServlet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Sistema Registro Personal UTEZ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Enlace a la hoja de estilos de Bootstrap -->
    <link rel="shortcut icon" href="assets/img/DALL·E.ico" />
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
    <a class="navbar-brand" href="#"><img src="assets/img/DALL·E.png" width="40" height="40">  SRP UTEZ</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="iniciosesion.jsp">Iniciar Sesion</a>
            </li>
        </ul>
    </div>
</nav>

<style>
    .jumbotron {
        backdrop-filter: blur(8px); /* Efecto de desenfoque */
        background-color: rgba(255, 255, 255, 0.5); /* Fondo con transparencia */
        padding: 2rem; /* Espaciado interno para evitar que el contenido se desborde */
    }

    .container {
        display: flex;
        justify-content: center;
        margin-top: 4rem; /* Margen superior de 4 unidades */
        backdrop-filter: blur(8px); /* Efecto de desenfoque */
        background-color: rgba(255, 255, 255, 0.5); /* Fondo con transparencia */
        padding: 1rem; /* Espaciado interno para evitar que el contenido se desborde */
    }

    #hidden-form {
        display: none;
        position: absolute;
        right: 0;
        border-bottom: 1px solid #dee2e6;
    }

    #hidden-form form {
        max-width: 500px;
        margin: auto;
    }

    #hidden-form label, #hidden-form input {
        display: block;
        margin: 5px 0;
    }

    /* Animación para el formulario */
    @keyframes slideInFromRight {
        0% {
            transform: translateX(100%);
        }
        100% {
            transform: translateX(0);
        }
    }

    .slide-in {
        animation: 0.5s ease-out 0s 1 slideInFromRight;
    }
    body, html {
        margin: 0;
        padding: 0;
        height: 100vh;
        width: 100vw;
        overflow: hidden;
    }

    .container {
        max-height: 100vh;
    }

</style>

<body background="https://quo.mx/wp-content/uploads/2023/03/ciberseguridad-en-mexico-1.png">
<!-- Barra de navegación -->
<div class="container d-flex justify-content-center mt-4">
    <div class="jumbotron" style="text-align: center">
        <h1 class="display-4">Sistema Registro Personal UTEZ</h1>
        <p class="lead">Bienvenido al SRP: Sistema Registro Personal UTEZ. Este sistema permite a los empleados de la Universidad Tecnológica Emiliano Zapata del Estado de Morelos (UTEZ) registrar sus entradas y salidas y consultar sus registros personales de asistencia.</p>
        <hr class="my-4">

        <div id="form-container" style="display: flex; text-align: center">
            <a href="#"><img src="assets/img/fingerprint.png" id="show-form" style="height:100px; width:100px; position: relative; left: 400%;"></a>
            <div class="form-group" id="hidden-form" style="display: none; position: relative; left: 40%;" >

                <form action="entrada-servlet" method="post" style="font-family: Verdana">
                    <label for="id">ID:</label>
                    <input type="number" name="idPersonal" id="idPersonal" required>
                    <label for="clave">Clave:</label>
                    <input type="password" id="contrasena" name="contrasena" placeholder="Ingresa tu clave" required>
                    <input type="submit" class="btn btn-outline-dark" value="Entrar" style="position: relative; left: 33%;">
                </form>
            </div>
        </div>

    </div>
    </div>


    <!-- Aquí va el código jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#show-form').click(function(e) {
            e.preventDefault();
            $('#hidden-form').slideToggle('fast');
        });
    });
</script>

</div>
<!-- Scripts de Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
