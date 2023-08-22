
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.example.definitivanacho2.model.Usuario"%>
<%@page import="com.example.definitivanacho2.model.Registro"%>
<%@ page import="com.example.definitivanacho2.model.DAO.DaoRegistro" %>

<!DOCTYPE html>
<html>
<head>
  <title>Salida</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Enlace a la hoja de estilos de Bootstrap -->
  <link rel="shortcut icon" href="assets/img/DALL·E.ico" />
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<body>
<%
  Registro registro = (Registro) session.getAttribute("registro");
  Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
<div style="font-family: Arial">
  <div class="jumbotron mt-5">
    <h1 class="display-4"><img src="assets/img/DALL·E.png" width="100" height="100"> ¡Hasta Luego! <%= usuario.getNombre() %>.</h1>
    <p class="lead">Tu salida ha sido registrada al <%= registro.getHoraSalida() %> , <strong><%= usuario.getNombre() %></strong></p>
    <hr class="my-4">
    <table border="1" class="table table-striped table-bordered">
      <tr>
        <th>No. Registro</th>
        <th>ID Personal</th>
        <th>Fecha/Hora de Entrada</th>
        <th>Fecha/Hora de Salida</th>
      </tr>
      <tr>
        <td><%= registro.getIdRegistro() %></td>
        <td><%= registro.getIdPersonal() %></td>
        <td><%= registro.getHoraEntrada() %></td>
        <td><%= registro.getHoraSalida() %></td>
      </tr>
    </table>
  </div>
</div>

<script>
  setTimeout(function() {
    window.location.href = "index.jsp";
  }, 4000);
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
