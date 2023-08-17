<%@ page import="com.example.definitivanacho2.model.Usuario" %>
<%@ page import="com.example.definitivanacho2.model.Registro" %>
<%@ page import="com.example.definitivanacho2.model.DAO.DaoUsuario" %>
<%@ page import="com.example.definitivanacho2.model.DAO.DaoRegistro" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${tipoSesion == 'admin'}">
  <%
    session.removeAttribute("update");
  %>
  <html>
<head>
  <title>Registros User</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
  <style>
    /* Estilo personalizado para la barra de navegación */
    .navbar-custom {
      background-color: #000; /* Fondo negro */
    }

    /* Estilo para las opciones de navegación */
    .navbar-custom .nav-link {
      position: relative;
      color: #fff; /* Texto blanco */
      transition: color 0.2s; /* Transición de color al pasar el cursor */
    }

    /* Estilo para la animación al pasar el cursor */
    .navbar-custom .nav-link::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 2px;
      background-color: forestgreen; /* Línea azul */
      transform: scaleX(0); /* Inicialmente la línea no se muestra */
      transition: transform 0.3s; /* Transición de la animación */
    }

    /* Estilo para la animación al pasar el cursor */
    .navbar-custom .nav-link:hover::after {
      transform: scaleX(1); /* Al pasar el cursor, la línea aparece */
    }
    .container {
      background-color: rgba(255, 255, 255, 0.8); /* Fondo con transparencia */
      backdrop-filter: blur(10px); /* Efecto de desenfoque */
    }

    /* Estilos para el footer */
    footer {
      background-color: #000; /* Fondo negro */
      color: #fff; /* Texto blanco */
      padding: 20px 0;
    }

    footer p {
      margin: 0;
    }
  </style>
</head>

<body>
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
        <a class="nav-link" href="#">Mis Registros</a>
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

<div class="container mt-4" style="font-family: Arial">
  <div class="jumbotron">
    <h1>Mis Registros</h1>
    <div class="table-responsive">
      <input type="text" name="daterange"/>
      <input type="button" class="btn btn-outline-info" value="Limpiar Rango" onclick="location.reload();">
      <script>
        $(function() {
          // Inicializa el DataTable y guárdalo en una variable.
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
            console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));

            // Filtrado en el DataTable basado en el rango
            table.rows().every(function(index, tabLoop, rowLoop) {
              var date = new Date(this.data()[1]);

              if (date >= start.toDate() && date <= end.toDate()) {
                $(this.node()).show();
              } else {
                $(this.node()).hide();
              }
            });

            table.page.len(25).draw();
          });
        });
      </script>
      <table id="example" class="table table-striped table-bordered" style="font-family: Arial">
        <thead>
        <tr>
          <th>ID de Registro</th>
          <th>Hora de Entrada</th>
          <th>Hora de Salida</th>
        </tr>
        </thead>
        <%
          DaoRegistro daoRegistro = new DaoRegistro();
          Usuario usuarioActual = (Usuario) request.getSession().getAttribute("usuarioActual");
          int idPersonal = usuarioActual.getIdPersonal();
          List<Registro> registros = daoRegistro.findAllById(idPersonal);
          request.getSession().setAttribute("registros", registros);
        %>
        <tbody>
        <c:forEach var="registro" items="${sessionScope.registros}">
          <tr>
            <td>${registro.idRegistro}</td>
            <td>${registro.horaEntrada}</td>
            <td>${registro.horaSalida}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>

</body>

</html>
</c:if>
<c:if test="${tipoSesion != 'admin'}">
  <meta http-equiv="refresh" content="0;url=404.jsp" />
</c:if>