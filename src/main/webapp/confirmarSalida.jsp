<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.example.definitivanacho2.model.Usuario"%>
<c:if test="${tipoSesion == 'registro'}">
<html>
<head>
    <title>Confirmar Salida</title>
    <link rel="shortcut icon" href="assets/img/DALL·E.ico" />
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
<div class="container mt-4" style="font-family: 'Arial'">
    <div class="jumbotron">
        <img src="assets/img/DALL·E.png" width="100" height="100">
        <h1 class="display-4"><img src="assets/img/danger.png" width="125" height="100">Confirmar Salida</h1>
        <p>Ya registraste tu entrada. ¿Deseas registrar tu salida <strong><%= usuario.getNombre() %></strong> ?</p>
        <form action="entrada-servlet" method="post">
            <input type="hidden" id="confirmarSalida" name="confirmarSalida" value="true">
            <button type="submit" class="btn btn-outline-warning">Confirmar Salida</button>
        </form>
        <button onclick="cancelar()" class="btn btn-outline-danger">Cancelar</button>
        <script>
            function cancelar() {
                window.location.href = "index.jsp"; // Redirige a donde quieras si se cancela
            }
        </script>
    </div>
</div>


</body>
</html>
</c:if>
<c:if test="${tipoSesion != 'registro'}">
    <meta http-equiv="refresh" content="0;url=404.jsp" />
</c:if>