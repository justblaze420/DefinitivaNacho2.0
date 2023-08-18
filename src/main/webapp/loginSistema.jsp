<%--
  Created by IntelliJ IDEA.
  User: Robbie Daniel
  Date: 17/08/2023
  Time: 09:05 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login Sistema</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
  <link rel="shortcut icon" href="assets/img/DALL·E.ico" />
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container mt-5">
      <div class="jumbotron">
        <h1 class="display-5"><img src="assets/img/SRP%20Logo.png" width="150" height="150">Habilitar Entradas/Salidas</h1>
        <hr class="my-4">
        <form action="login-servlet" method="post">
          <div class="form-group">
            <label for="usuario">Usuario:</label>
            <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingresa tu usuario" required>
          </div>
          <div class="form-group">
            <label for="contrasena">Contraseña:</label>
            <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Ingresa tu contraseña" required>
          </div>

          <% if (request.getParameter("error") != null) { %>
          <div class="alert alert-danger" role="alert">
            Las credenciales proporcionadas no son válidas.
          </div>
          <% } %>

          <div class="text-center">
            <a class="btn btn-outline-dark" href="javascript:history.back()" role="button">Regresar</a>
            <button type="submit" class="btn btn-outline-success">Iniciar Sesión</button>
          </div>
        </form>
      </div>
</div>


</body>
</html>
