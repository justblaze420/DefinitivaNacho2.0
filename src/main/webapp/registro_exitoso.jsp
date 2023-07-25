<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Registro Exitoso</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <div class="jumbotron">
    <h1 class="display-4">¡Registro Exitoso!</h1>
    <p class="lead">Tu usuario ha sido registrado correctamente.</p>
    <p>Redirigiendo a la página de inicio de sesión en unos segundos...</p>
  </div>
</div>

<!-- Redirección a iniciosesion.jsp después de 3 segundos -->
<script>
  setTimeout(function() {
    window.location.href = "iniciosesion.jsp";
  }, 3000);
</script>
</body>
</html>
