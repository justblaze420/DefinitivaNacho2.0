package com.example.definitivanacho2.model.DAO;

import com.example.definitivanacho2.model.Registro;
import com.example.definitivanacho2.model.Usuario;
import com.example.definitivanacho2.model.DAO.DaoUsuario;
import java.sql.*;
import java.sql.Timestamp;
import java.util.Date;
import com.example.definitivanacho2.model.Usuario;
import com.example.definitivanacho2.utils.MysqlConnector;
import java.util.List;
import java.util.ArrayList;

public class DaoRegistro {
    private Connection conn;
    public DaoRegistro() {
        MysqlConnector conn = new MysqlConnector();
        this.conn = conn.connect();
    }
    public void update(Registro registro) {
        try {
            String query = "UPDATE Registros SET horaSalida = ? WHERE idRegistro = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setTimestamp(1, registro.getHoraSalida());
            preparedStatement.setInt(2, registro.getIdRegistro());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void save(Registro registro) {
        String sql = "INSERT INTO Registros (idPersonal, horaEntrada) VALUES (?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, registro.getIdPersonal());
            stmt.setTimestamp(2, registro.getHoraEntrada());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    registro.setIdRegistro(generatedKeys.getInt(1));
                }
                else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Registro findOpenRegistro(int idPersonal) {
        String sql = "SELECT * FROM Registros WHERE idPersonal = ? AND horaSalida IS NULL ORDER BY horaEntrada DESC LIMIT 1";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPersonal);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Registro registro = new Registro();
                    registro.setIdRegistro(rs.getInt("idRegistro"));
                    registro.setIdPersonal(rs.getInt("idPersonal"));
                    registro.setHoraEntrada(rs.getTimestamp("horaEntrada"));
                    return registro;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Registro> findAllById(int idPersonal) {
        List<Registro> registros = new ArrayList<>();
        try {
            String query = "SELECT * FROM Registros WHERE idPersonal = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, idPersonal);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Registro registro = new Registro();
                registro.setIdRegistro(resultSet.getInt("idRegistro"));
                registro.setIdPersonal(resultSet.getInt("idPersonal"));
                registro.setHoraEntrada(resultSet.getTimestamp("horaEntrada"));
                registro.setHoraSalida(resultSet.getTimestamp("horaSalida"));
                registros.add(registro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return registros;
    }


    public List<Registro> findAll() {
        List<Registro> listaRegistros = new ArrayList<>();
        MysqlConnector con = new MysqlConnector();
        Connection conexion = con.connect();
        try {
            PreparedStatement stmt = conexion.prepareStatement(
                    "SELECT r.idRegistro, r.idPersonal, r.horaEntrada, r.horaSalida, p.nombre, p.apellido, TIMEDIFF(r.horaSalida, r.horaEntrada) AS duracion " +
                            "FROM registros r " +
                            "JOIN personal p ON r.idPersonal = p.idPersonal");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Registro registro = new Registro();
                registro.setIdRegistro(res.getInt("idRegistro"));
                registro.setIdPersonal(res.getInt("idPersonal"));
                registro.setHoraEntrada(res.getTimestamp("horaEntrada"));
                registro.setHoraSalida(res.getTimestamp("horaSalida"));
                registro.setNombre(res.getString("nombre")); // Asegúrate de que tu clase Registro tenga estos campos y métodos
                registro.setApellido(res.getString("apellido"));
                registro.setDuracion(res.getTime("duracion"));
                listaRegistros.add(registro);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaRegistros;
    }

}
