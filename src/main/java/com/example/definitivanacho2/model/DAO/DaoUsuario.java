package com.example.definitivanacho2.model.DAO;
import com.example.definitivanacho2.model.Usuario;
import com.example.definitivanacho2.utils.MysqlConnector;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class DaoUsuario implements DaoRepository{
    @Override
    public List findAll() {
        List<Usuario> listaUsuarios = new ArrayList<>();
        MysqlConnector con = new MysqlConnector();
        Connection conexion = con.connect();
        try {
            PreparedStatement stmt = conexion.prepareStatement("SELECT * FROM personal");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Usuario usr = new Usuario();
                usr.setIdPersonal(res.getInt("idPersonal"));
                usr.setNombre(res.getString("nombre"));
                usr.setApellido(res.getString("apellido"));
                usr.setRol(res.getString("rol"));
                usr.setUsuario(res.getString("usuario"));
                usr.setContrasena(res.getString("contrasena"));
                usr.getIdDepartamento();
                usr.setRegistro(res.getDate("registro"));
                listaUsuarios.add(usr);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaUsuarios;
    }
    @Override
    public Object findOne(int idPersonal) {
        Usuario usr = new Usuario();
        MysqlConnector con = new MysqlConnector();
        Connection conexion = con.connect();
        try {
            PreparedStatement stmt = conexion.prepareStatement("select * from personal where idPersonal=?");
            stmt.setInt(1, idPersonal);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                usr.setIdPersonal(res.getInt("idPersonal"));
                usr.setNombre(res.getString("nombre"));
                usr.setApellido(res.getString("apellido"));
                usr.setRol(res.getString("rol"));
                usr.setUsuario(res.getString("usuario"));
                usr.setContrasena(res.getString("contrasena"));
                usr.getIdDepartamento();
                usr.setRegistro(res.getDate("registro"));
            } else {
                usr.setUsuario("No existe el Usuario con el id " + idPersonal);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usr;
    }

    @Override
    public boolean update(int idPersonal, Usuario usr) {
        boolean res = false;
        MysqlConnector conector = new MysqlConnector();
        Connection con = conector.connect();
        try {
            PreparedStatement stmt =con.prepareStatement("update personal "+
                    "set nombre = ?, apellido = ?, rol = ?, usuario = ?, contrasena = ?" + "WHERE idPersonal = ?");
            stmt.setString(1, usr.getNombre());
            stmt.setString(2, usr.getApellido());
            stmt.setString(3, usr.getRol());
            stmt.setString(4, usr.getUsuario());
            stmt.setString(5, usr.getContrasena());
            stmt.setInt(6, usr.getIdPersonal());
            if (stmt.executeUpdate()>0) res = true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return res;
    }

    @Override
    public boolean delete(int idPersonal) {
        MysqlConnector con = new MysqlConnector();
        Connection conexion = con.connect();
        PreparedStatement stmt = null;
        try {
            stmt = conexion.prepareStatement("delete from personal where idPersonal=?");
            stmt.setInt(1, idPersonal);
            int resultado = stmt.executeUpdate();
            //Si el resultado es diferente de cero significa que si se hizo el delete
            if (resultado != 0) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public boolean insert(Usuario usr) {
        boolean resultado = false;
        MysqlConnector con = new MysqlConnector();
        Connection conection = con.connect();

        try {
            PreparedStatement stmt = conection.prepareStatement("insert into personal (nombre, apellido, usuario, contrasena, rol, registro)"
                    + "values(?,?,?,?,?,?)");
            stmt.setString(1, usr.getNombre());
            stmt.setString(2, usr.getApellido());
            stmt.setString(5, usr.getRol());
            stmt.setString(3, usr.getUsuario());
            stmt.setString(4, usr.getContrasena());
            if (usr.getRegistro() != null) {
                stmt.setDate(6, new java.sql.Date(usr.getRegistro().getTime()));
            } else {
                stmt.setDate(6, new java.sql.Date(System.currentTimeMillis()));
            }
            int res = stmt.executeUpdate();
            if (res >= 1) resultado = true;

        } catch (SQLException e) {
            throw new RuntimeException("Error al insertar en la base de datos", e);
        }
        return resultado;
    }
    public Object findOne1(String nombre, String apellido, String contrasena) {
        Usuario usr = new Usuario();
        MysqlConnector con = new MysqlConnector();
        Connection conexion = con.connect();
        try {
            PreparedStatement stmt = conexion.prepareStatement("select * from personal where idPersonal=?");
            stmt.setString(1, nombre);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                usr.setIdPersonal(res.getInt("idPersonal"));
                usr.setNombre(res.getString("nombre"));
                usr.setApellido(res.getString("apellido"));
                usr.setRol(res.getString("rol"));
                usr.setUsuario(res.getString("usuario"));
                usr.setContrasena(res.getString("contrasena"));
                usr.setRegistro(res.getDate("registro"));
            } else {
                usr.setUsuario("No existe el Usuario con el id " + nombre);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usr;
    }

    public Usuario findOneByUsuarioAndPassword(String usuario, String contrasena) {
        Usuario user = null;
        MysqlConnector connector = new MysqlConnector();

        try (Connection conn = connector.connect();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM personal WHERE usuario = ? AND contrasena = ?")) {

            ps.setString(1, usuario);
            ps.setString(2, contrasena);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new Usuario(
                        rs.getInt("idPersonal"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("rol"),
                        rs.getString("usuario"),
                        rs.getString("contrasena")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return user;
    }



}
