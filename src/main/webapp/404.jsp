<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404 Error!</title>
    <link rel="shortcut icon" href="assets/img/DALL·E.ico" />
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <div class="jumbotron">
        <h1 class="display-4"><img src="assets/img/DALL·E.png" width="100" height="100"> Error 404</h1>
        <p class="lead">Lo sentimos, la página que estás buscando no existe.</p>
        <hr class="my-4">
        <p>Puede que hayas introducido la dirección incorrectamente o que la página haya sido movida o eliminada.</p>
        <a class="btn btn-outline-dark" href="javascript:history.back()" role="button">Regresar</a>
        <a class="btn btn-outline-primary" href="index.jsp" role="button">Ir al Inicio</a>
        <a class="btn btn-outline-success" href="iniciosesion.jsp" role="button">Iniciar Sesion</a>
    </div>
</div>
</body>
</html>