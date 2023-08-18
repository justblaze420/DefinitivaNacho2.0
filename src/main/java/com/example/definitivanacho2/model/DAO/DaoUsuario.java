package com.example.definitivanacho2.model.DAO;
import com.example.definitivanacho2.model.Usuario;
import com.example.definitivanacho2.model.Departamento;
import com.example.definitivanacho2.utils.MysqlConnector;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class DaoUsuario implements DaoRepository{
    private Connection getConnection() {
        MysqlConnector connector = new MysqlConnector();
        return connector.connect();
    }
    @Override
    public List<Usuario> findAll(int currentUserId) {
        List<Usuario> listaUsuarios = new ArrayList<>();
        MysqlConnector con = new MysqlConnector();
        Connection conexion = con.connect();
        try {
            PreparedStatement stmt = conexion.prepareStatement("SELECT personal.*, departamento.nombre AS nombreDepartamento FROM personal JOIN departamento ON personal.idDepartamento = departamento.idDepartamento WHERE personal.idPersonal != ?");
            stmt.setInt(1, currentUserId);
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Usuario usr = new Usuario();
                usr.setIdPersonal(res.getInt("idPersonal"));
                usr.setNombre(res.getString("nombre"));
                usr.setApellido(res.getString("apellido"));
                usr.setRol(res.getString("rol"));
                usr.setNombreDepartamento(res.getString("nombreDepartamento"));
                usr.setUsuario(res.getString("usuario"));
                usr.setContrasena(res.getString("contrasena"));
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
                usr.setIdDepartamento(res.getInt("idDepartamento"));
                usr.setUsuario(res.getString("usuario"));
                usr.setContrasena(res.getString("contrasena"));
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
                    "set nombre = ?, apellido = ?, rol = ?, idDepartamento = ?, usuario = ?" + "WHERE idPersonal = ?");
            stmt.setString(1, usr.getNombre());
            stmt.setString(2, usr.getApellido());
            stmt.setString(3, usr.getRol());
            stmt.setInt(4, usr.getIdDepartamento());
            stmt.setString(5, usr.getUsuario());
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

            PreparedStatement stmt = conection.prepareStatement("insert into personal (nombre, apellido, usuario, contrasena, rol, idDepartamento, registro)"
                    + "values(?,?,?,sha2(?,224),?,?,now())");
            stmt.setString(1, usr.getNombre());
            stmt.setString(2, usr.getApellido());
            stmt.setString(5, usr.getRol());
            stmt.setInt(6, usr.getIdDepartamento());
            stmt.setString(3, usr.getUsuario());
            stmt.setString(4, usr.getContrasena());

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
                usr.setIdDepartamento((res.getInt("idDepartamento")));
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


    public Usuario findOneByIdAndPassword(int idPersonal, String contrasena) {
        Usuario user = null;
        MysqlConnector connector = new MysqlConnector();

        try (Connection conn = connector.connect();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM personal WHERE idPersonal = ? AND contrasena = sha2(?,224)")) {

            ps.setInt(1, idPersonal);
            ps.setString(2, contrasena);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new Usuario(
                        rs.getInt("idPersonal"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("rol"),
                        rs.getInt("idDepartamento"),
                        rs.getString("usuario"),
                        rs.getString("contrasena")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return user;
    }

    public Usuario findOneByUsuarioAndPassword(String usuario, String contrasena) {
        Usuario user = null;
        MysqlConnector connector = new MysqlConnector();

        try (Connection conn = connector.connect();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM personal WHERE usuario = ? AND contrasena = sha2(?,224)")) {

            ps.setString(1, usuario);
            ps.setString(2, contrasena);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new Usuario(
                        rs.getInt("idPersonal"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("rol"),
                        rs.getInt("idDepartamento"),
                        rs.getString("usuario"),
                        rs.getString("contrasena")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return user;
    }

    public Usuario findOneById(int idPersonal) {
        String sql = "SELECT * FROM Usuario WHERE idPersonal = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idPersonal);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String nombre = rs.getString("nombre");
                    String apellido = rs.getString("apellido");
                    String rol = rs.getString("rol");
                    int idDepartamento = rs.getInt("idDepartamento");
                    String usuario = rs.getString("usuario");
                    String contrasena = rs.getString("contrasena");
                    return new Usuario(idPersonal, nombre, apellido, rol, idDepartamento, usuario, contrasena);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Departamento getDepartamentoPorId(int id) {
        Departamento departamento = null;
        String sql = "SELECT * FROM departamento WHERE idDepartamento = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                departamento = new Departamento();
                departamento.setIdDepartamento(rs.getInt("idDepartamento"));
                departamento.setNombre(rs.getString("nombre"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return departamento;
    }


}
