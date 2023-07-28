<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>Registro de Usuarios</title>
  <!-- Enlace a la hoja de estilos de Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="style.css">
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
          <a class="nav-link" href="#">Registrar Entradas/Salidas</a>
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
</header>
<body>
<div class="container mt-4">
  <div class="jumbotron">
    <h1 class="display-4">Registro de Entradas/Salidas</h1>
    <form id="entryForm">
      <div class="form-group">
        <label for="nombre">Nombre:</label>
        <input type="text" class="form-control" id="nombre" name="nombre" value="${usuario.nombre}" placeholder="Ingresa tu nombre" required>
      </div>
      <div class="form-group">
        <label for="apellido">Apellido:</label>
        <input type="text" class="form-control" id="apellido" name="apellido" value="${usuario.apellido}" placeholder="Ingresa tu apellido" required>
      </div>
      <div class="form-group">
        <label for="rol">Rol:</label>
        <input type="text" class="form-control" id="rol" name="rol" value="${usuario.rol}" placeholder="Ingresa el rol" required>
      </div>
      <div class="form-group">
        <label for="departamento">Departamento:</label>
        <input type="text" class="form-control" id="departamento" name="departamento" placeholder="Ingresa el Departamento" required>
      </div>
      <div class="form-group">
        <label for="usuario">Usuario:</label>
        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingresa tu usuario" required>
      </div>
      <div class="form-group">
        <label for="entrada">Hora/Entrada:</label>
        <input type="time" class="form-control" id="entrada" name="entrada" placeholder="Ingresa la hora de entrada" required>
      </div>
      <div class="form-group">
        <label for="salida">Hora/Salida:</label>
        <input type="time" class="form-control" id="salida" name="salida" placeholder="Ingresa la hora de salida" required>
      </div>
      <input type="hidden" name="idPersonal" id="idPersonal" value="${usuario.idPersonal}">
      <button type="submit" class="btn btn-outline-primary">Registrarse</button>
    </form>
    <br>
    <table id="entryTable" class="table table-striped table-bordered" style="font-family: Arial">
      <tr>
        <th>ID Personal</th>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Rol</th>
        <th>Departamento</th>
        <th>Usuario</th>
        <th>Hora/Entrada</th>
        <th>Hora/Salida</th>
      </tr>
      <!-- Las filas de la tabla serán añadidas aquí -->
    </table>
  </div>
</div>
<script>
  document.getElementById('entryForm').addEventListener('submit', function(event) {
    event.preventDefault();

    var idPersonal = document.getElementById('idPersonal').value;
    var nombre = document.getElementById('nombre').value;
    var apellido = document.getElementById('apellido').value;
    var rol = document.getElementById('rol').value;
    var departamento = document.getElementById('departamento').value;
    var usuario = document.getElementById('usuario').value;
    var entrada = document.getElementById('entrada').value;
    var salida = document.getElementById('salida').value;

    var row = document.createElement('tr');
    var fields = [idPersonal, nombre, apellido, rol, departamento, usuario, entrada, salida];

    for (var i = 0; i < fields.length; i++) {
      var cell = document.createElement('td');
      cell.textContent = fields[i];
      row.appendChild(cell);
    }

    document.getElementById('entryTable').appendChild(row);

    event.target.reset();
  });
</script>
</body>
</html>
