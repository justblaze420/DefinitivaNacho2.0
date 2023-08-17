<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${tipoSesion == 'admin'}">
<%@ page import="com.example.definitivanacho2.model.DAO.DaoRegistro" %>
<%@ page import="com.example.definitivanacho2.model.DAO.DaoUsuario" %>
<%@ page import="com.example.definitivanacho2.model.Usuario" %>
<%@ page import="com.example.definitivanacho2.model.Registro" %>
<%@ page import="java.util.List" %>
    <%
        session.removeAttribute("update");
    %>

    <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registros</title>
    <!-- Hojas de estilo (CSS) -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/DataTables/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="assets/DataTables/DataTables-1.13.6/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="style.css" >
    <link rel="shortcut icon" href="assets/img/DALL·E.ico" />

    <!-- Scripts de JavaScript -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf8" src="assets/DataTables/datatables.min.js"></script>
    <script type="text/javascript" charset="utf8" src="assets/js/main.js"></script>
    <!-- Scripts de Data Range Picker -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

</head>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
    <a class="navbar-brand" href="bienvenidaAdmin.jsp"><img src="assets/img/DALL·E.png" width="40" height="40">  SRP UTEZ</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="bienvenidaAdmin.jsp">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="vistaEntradasAdmin.jsp">Mis Registros</a>
            </li>
            <c:if test="${sessionScope.usuario.rol != 'Admin RH'}">
                <li class="nav-item">
                    <a class="nav-link" href="registroAdmin.jsp?nuevo=true">Registrar Usuarios</a>
                </li>
            </c:if>
            <li class="nav-item">
                <a class="nav-link" href="vistaConsultasAdmin.jsp">Usuarios</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="vistaRegistrosAdmin.jsp">Entradas/Salidas</a>
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
            <input type="text" name="daterange"/>
            <input type="button" class="btn btn-outline-info" value="Limpiar Rango" onclick="location.reload();">
            <script>
                $(function() {
                    var table = $('#example').DataTable();

                    $('input[name="daterange"]').daterangepicker({
                        opens: 'left',
                        locale: {
                            format: 'DD/MM/YYYY',
                            applyLabel: 'Aplicar',
                            cancelLabel: 'Cancelar',
                            fromLabel: 'Desde',
                            toLabel: 'Hasta',
                            customRangeLabel: 'Rango personalizado',
                            daysOfWeek: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi','Sa'],
                            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                            firstDay: 1
                        }
                    }, function(start, end, label) {
                        var totals = {};
                        var grandTotalHoras = 0;
                        var grandTotalMinutos = 0;

                        table.rows().every(function(index, tabLoop, rowLoop) {
                            var date = new Date(this.data()[5]);
                            var idPersonal = this.data()[1];
                            var nombrePersonal = this.data()[2];
                            var apellidoPersonal = this.data()[3];
                            var duration = this.data()[7].split(":");
                            var hours = parseInt(duration[0]);
                            var minutes = parseInt(duration[1]);

                            if (isNaN(hours) || isNaN(minutes)) {
                                $(this.node()).hide();  // Oculta el registro si no es válido
                                return;
                            }

                            if (date >= start.toDate() && date <= end.toDate()) {
                                $(this.node()).show();

                                if (totals[idPersonal]) {
                                    totals[idPersonal].horas += hours;
                                    totals[idPersonal].minutos += minutes;
                                } else {
                                    totals[idPersonal] = { nombre: nombrePersonal, apellido: apellidoPersonal, horas: hours, minutos: minutes };
                                }

                                if (totals[idPersonal].minutos >= 60) {
                                    totals[idPersonal].horas += 1;
                                    totals[idPersonal].minutos -= 60;
                                }

                                grandTotalHoras += hours;
                                grandTotalMinutos += minutes;

                                if (grandTotalMinutos >= 60) {
                                    grandTotalHoras += 1;
                                    grandTotalMinutos -= 60;
                                }
                            } else {
                                $(this.node()).hide();
                            }
                        });

                        var totalsDiv = $("#totals");
                        totalsDiv.empty();

                        var tableContent = '<table border="1" class="table table-hover table-bordered table-striped" style="font-family: Arial"><thead><tr><th>ID Personal</th><th>Nombre</th><th>Horas</th><th>Minutos</th></tr></thead><tbody>';

                        for (var id in totals) {
                            tableContent += "<tr><td>" + id + "</td><td>" + totals[id].nombre + " " + totals[id].apellido + "</td><td>" + totals[id].horas + "</td><td>" + totals[id].minutos + "</td></tr>";
                        }

                        tableContent += "</tbody></table>";
                        tableContent += "<strong style='font-family: Arial'>Total Horas: " + grandTotalHoras + " - Minutos: " + grandTotalMinutos + "</strong>";

                        totalsDiv.append(tableContent);
                        table.page.len(-1).draw();
                    });
                });
            </script>
            <table id="example" class="table table-striped table-bordered" style="font-family: Arial">
            <thead>
            <tr>
                <th>ID Registro</th>
                <th>ID Personal</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Departamento</th>
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
                            <td>${r.nombreDepartamento}</td>
                            <td>${r.horaEntrada}</td>
                            <td>${r.horaSalida}</td>
                            <td>${r.duracion}</td>
                            <!-- Otros campos de registro aquí -->
                        </tr>
                    </c:forEach>
            </tbody>
        </table>
            <form action="ReporteServlet" method="post">
                <button type="submit" class="btn btn-outline-danger"><img src="assets/img/pdf.png" width="20" height="20">Generar PDF</button>
            </form><br>
            <div id="totals"></div>
            </div>
    </div>
</div>
</body>

</html>
</c:if>
<c:if test="${tipoSesion != 'admin'}">
    <meta http-equiv="refresh" content="0;url=404.jsp" />
</c:if>