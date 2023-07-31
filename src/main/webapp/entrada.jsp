
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.example.definitivanacho2.model.Usuario"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bienvenido - Registro Exitoso</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Enlace a la hoja de estilos de Bootstrap -->
  <link rel="shortcut icon" href="assets/img/DALL·E.ico" />
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<style>
  /* Estilo personalizado para la barra de navegación */
  .navbar-custom {
    background-color: #000; /* Fondo negro */
  }

  /* Estilo para las opciones de navegación */
  .navbar-custom .nav-link {
    position: relative;
    color: #fff; /* Texto blanco */
    transition: color 0.2s; /* Transición de color al pasar el cursor */
  }

  /* Estilo para la animación al pasar el cursor */
  .navbar-custom .nav-link::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 2px;
    background-color: forestgreen; /* Línea azul */
    transform: scaleX(0); /* Inicialmente la línea no se muestra */
    transition: transform 0.3s; /* Transición de la animación */
  }

  /* Estilo para la animación al pasar el cursor */
  .navbar-custom .nav-link:hover::after {
    transform: scaleX(1); /* Al pasar el cursor, la línea aparece */
  }
  .container {
    background-color: rgba(255, 255, 255, 0.8); /* Fondo con transparencia */
    backdrop-filter: blur(10px); /* Efecto de desenfoque */
  }

  /* Estilos para el footer */
  footer {
    background-color: #000; /* Fondo negro */
    color: #fff; /* Texto blanco */
    padding: 20px 0;
  }

  footer p {
    margin: 0;
  }
</style>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
  <a class="navbar-brand" href="#"><img src="assets/img/DALL·E.png" width="40" height="40">  SRP UTEZ</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
          aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="bienvenidaUser.jsp">Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Entradas/Salidas</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="vistaEntradas.jsp">Consulta</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="iniciosesion.jsp">Cerrar Sesion</a>
      </li>
    </ul>
  </div>
</nav>
<%
  Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
<div class="container">
  <div class="jumbotron mt-5">
    <h1 class="display-4">¡Bienvenido!</h1>
    <p class="lead">Tu registro ha sido completado exitosamente. <%= usuario.getNombre() %></p>
    <hr class="my-4">
    <p>Puedes explorar nuestra plataforma ahora.</p>
    <a class="btn btn-primary btn-lg" href="#" role="button">Explorar</a>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
