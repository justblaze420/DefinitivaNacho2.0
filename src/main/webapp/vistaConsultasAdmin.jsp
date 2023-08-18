<%@ page import="com.example.definitivanacho2.model.Usuario" %>
<%@page import="com.example.definitivanacho2.model.Departamento"%>
<%@ page import="com.example.definitivanacho2.model.DAO.DaoUsuario" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${tipoSesion == 'admin'}">
  <%
    session.removeAttribute("update");
  %>
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
  <a class="navbar-brand" href="bienvenidaAdmin.jsp"><img src="assets/img/DALL·E.png" width="40" height="40">  SRP UTEZ</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
          aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="bienvenidaAdmin.jsp">Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="vistaEntradasAdmin.jsp">Mis Registros</a>
      </li>
      <c:if test="${sessionScope.usuario.rol != 'Admin RH'}">
        <li class="nav-item">
          <a class="nav-link" href="registroAdmin.jsp?nuevo=true">Registrar Usuarios</a>
        </li>
      </c:if>
      <li class="nav-item">
        <a class="nav-link" href="#">Usuarios</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="vistaRegistrosAdmin.jsp">Entradas/Salidas</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="iniciosesion.jsp">Cerrar Sesion</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container mt-4" style="font-family: Arial">
  <div class="jumbotron">
    <%
      Usuario usuario = (Usuario) session.getAttribute("usuarioActual");
      Departamento departamento = (Departamento) session.getAttribute("departamento");
      DaoUsuario daoUsr = new DaoUsuario();
      request.getSession().setAttribute("Usuario", daoUsr.findAll(usuario.getIdPersonal()));
    %>
    <h1>Usuarios</h1>
    <h5>Departamento: <%= departamento.getNombre() %></h5>
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
  <c:if test="${sessionScope.usuario.rol != 'Admin RH'}">
        <th>Editar</th>
        <th>Eliminar</th>
  </c:if>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${Usuario}" var="u">
        <tr>
          <td>${u.idPersonal}</td>
          <td>${u.nombre}</td>
          <td>${u.apellido}</td>
          <td>${u.rol}</td>
          <th>${u.nombreDepartamento}</th>
          <td>${u.usuario}</td>
          <td>${u.registro}</td>

          <c:if test="${sessionScope.usuario.rol != 'Admin RH'}">
              <td><a class="btn btn-outline-info"
                     href="registroadminservlet?id=${u.idPersonal}&operacion=update">Modificar</a></td>
              <td>
                <button class="btn btn-outline-danger" onclick="showConfirmDelete('registroadminservlet?id=${u.idPersonal}&operacion=delete')">X</button>
              </td>
          </c:if>


        </tr>


      </c:forEach>
      </tbody>
    </table>
    </div>

  </div>
</div>
<!-- Modal para confirmar eliminación -->
<div class="modal fade" id="confirmDelete" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true" style="text-align: center">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmDeleteLabel">Confirmación</h5>
        <button type="button" value="X" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ¿Estás seguro de que deseas eliminar a este usuario?
        <img src="assets/img/alert.png">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancelar</button>
        <a href="#" class="btn btn-outline-danger" id="confirmDeleteBtn">Eliminar</a>
      </div>
    </div>
  </div>
</div>

<script>
  function showConfirmDelete(url) {
    // Mostrar el modal
    var myModal = new bootstrap.Modal(document.getElementById('confirmDelete'));
    myModal.show();

    // Establecer la URL para el botón de confirmación
    document.getElementById('confirmDeleteBtn').href = url;
  }
</script>
</body>

</html>
</c:if>
<c:if test="${tipoSesion != 'admin'}">
  <meta http-equiv="refresh" content="0;url=404.jsp" />
</c:if>