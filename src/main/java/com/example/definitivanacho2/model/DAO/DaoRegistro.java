package com.example.definitivanacho2.model.DAO;

import com.example.definitivanacho2.model.Registro;

import java.sql.*;
import java.sql.Timestamp;
import java.util.Date;
import com.example.definitivanacho2.model.Usuario;
import com.example.definitivanacho2.utils.MysqlConnector;
public class DaoRegistro {
    private Connection conn;
    public DaoRegistro() {
        MysqlConnector conn = new MysqlConnector();
        this.conn = conn.connect();
    }


    public void save(Registro registro) {
        String sql = "INSERT INTO registro (idPersonal, horaEntrada) VALUES (?, now())";

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
}
