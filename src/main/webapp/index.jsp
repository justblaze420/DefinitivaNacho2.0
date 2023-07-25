<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sistema Registro Personal UTEZ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Enlace a la hoja de estilos de Bootstrap -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
    <a class="navbar-brand" href="#"><img src="assets/img/DALL·E.png" width="40" height="40">  SRP UTEZ</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="iniciosesion.jsp">Inicio</a>
            </li>
        </ul>
    </div>
</nav>

<style>
    .jumbotron {
        backdrop-filter: blur(8px); /* Efecto de desenfoque */
        background-color: rgba(255, 255, 255, 0.5); /* Fondo con transparencia */
        padding: 2rem; /* Espaciado interno para evitar que el contenido se desborde */
    }

    .container {
        display: flex;
        justify-content: center;
        margin-top: 4rem; /* Margen superior de 4 unidades */
        backdrop-filter: blur(8px); /* Efecto de desenfoque */
        background-color: rgba(255, 255, 255, 0.5); /* Fondo con transparencia */
        padding: 2rem; /* Espaciado interno para evitar que el contenido se desborde */
    }
</style>

<body background="https://quo.mx/wp-content/uploads/2023/03/ciberseguridad-en-mexico-1.png">
<!-- Barra de navegación -->
<div class="container d-flex justify-content-center mt-4">
    <div class="jumbotron">
        <h1 class="display-4">Sistema Registro Personal UTEZ</h1>
        <p class="lead">Bienvenido al SRP: Sistema Registro Personal UTEZ. Este sistema permite a los empleados de la Universidad Tecnológica Emiliano Zapata del Estado de Morelos (UTEZ) registrar sus entradas y salidas y consultar sus registros personales de asistencia.</p>
        <hr class="my-4">
        <h2>Instrucciones de Uso:</h2>
        <ol>
            <li>Para registrar tu entrada o salida, selecciona la opción "Registro" en la barra de navegación.</li>
            <li>Completa el formulario proporcionando tu nombre, apellidos y departamento.</li>
            <li>Haz clic en el botón "Registrar" para guardar el registro de entrada o salida.</li>
            <li>Para consultar tus registros personales, selecciona la opción "Consulta" en la barra de navegación.</li>
            <li>Ingresa tu nombre o número de empleado y selecciona el rango de fechas para filtrar los registros.</li>
            <li>Presiona el botón "Consultar" para obtener los registros correspondientes.</li>
        </ol>
        <p class="lead">
            El Sistema Registro Personal UTEZ (SRP UTEZ) es una aplicación web desarrollada para facilitar y mejorar el registro y consulta de entradas y salidas del personal de la Universidad Tecnológica Emiliano Zapata del Estado de Morelos (UTEZ). Su propósito principal es proporcionar una herramienta eficiente y confiable que permita a los empleados registrar sus asistencias y consultar sus registros personales de manera sencilla y rápida.</p>
        <p class="lead">Mediante el uso de lectores de huella digital y computadoras autorizadas por el departamento de recursos humanos, el sistema permite a los empleados registrar sus entradas y salidas en diferentes puntos de registro ubicados en lugares estratégicos dentro de la UTEZ. Esto contribuye a un mayor control y precisión en el seguimiento de la asistencia, evitando confusiones o inconformidades al momento de aclarar la asistencia o inasistencia.</p>
    </div>
</div>
<footer class="footer text-center" style="color: white">
    <p>Todos los derechos reservados &copy; 2023 - SRP: Sistema Registro Personal UTEZ</p>
</footer>
<!-- Scripts de Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
