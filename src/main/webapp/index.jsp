<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sistema de Registro de Entradas y Salidas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Enlace a la hoja de estilos de Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<!-- Barra de navegación -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Sistema de Registro</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Registro</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Consulta</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <div class="jumbotron">
        <h1 class="display-4">Sistema de Registro de Entradas y Salidas</h1>
        <p class="lead">Bienvenido al Sistema de Registro de Entradas y Salidas de Personal. Este sistema permite
            registrar las entradas y salidas del personal de la empresa y consultar los registros de forma sencilla.</p>
        <hr class="my-4">
        <p>Para utilizar la aplicación, sigue las siguientes instrucciones:</p>
        <ol>
            <li>Completa el formulario de registro proporcionando tu nombre, apellidos y departamento.</li>
            <li>Haz clic en el botón "Registrar Entrada" para registrar tu entrada al trabajo.</li>
            <li>Para consultar tus registros, selecciona la opción "Consulta" en la barra de navegación.</li>
            <li>Ingresa tu nombre o número de empleado y selecciona el rango de fechas para filtrar los registros.</li>
            <li>Presiona el botón "Consultar" para obtener los registros correspondientes.</li>
        </ol>
    </div>
</div>

<!-- Scripts de Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
