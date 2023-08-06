package com.example.definitivanacho2.controller;

import com.example.definitivanacho2.model.Usuario;
import com.example.definitivanacho2.model.DAO.DaoUsuario;
import com.example.definitivanacho2.model.DAO.DaoRegistro;
import com.example.definitivanacho2.model.Registro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@WebServlet(name = "EntradaServlet", value = "/entrada-servlet")
public class EntradaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean confirmarSalida = Boolean.parseBoolean(request.getParameter("confirmarSalida"));
        if (confirmarSalida) {
            HttpSession session = request.getSession(false);
            Registro registro = (Registro) session.getAttribute("registroAbierto");
            if (registro != null) {
                java.util.Date date = new java.util.Date();
                Timestamp currentTimestamp = new Timestamp(date.getTime());
                registro.setHoraSalida(currentTimestamp);
                DaoRegistro daoRegistro = new DaoRegistro();
                daoRegistro.update(registro);
                request.getSession().setAttribute("registro", registro);
                response.sendRedirect("salida.jsp");
                return;
            }
        }

        int idPersonal = Integer.parseInt(request.getParameter("idPersonal"));
        String contrasena = request.getParameter("contrasena");

        DaoUsuario dao = new DaoUsuario();
        Usuario user = dao.findOneByIdAndPassword(idPersonal, contrasena);

        if (user != null) {
            request.getSession().setAttribute("usuario", user);
            java.util.Date date = new java.util.Date();
            Timestamp currentTimestamp = new Timestamp(date.getTime());

            DaoRegistro daoRegistro = new DaoRegistro();
            Registro registro = daoRegistro.findOpenRegistro(idPersonal);

            if (registro == null) {
                registro = new Registro();
                registro.setIdPersonal(idPersonal);
                registro.setHoraEntrada(currentTimestamp);
                daoRegistro.save(registro);
            } else {
                long diferenciaMillis = currentTimestamp.getTime() - registro.getHoraEntrada().getTime();
                long diferenciaHoras = diferenciaMillis / (1000 * 60 * 60);

                if (diferenciaHoras < 1) {
                    HttpSession session = request.getSession(true);
                    request.getSession().setAttribute("registro", registro);
                    session.setAttribute("registroAbierto", registro);
                    session.setAttribute("tipoSesion", "registro");
                    response.sendRedirect("confirmarSalida.jsp");
                    return;
                } else {
                    registro.setHoraSalida(currentTimestamp);
                    daoRegistro.update(registro);
                    request.getSession().setAttribute("registro", registro);
                    response.sendRedirect("salida.jsp");
                    return;
                }
            }

            List<Registro> registros = daoRegistro.findAllById(idPersonal);
            request.setAttribute("registros", registros);
            request.getSession().setAttribute("registro", registro);
            response.sendRedirect("entrada.jsp");
        } else {

            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Sistema Registro Personal UTEZ - Inicio de Sesión</title>");
            // Enlace a la hoja de estilos de Bootstrap
            out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
            out.println("<link rel=\"shortcut icon\" href=\"assets/img/DALL·E.ico\" />");
            out.println("<style>");
            out.println("body {");
            out.println("    background-size: cover;");
            out.println("    background-repeat: no-repeat;");
            out.println("    background-attachment: fixed;");
            out.println("    background-position: center center;");
            out.println("}");
            out.println(".jumbotron {");
            out.println("    backdrop-filter: blur(8px);");
            out.println("    background-color: rgba(255, 255, 255, 0.5);");
            out.println("    padding: 2rem;");
            out.println("}");
            out.println(".container {");
            out.println("    backdrop-filter: blur(8px);");
            out.println("    background-color: rgba(255, 255, 255, 0.5);");
            out.println("    padding: 2rem;");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body background=\"assets/img/utezzzz.jpg\">");
            out.println("<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark navbar-custom\">");
            out.println("<a class=\"navbar-brand\" href=\"#\"><img src=\"assets/img/DALL·E.png\" width=\"40\" height=\"40\">  SRP UTEZ</a>");
            out.println("<button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarNav\""
                    + "aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">");
            out.println("<span class=\"navbar-toggler-icon\"></span>");
            out.println("</button>");
            out.println("<div class=\"collapse navbar-collapse\" id=\"navbarNav\">");
            out.println("<ul class=\"navbar-nav ml-auto\">");
            out.println("<li class=\"nav-item\">");
            out.println("<a class=\"nav-link\" href=\"index.jsp\">Regresar</a>");
            out.println("</li>");
            out.println("</ul>");
            out.println("</div>");
            out.println("</nav>");
            out.println("<div class=\"container mt-4\">");
            out.println("<div class=\"jumbotron\">");
            out.println("<h1>Error de Registro</h1>");
            out.println("<p>ID o Clave incorrectos. Inténtalo de nuevo.</p>");
            out.println("<a href=\"index.jsp\" class=\"btn btn-outline-dark\">Regresar</a>");
            out.println("</div>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }


}
