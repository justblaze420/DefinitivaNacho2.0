<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.example.definitivanacho2.controller.UsuarioServlet" %>
<%@ page import="com.example.definitivanacho2.model.Usuario" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
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
<%
    Usuario currentUser = (Usuario) session.getAttribute("usuarioActual");  // <-- Cambiado de "currentUser" a "usuarioActual"
    boolean canRegister = false;

    if (currentUser != null) {
        canRegister = (Boolean) session.getAttribute("habilitarRegistros");  // <-- Obtiene directamente el atributo de habilitar registros de la sesión
    }
%>
<div class="modal fade" id="confirmShutdown" tabindex="-1" aria-labelledby="confirmShutdownLabel" aria-hidden="true" style="text-align: center">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmShutdownLabel">Apagado del Sistema</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Para confirmar el apagado, ingrese sus credenciales:
                <form action="shutdown-servlet" method="post" id="shutdown-form">
                    <div class="form-group">
                        <label for="adminUser">Usuario:</label>
                        <input type="text" name="adminUser" id="adminUser" required>
                    </div>
                    <div class="form-group">
                        <label for="adminPassword">Contraseña:</label>
                        <input type="password" id="adminPassword" name="adminPassword" required>
                    </div>
                </form>
                <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    Las credenciales proporcionadas no son válidas.
                </div>
                <% } %>
                <img src="assets/img/poweralert.png" height="160" width="160">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-outline-danger" form="shutdown-form">Confirmar Apagado</button>
            </div>
        </div>
    </div>
</div>
<% if (!canRegister) { %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
    <a class="navbar-brand" href="#"><img src="assets/img/DALL·E.png" width="40" height="40">  SRP UTEZ</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="loginSistema.jsp">Habilitar Entradas/Salidas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="iniciosesion.jsp">Iniciar Sesion</a>
            </li>
        </ul>
    </div>
</nav>
<% } %>
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

    .container {
        max-height: 100vh;
    }

    #show-form {
        opacity: <% if(canRegister) { %>1<% } else { %>0.5<% } %>;
    }

</style>

<body background="https://quo.mx/wp-content/uploads/2023/03/ciberseguridad-en-mexico-1.png">
<!-- Barra de navegación -->
<div class="container d-flex justify-content-center mt-4">
    <div class="jumbotron" style="text-align: center">
        <h1 class="display-4">Sistema Registro Personal UTEZ</h1>
        <p class="lead">Bienvenido al SRP: Sistema Registro Personal UTEZ. Este sistema permite a los empleados de la Universidad Tecnológica Emiliano Zapata del Estado de Morelos (UTEZ) registrar sus entradas y salidas y consultar sus registros personales de asistencia.</p>
        <% if (canRegister) { %>
        <div class="text-center mt-3">
            <a href="#" id="shutdown-button">
                <img src="assets/img/power.png" width="50" height="50" alt="Apagar" data-toggle="modal" data-target="#confirmShutdown">
            </a>
        </div>
        <% } %>
        <hr class="my-4">

        <div id="form-container" style="display: flex; text-align: center">
            <a href="#"><img src="assets/img/fingerprint.png" id="show-form" style="height:100px; width:100px; position: relative; left: 400%;"></a>
            <div class="form-group" id="hidden-form" style="display: none; position: relative; left: 40%;" >

                <form action="entrada-servlet" method="post" style="font-family: Arial">
                    <label for="idPersonal">ID:</label>
                    <input type="number" name="idPersonal" id="idPersonal" required>
                    <label for="contrasena">Clave:</label>
                    <input type="password" id="contrasena" name="contrasena" placeholder="Ingresa tu clave" required>
                    <input type="submit" class="btn btn-outline-dark" value="Entrar" style="position: relative; left: 33%;">
                </form>
            </div>

        </div>

        <div id="message" class="text-danger"></div>
    </div>
    </div>


    <!-- Aquí va el código jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#show-form').click(function(e) {
            e.preventDefault();
            var isButtonActive = <%= canRegister %>;

            if (isButtonActive) {
                $('#hidden-form').stop().slideToggle('fast');
            } else {
                $('#message').text('Esta funcion está actualmente desactivada.');
                $('#hidden-form').stop().slideUp('fast');
            }
        });
    });
</script>
<!-- Scripts de Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
