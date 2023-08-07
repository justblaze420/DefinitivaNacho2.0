<%@ page import="com.example.definitivanacho2.model.Usuario" %>
<%@ page import="com.example.definitivanacho2.model.DAO.DaoUsuario" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${tipoSesion == 'adminBackup'}">

<html>
<head>
    <title>Consultas</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="assets/DataTables/datatables.min.css">
  <link rel="stylesheet" type="text/css" href="assets/DataTables/DataTables-1.13.6/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="style.css" >
  <link rel="shortcut icon" href="assets/img/DALL·E.ico" />

  <!-- Scripts de JavaScript -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script type="text/javascript" charset="utf8" src="assets/DataTables/datatables.min.js"></script>
  <script type="text/javascript" charset="utf8" src="assets/js/main.js"></script>
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

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
  <a class="navbar-brand" href="bienvenida.jsp"><img src="assets/img/DALL·E.png" width="40" height="40">  SRP UTEZ</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
          aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="bienvenida.jsp">Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/DefinitivaNacho2_war_exploded/registro.jsp?nuevo=true">Registro</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Usuarios</a>
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

<div class="container mt-4" style="font-family: Arial">
  <div class="jumbotron">
    <h1>Usuarios</h1>
    <div class="table-responsive">
    <table id="example" class="table table-striped table-bordered table-hover">
      <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Rol</th>
        <th>Departamento</th>
        <th>Usuario</th>
        <th>Fecha de Registro</th>
        <th>Editar</th>
        <th>Eliminar</th>
      </tr>
      </thead>
      <tbody>
      <%
        request.getSession().removeAttribute("Usuario");
        DaoUsuario daoUsr = new DaoUsuario();
        request.getSession().setAttribute("Usuario", daoUsr.findAll());
      %>
      <c:forEach items="${Usuario}" var="u">
        <tr>
          <td>${u.idPersonal}</td>
          <td>${u.nombre}</td>
          <td>${u.apellido}</td>
          <td>${u.rol}</td>
          <td>${u.nombreDepartamento}</td>
          <td>${u.usuario}</td>
          <td>${u.registro}</td>

          <td><a class="btn btn-outline-info"
                 href="registro-servlet?id=${u.idPersonal}&operacion=update">Modificar</a></td>
          <td><a class="btn btn-outline-danger"
                 href="registro-servlet?id=${u.idPersonal}&operacion=delete">X</a>
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
</div>
</body>

</html>
</c:if>
<c:if test="${tipoSesion != 'adminBackup'}">
  <meta http-equiv="refresh" content="0;url=404.jsp" />
</c:if>