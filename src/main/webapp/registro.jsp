<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Registro de Usuarios</title>
  <!-- Enlace a la hoja de estilos de Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
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
</head>
<header>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
    <a class="navbar-brand" href="index.jsp"><img src="assets/img/SRP.png" width="20" height="20">  SRP UTEZ</a>
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
<body>
<div class="container mt-4">
  <div class="jumbotron">
    <h1 class="display-4">Registro de Usuarios</h1>
    <form action="registro-servlet" method="post">
      <div class="form-group">
        <label for="nombre">Nombre:</label>
        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingresa tu nombre" required>
      </div>
      <div class="form-group">
        <label for="apellido">Apellido:</label>
        <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Ingresa tu apellido" required>
      </div>
      <div class="form-group">
        <label for="usuario">Usuario:</label>
        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingresa tu usuario" required>
      </div>
      <div class="form-group">
        <label for="contrasena">Contraseña:</label>
        <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Ingresa tu contraseña" required>
      </div>
      <button type="submit" class="btn btn-primary">Registrarse</button>
    </form>
  </div>
</div>
</body>
</html>