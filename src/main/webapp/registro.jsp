<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${tipoSesion == 'adminBackup'}">
<!DOCTYPE html>
<html>
<head>
  <c:choose>
    <c:when test="${sessionScope.update == 'update'}">
      <title>Modificar Usuario</title>
    </c:when>
    <c:otherwise>
      <title>Registro de Usuarios</title>
    </c:otherwise>
  </c:choose>
  <!-- Enlace a la hoja de estilos de Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="style.css">
  <link rel="shortcut icon" href="assets/img/DALL·E.ico" />
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
          <a class="nav-link" href="#">Registro</a>
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
</header>
<script>
  window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('nuevo') === 'true') {
      document.getElementById('nombre').value = '';
      document.getElementById('apellido').value = '';
      document.getElementById('rol').selectedIndex = 0; // Para seleccionar el primer item en el dropdown
      document.getElementById('idDepartamento').selectedIndex = 0;
      document.getElementById('usuario').value = '';
      document.getElementById('contrasena').value = '';
      document.getElementById('idPersonal').value = '';
    }
  }
</script>

<body>
<div class="container mt-4">
  <div class="jumbotron">
    <c:choose>
      <c:when test="${sessionScope.update == 'update'}">
        <h1 class="display-4">Modificar Usuario</h1>
      </c:when>
      <c:otherwise>
        <h1 class="display-4">Registro de Usuarios</h1>
      </c:otherwise>
    </c:choose>
    <form action="registro-servlet" method="post">
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
        <select class="form-control" id="rol" name="rol" placeholder="Ingresa el rol"
                required>
          <option value="User" ${usuario.rol == 'user' ? 'selected' :
                  ''}>Empleado</option>
          <option value="Admin" ${usuario.rol == 'admin' ? 'selected' :
                  ''}>Administrador</option>
          <option value="Admin RH" ${usuario.rol == 'admin' ? 'selected' : ''}>Recursos
            Humanos</option>
        </select>
      </div>
      <script>
        $(document).ready(function() {
          function updateDepartamentoOptions(selectedRol) {
            $('#idDepartamento option').each(function() {
              const value = $(this).val();
              if (selectedRol === 'Admin RH' || selectedRol === 'Admin') {
                $(this).hide();
              } else if (selectedRol === 'User' && (value === '4' || value === '5')) {
                $(this).hide();
              } else {
                $(this).show();
              }
            });
          }

          $('#rol').change(function() {
            const selectedRol = $(this).val();

            if (selectedRol === 'Admin RH') {
              $('#idDepartamento').val('4');
              $('#idDepartamento').prop('disabled', true);
              updateDepartamentoOptions(selectedRol);
            } else if (selectedRol === 'Admin') {
              $('#idDepartamento').val('5');
              $('#idDepartamento').prop('disabled', true);
              updateDepartamentoOptions(selectedRol);
            } else {  // asume que es 'User'
              $('#idDepartamento').val('1');  // establecer "Profesores" como la opción por defecto
              $('#idDepartamento').prop('disabled', false);
              updateDepartamentoOptions(selectedRol);
            }
          });

          // Inicialización, si es necesario
          updateDepartamentoOptions($('#rol').val());
        });
      </script>
      <div class="form-group">
        <label for="idDepartamento">Departamento:</label>
        <select class="form-control" id="idDepartamento" name="idDepartamento" placeholder="Ingresa el Departamento" required>
          <option value="1" ${usuario.idDepartamento == '1' ? 'selected' : ''}>Profesores</option>
          <option value="2" ${usuario.idDepartamento == '2' ? 'selected' : ''}>Seguridad</option>
          <option value="3" ${usuario.idDepartamento == '3' ? 'selected' : ''}>Limpieza</option>
          <option value="4" ${usuario.idDepartamento == '4' ? 'selected' : ''}>Recursos Humanos</option>
          <option value="5" ${usuario.idDepartamento == '5' ? 'selected' : ''}>Administración</option>
          <option value="6" ${usuario.idDepartamento == '6' ? 'selected' : ''}>Psiquiatría</option>
          <option value="7" ${usuario.idDepartamento == '7' ? 'selected' : ''}>Áreas Sociales</option>
        </select>
      </div>
      <div class="form-group">
        <label for="usuario">Usuario:</label>
        <input type="text" class="form-control" id="usuario" name="usuario" value="${usuario.usuario}" placeholder="Ingresa tu usuario" required>
      </div>
      <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
      </c:if>
      <c:choose>
        <c:when test="${sessionScope.update == 'update'}">
          <div class="form-group" id="newPasswordDiv" style="display:none;">
            <label for="newPassword">Nueva Contraseña:</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Nueva contraseña">
            <c:if test="${not empty errorMessage3}">
              <div class="text-danger">${errorMessage3}</div>
            </c:if>
          </div>
          <button id="changePasswordBtn" class="btn btn-outline-info">Cambiar contraseña</button>
          <input type="hidden" id="passwordChangeRequested" name="passwordChangeRequested" value="false">

          <script>
            document.getElementById("changePasswordBtn").addEventListener("click", function(event) {
              // Previniendo la acción por defecto del botón
              event.preventDefault();

              const newPasswordDiv = document.getElementById("newPasswordDiv");
              const newPasswordInput = document.getElementById("newPassword");
              newPasswordDiv.style.display = "block";
              newPasswordInput.required = true;
              document.getElementById("passwordChangeRequested").value = "true";
            });

          </script>
        </c:when>
        <c:otherwise>
          <div class="form-group">
            <label for="contrasena">Contraseña:</label>
            <input type="password" class="form-control" id="contrasena" name="contrasena" value="${usuario.contrasena}" placeholder="Ingresa tu contraseña" required>
          </div>
          <c:if test="${not empty errorMessage2}">
            <div class="text-danger">${errorMessage2}</div>
          </c:if>
        </c:otherwise>
      </c:choose>
      <input type="hidden" name="idPersonal" id="idPersonal" value="${usuario.idPersonal}">
      <c:choose>
        <c:when test="${sessionScope.update == 'update'}">
          <button type="submit" class="btn btn-outline-success">Actualizar</button>
        </c:when>
        <c:otherwise>
          <button type="submit" class="btn btn-outline-primary">Registrarse</button>
        </c:otherwise>
      </c:choose>
    </form>
  </div>
</div>
</body>

</html>
</c:if>
<c:if test="${tipoSesion != 'adminBackup'}">
  <meta http-equiv="refresh" content="0;url=404.jsp" />
</c:if>