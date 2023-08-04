package com.example.definitivanacho2.controller;

import com.example.definitivanacho2.model.DAO.DaoUsuario;
import com.example.definitivanacho2.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "RegistroAdminServlet", value = "/registroadminservlet")
public class RegistroAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.getSession().removeAttribute("registro");
        String operacion = req.getParameter("operacion");
        String respuesta = "";

        if (operacion != null) {
            if (operacion.equals("delete")) {
                DaoUsuario dao = new DaoUsuario();
                dao.delete(Integer.parseInt(req.getParameter("id")));
                respuesta = "vistaConsultasAdmin.jsp";
            } else if (operacion.equals("update")) {
                DaoUsuario dao = new DaoUsuario();
                int id = Integer.parseInt(req.getParameter("id"));
                Usuario usr = (Usuario) dao.findOne(id);
                usr.setIdPersonal(id);
                req.getSession().setAttribute("usuario", usr);
                respuesta = "registroAdmin.jsp";
            }

            //Falta regresar una respuesta
            resp.sendRedirect(respuesta);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String rol = req.getParameter("rol");
        String usuario = req.getParameter("usuario");
        String contrasena = req.getParameter("contrasena");


        DaoUsuario dao = new DaoUsuario();
        String idPersonalParam = req.getParameter("idPersonal");
        if (idPersonalParam != null && !idPersonalParam.isEmpty()) {
            int idPersonal = Integer.parseInt(req.getParameter("idPersonal"));
            dao.update(idPersonal, new Usuario(idPersonal, nombre, apellido, rol, usuario, contrasena));
            req.getSession().removeAttribute("usuario");
        } else {
            int idPersonal;
            boolean exists = true;
            do {
                idPersonal = 100 + new Random().nextInt(900); // Genera un número aleatorio entre 100 y 999.
                Usuario user = dao.findOneById(idPersonal);
                if (user == null) {
                    exists = false;
                }
            } while (exists);

            // Insertar el nuevo usuario
            dao.insert(new Usuario(idPersonal, nombre, apellido, rol, usuario, contrasena));
        }
        resp.sendRedirect("vistaConsultasAdmin.jsp");
    }
}
