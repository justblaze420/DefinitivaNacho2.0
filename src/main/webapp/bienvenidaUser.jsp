<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${tipoSesion == 'user'}">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" session="true"%>
<%@page import="com.example.definitivanacho2.model.Usuario"%>
  <%@page import="com.example.definitivanacho2.model.Departamento"%>
<!DOCTYPE html>
<html>
<head>
  <title>Sistema Registro Personal UTEZ - Bienvenida</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Enlace a la hoja de estilos de Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="shortcut icon" href="assets/img/DALL�E.ico" />
  <style>
    /* Estilo personalizado para la barra de navegaci�n */
    .navbar-custom {
      background-color: #000; /* Fondo negro */
    }

    /* Estilo para las opciones de navegaci�n */
    .navbar-custom .nav-link {
      position: relative;
      color: #fff; /* Texto blanco */
      transition: color 0.2s; /* Transici�n de color al pasar el cursor */
    }

    /* Estilo para la animaci�n al pasar el cursor */
    .navbar-custom .nav-link::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 2px;
      background-color: forestgreen; /* L�nea azul */
      transform: scaleX(0); /* Inicialmente la l�nea no se muestra */
      transition: transform 0.3s; /* Transici�n de la animaci�n */
    }

    /* Estilo para la animaci�n al pasar el cursor */
    .navbar-custom .nav-link:hover::after {
      transform: scaleX(1); /* Al pasar el cursor, la l�nea aparece */
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
<!-- Barra de navegaci�n -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
  <a class="navbar-brand" href="#"><img src="assets/img/DALL�E.png" width="40" height="40">  SRP UTEZ</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
          aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="vistaEntradasUser.jsp">Mis Registros</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="iniciosesion.jsp">Cerrar Sesion</a>
      </li>
    </ul>
  </div>
</nav>
<%
  Usuario usuario = (Usuario) session.getAttribute("usuarioActual");
  Departamento departamento = (Departamento) session.getAttribute("departamento");

%>
<div class="container mt-4">
  <center>
    <div class="jumbotron">
      <h1 class="display-4">
        <!-- Usamos la informaci�n del usuario para personalizar el mensaje de bienvenida -->
        �Bienvenido a SRP Utez, <%= usuario.getNombre() %>!
      </h1>
      <h2><%= usuario.getApellido() %></h2>
      <h3>ID: <%= usuario.getIdPersonal() %></h3>
      <p class="lead">SRP: Sistema Registro Personal UTEZ. Puedes consultar tus registros personales de asistencia.</p>
      <h4>Departamento: <%= departamento.getNombre() %></h4>
      <hr class="my-4">
      <img src="assets/img/BlackLogo.png">
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
<c:if test="${tipoSesion != 'user'}">
  <meta http-equiv="refresh" content="0;url=404.jsp" />
</c:if>