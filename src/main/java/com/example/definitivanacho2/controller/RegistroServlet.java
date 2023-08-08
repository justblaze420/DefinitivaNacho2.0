package com.example.definitivanacho2.controller;

import com.example.definitivanacho2.model.DAO.DaoUsuario;
import com.example.definitivanacho2.model.Usuario;
import com.example.definitivanacho2.utils.MysqlConnector;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
@WebServlet(name = "RegistroServlet", value = "/registro-servlet")
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.getSession().removeAttribute("registro");
        String operacion = req.getParameter("operacion");
        String respuesta = "";

        if (operacion != null) {
            if (operacion.equals("delete")) {
                DaoUsuario dao = new DaoUsuario();
                dao.delete(Integer.parseInt(req.getParameter("id")));
                respuesta = "vistaConsultas.jsp";
            } else if (operacion.equals("update")) {
                DaoUsuario dao = new DaoUsuario();
                int id = Integer.parseInt(req.getParameter("id"));
                Usuario usr = (Usuario) dao.findOne(id);
                usr.setIdPersonal(id);
                req.getSession().setAttribute("update", "update");
                req.getSession().setAttribute("usuario", usr);
                respuesta = "registro.jsp";
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
        int idDepartamento = Integer.parseInt(req.getParameter("idDepartamento"));
        String usuario = req.getParameter("usuario");
        String contrasena = req.getParameter("contrasena");
        String passwordChangeRequested = req.getParameter("passwordChangeRequested");

        DaoUsuario dao = new DaoUsuario();
        String idPersonalParam = req.getParameter("idPersonal");

        if ("true".equals(passwordChangeRequested)) {
            String newPassword = req.getParameter("newPassword");
            if(newPassword != null && !newPassword.isEmpty()) {
                try (Connection con = new MysqlConnector().connect()) {
                    PreparedStatement stmt = con.prepareStatement("UPDATE personal SET contrasena = sha2(?,224) WHERE idPersonal = ?");
                    stmt.setString(1, newPassword);
                    stmt.setInt(2, Integer.parseInt(idPersonalParam));
                    stmt.executeUpdate();
                } catch(SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        } else {
            if (idPersonalParam != null && !idPersonalParam.isEmpty()) {
                int idPersonal = Integer.parseInt(req.getParameter("idPersonal"));
                dao.update(idPersonal, new Usuario(idPersonal, nombre, apellido, rol, idDepartamento, usuario, contrasena));
                req.getSession().removeAttribute("usuario");
            } else {
                int idPersonal;
                boolean exists = true;
                do {
                    idPersonal = 100 + new Random().nextInt(900);
                    Usuario user = dao.findOneById(idPersonal);
                    if (user == null) {
                        exists = false;
                    }
                } while (exists);

                dao.insert(new Usuario(idPersonal, nombre, apellido, rol, idDepartamento, usuario, contrasena));
            }
        }

        resp.sendRedirect("vistaConsultas.jsp");
    }
}