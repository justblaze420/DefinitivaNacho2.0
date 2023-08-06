package com.example.definitivanacho2.filter;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import com.example.definitivanacho2.controller.UsuarioServlet;
@WebFilter(urlPatterns = {
        "/bienvenidaAdmin.jsp",
        "/bienvenidaUser.jsp",
        "/bienvenida.jsp",
        "/registro.jsp",
        "/registroAdmin.jsp",
        "/vistaConsultas.jsp",
        "/vistaConsultasAdmin.jsp",
        "/vistaEntradasAdmin.jsp",
        "/vistaEntradasUser.jsp",
        "/vistaRegistros.jsp",
        "/vistaRegistrosAdmin.jsp",
        "/confirmarSalida.jsp"
})
public class AuthenticationFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);

        if (session == null || session.getAttribute("tipoSesion") == null) {
            httpResponse.sendRedirect("404.jsp"); // redirigir a la página de error
            return;
        }

// Establecer encabezados para evitar el almacenamiento en caché
        httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
        httpResponse.setDateHeader("Expires", 0); // Proxies

        chain.doFilter(request, response);

    }

    public void destroy() {
        // Limpieza si es necesario
    }
}
