<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Error 500 - Problema Interno del Servidor</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Tu CSS personalizado -->
  <link rel="stylesheet" href="style.css" >
  <link rel="shortcut icon" href="assets/img/DALL·E.ico" />
</head>
<body>

<div class="container mt-5">
  <div class="jumbotron" style="text-align: center;">
    <img src="assets/img/falcon.png">
    <h1 class="display-4">Error 500 - SRP UTEZ</h1>
    <p class="lead">Lo sentimos, ha ocurrido un problema interno en el servidor.</p>
    <hr class="my-4">
    <p>Por favor, regresa más tarde o ponte en contacto con el administrador del sitio si el problema persiste.</p>
    <a class="btn btn-outline-dark btn-lg" href="javascript:history.back()" role="button">Regresar al Inicio</a>
  </div>

  <!-- Sección del stack trace -->
  <div>
    <h3>Detalles técnicos:</h3>
    <pre class="bg-light p-3">
            <%= exceptionToString((Throwable) request.getAttribute("javax.servlet.error.exception")) %>
        </pre>
  </div>
</div>

<%!
  // Método para convertir una excepción en una cadena
  public String exceptionToString(Throwable e) {
    if (e == null) {
      return "No se ha proporcionado información de error.";
    }

    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    e.printStackTrace(pw);
    return sw.toString();
  }
%>

<!-- Scripts de Bootstrap y otros que podrías necesitar -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="assets/js/main.js"></script>
</body>
</html>