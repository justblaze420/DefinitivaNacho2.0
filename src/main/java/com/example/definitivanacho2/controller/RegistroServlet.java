package com.example.definitivanacho2.controller;

import com.example.definitivanacho2.model.DAO.DaoUsuario;
import com.example.definitivanacho2.model.Usuario;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
@WebServlet(name = "RegistroServlet", value = "/registro-servlet")
public class RegistroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        req.getSession().removeAttribute("registro");
        String operacion = req.getParameter("operacion");
        String respuesta = "";

        if (operacion.equals("delete")){
            DaoUsuario dao = new DaoUsuario();
            dao.delete(Integer.parseInt(req.getParameter("idPersonal")));
            respuesta = "vistaConsultas.jsp";
        }
        if (operacion.equals("update")){
            DaoUsuario dao = new DaoUsuario();
            int idPersonal = Integer.parseInt(req.getParameter("idPersonal"));
            Usuario prod = (Usuario) dao.findOne(idPersonal);
            prod.setIdPersonal(idPersonal);
            req.getSession().setAttribute("usuario",prod);

            respuesta ="registro.jsp";
        }

        //Falta regresar una respuesta
        resp.sendRedirect(respuesta);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String rol = req.getParameter("rol");
        String usuario = req.getParameter("usuario");
        String contraseña = req.getParameter("contrasena");



        DaoUsuario dao = new DaoUsuario();
        String idPersonalParam = req.getParameter("idPersonal");
        if (idPersonalParam != null && !idPersonalParam.isEmpty()) {
            int idPersonal = Integer.parseInt(req.getParameter("idPersonal"));
            //Es una operacion de update
            dao.update(idPersonal,new Usuario(idPersonal,nombre,apellido,rol,usuario,contraseña));
            req.getSession().removeAttribute("usuario");
        }else{
            dao.insert(new Usuario(0,nombre, apellido, rol, usuario, contraseña));
        }
        resp.sendRedirect("registro_exitoso.jsp");
    }
}