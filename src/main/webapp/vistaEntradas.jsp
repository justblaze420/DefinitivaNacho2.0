<%@ page import="com.example.definitivanacho2.model.Usuario" %>
<%@ page import="com.example.definitivanacho2.model.Registro" %>
<%@ page import="com.example.definitivanacho2.model.DAO.DaoUsuario" %>
<%@ page import="com.example.definitivanacho2.model.DAO.DaoRegistro" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Registros User</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
<c:if test="${tipoSesion == 'admin'}">
  <c:if test="${not empty sesion}">
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
  <a class="navbar-brand" href="bienvenidaAdmin.jsp"><img src="assets/img/DALL·E.png" width="40" height="40">  SRP UTEZ</a>
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
        <a class="nav-link" href="#">Mis Registros</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="registro.jsp">Registrar Usuarios</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="vistaConsultas.jsp">Consulta</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="iniciosesion.jsp">Cerrar Sesion</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container mt-4" style="font-family: Arial">
  <div class="jumbotron">
    <h1>Mis Registros</h1>
    <table class="table table-striped table-bordered">
      <tr>
        <th>ID de Registro</th>
        <th>Hora de Entrada</th>
        <th>Hora de Salida</th>
      </tr>
      <%
        DaoRegistro daoRegistro = new DaoRegistro();
        Usuario usuarioActual = (Usuario) request.getSession().getAttribute("usuario");
        int idPersonal = usuarioActual.getIdPersonal();
        List<Registro> registros = daoRegistro.findAllById(idPersonal);
        request.getSession().setAttribute("registros", registros);
      %>
      <c:forEach var="registro" items="${sessionScope.registros}">
        <tr>
          <td>${registro.idRegistro}</td>
          <td>${registro.horaEntrada}</td>
          <td>${registro.horaSalida}</td>
        </tr>
      </c:forEach>
    </table>

  </div>
</div>
</body>
  </c:if>
</c:if>
<c:if test="${tipoSesion != 'admin'}">
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
    <a class="navbar-brand" href="index.jsp"><img src="assets/img/DALL·E.png" width="40" height="40">  SRP UTEZ</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Inicio</a>
        </li>
        <div class="container mt-4">
          <div class="jumbotron">
            <h1 class="display-4">Error 404</h1>
            <p class="lead">Lo sentimos, la página que estás buscando no existe.</p>
            <hr class="my-4">
            <p>Puede que hayas introducido la dirección incorrectamente o que la página haya sido movida o eliminada.</p>
            <a class="btn btn-outline-dark" href="javascript:history.back()" role="button">Regresar</a>
          </div>
        </div>
      </ul>
    </div>
  </nav>
</c:if>
</html>
