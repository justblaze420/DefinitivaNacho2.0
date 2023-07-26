<%@ page import="com.example.definitivanacho2.model.Usuario" %>
<%@ page import="com.example.definitivanacho2.model.DAO.DaoUsuario" %><%--
  Created by IntelliJ IDEA.
  User: Robbie Daniel
  Date: 25/07/2023
  Time: 11:07 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consultas</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
  <a class="navbar-brand" href="#"><img src="assets/img/DALL·E.png" width="40" height="40">SRP UTEZ</a>
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
        <a class="nav-link" href="registro.jsp">Registro</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="vistaConsultas.jsp">Consulta</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container mt-4">
  <div class="jumbotron">
  <h1>Usuarios</h1>
  <table class="table table-striped table-bordered">
    <thead>
    <tr>
      <th>Nombre</th>
      <th>Apellido</th>
      <th>Rol</th>
      <th>Usuario</th>
      <th>Contraseña</th>
      <th>Editar</th>
      <th>Eliminar</th>
    </tr>
    </thead>
    <tbody>
    <%
      request.getSession().removeAttribute("Usuario");
      DaoUsuario usr = new DaoUsuario();
      request.getSession().setAttribute("Usuario", usr.findAll());
    %>
    <c:forEach items="${Usuario}" var="u">
      <tr>
        <td width="150px">${u.nombre}</td>
        <td width="150px">${u.apellido}</td>
        <td width="150px">${u.rol}</td>
        <td width="150px">${u.usuario}</td>
        <td width="150px">${u.contraseña}</td>

        <td><a class="btn btn-outline-info"
               href="registro-servlet?id=${u.id}&operacion=update">Modificar</a></td>
        <td><a class="btn btn-outline-danger"
               href="registro-servlet?id=${u.id}&operacion=delete">X</a>
          <script>
            function mostrarAlerta() {
              alert("Seguro de eliminar el registro?");
              window.location.href = "home1.html"; // Enlace a redirigir
            }
          </script>
        </td>


      </tr>


    </c:forEach>
    </tbody>
  </table>
  </div>
</div>
</body>
</html>
