package com.example.definitivanacho2.controller;

import com.example.definitivanacho2.model.Usuario;
import com.example.definitivanacho2.model.Departamento;
import com.example.definitivanacho2.model.DAO.DaoUsuario;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "ShutdownServlet", value = "/shutdown-servlet")
public class ShutdownServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("adminUser");
        String contrasena = request.getParameter("adminPassword");

        DaoUsuario daoUsuario = new DaoUsuario();
        Usuario user = daoUsuario.findOneByUsuarioAndPassword(usuario, contrasena);

        if (user != null) {
            if (user.getRol().equals("Admin") || user.getRol().equals("Admin RH")) {
                request.getSession().removeAttribute("usuarioActual");
                request.getSession().setAttribute("habilitarRegistros", false);

                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("index.jsp?error=1");
            }
        } else {
            response.sendRedirect("index.jsp?error=1");
        }
    }
}