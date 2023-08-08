<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${tipoSesion == 'adminBackup'}">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.definitivanacho2.model.Usuario"%>
  <%
    session.removeAttribute("update");
  %>
  <!DOCTYPE html>
<html>
<head>
  <title>Sistema Registro Personal UTEZ - Bienvenida</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Enlace a la hoja de estilos de Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="shortcut icon" href="assets/img/DALL·E.ico" />

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
</head>
<body background="https://quo.mx/wp-content/uploads/2023/03/ciberseguridad-en-mexico-1.png">
<!-- Barra de navegación -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
  <a class="navbar-brand" href="#"><img src="assets/img/DALL·E.png" width="40" height="40">  SRP UTEZ</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
          aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/DefinitivaNacho2_war_exploded/registro.jsp?nuevo=true">Registro</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="vistaConsultas.jsp">Usuarios</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="vistaRegistros.jsp">Entradas/Salidas</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="iniciosesion.jsp">Cerrar Sesion</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container mt-4">
  <center>
  <div class="jumbotron">
    <h1 class="display-4">
      <!-- Usamos la información del usuario para personalizar el mensaje de bienvenida -->
      ¡Bienvenido a SRP Utez, Admin!
    </h1>
    <p class="lead">SRP: Sistema Registro Personal UTEZ. Puedes registrar usuarios, y consultar registros personales de asistencia.</p>
    <hr class="my-4">
    <img src="assets/img/fingerprint.png" height="256" width="244">
  </div>
  </center>
</div>
<footer class="footer text-center" style="color: white">
  <p>Todos los derechos reservados &copy; 2023 - SRP: Sistema Registro Personal UTEZ</p>
</footer>
<!-- Scripts de Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
</c:if>
<c:if test="${tipoSesion != 'adminBackup'}">
  <meta http-equiv="refresh" content="0;url=404.jsp" />
</c:if>