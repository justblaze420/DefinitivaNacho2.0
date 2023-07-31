<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Registro Exitoso</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="shortcut icon" href="assets/img/DALL·E.ico" />
</head>
<body>
<div class="container mt-4">
  <div class="jumbotron">
    <h1 class="display-4">¡Registro Exitoso!</h1>
    <p class="lead">Tu usuario ha sido registrado correctamente.</p>
    <p>Redirigiendo a la página en unos segundos...</p>
  </div>
</div>

<script>
  setTimeout(function() {
    window.location.href = "vistaConsultas.jsp";
  }, 1500);
</script>
</body>
</html>
