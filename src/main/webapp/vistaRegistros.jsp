<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.definitivanacho2.model.DAO.DaoRegistro" %>
<%@ page import="com.example.definitivanacho2.model.DAO.DaoUsuario" %>
<%@ page import="com.example.definitivanacho2.model.Usuario" %>
<%@ page import="com.example.definitivanacho2.model.Registro" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registros</title>
    <link rel="stylesheet" type="text/css" href="assets/DataTables/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="assets/DataTables/DataTables-1.13.6/css/dataTables.bootstrap4.min.css">
    <link rel="shortcut icon" href="assets/img/DALL·E.ico" />
    <link rel="stylesheet" href="style.css" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<c:if test="${tipoSesion == 'adminBackup'}">
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
                <a class="nav-link" href="registro.jsp">Registro</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="vistaConsultas.jsp">Usuarios</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Entradas/Salidas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="iniciosesion.jsp">Cerrar Sesion</a>
            </li>
        </ul>
    </div>
</nav>
<body>
<%
    DaoRegistro daoReg = new DaoRegistro();
    List<Registro> registros = daoReg.findAll();
    request.setAttribute("registros", registros);
%>
<div class="container mt-4">
    <div class="jumbotron">
        <h1 class="display-4">Registros</h1>
        <div class="table-responsive">
        <table id="example" class="table table-striped table-bordered" style="font-family: Arial">
            <thead>
            <tr>
                <th>ID Registro</th>
                <th>ID Personal</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Fecha de Entrada</th>
                <th>Fecha de Salida</th>
                <th>Duración</th>
                <!-- Otros encabezados de columna aquí -->
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${registros}" var="r">
                <tr>
                    <td>${r.idRegistro}</td>
                    <td>${r.idPersonal}</td>
                    <td>${r.nombre}</td>
                    <td>${r.apellido}</td>
                    <td>${r.horaEntrada}</td>
                    <td>${r.horaSalida}</td>
                    <td>${r.duracion}</td>
                    <!-- Otros campos de registro aquí -->
                </tr>
            </c:forEach>
            </tbody>
        </table>
            </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript" charset="utf8" src="assets/DataTables/datatables.min.js"></script>
<script type="text/javascript" charset="utf8" src="assets/js/main.js"></script>
</body>
</c:if>
<c:if test="${tipoSesion != 'adminBackup'}">
    <meta http-equiv="refresh" content="0;url=404.jsp" />
</c:if>
</html>
