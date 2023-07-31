package com.example.definitivanacho2.utils;
import com.mysql.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlConnector {
        final String DBNAME = "integradoraNacho", USER = "admin", PASSWORD = "Cisco123!", TIMEZONE = "America/Mexico_City", USESSL = "false", PUBLICKEY = "true",
                DDLAUTO = "true", HOST = "db-integradora-3e.cgipavv1iqfi.us-east-1.rds.amazonaws.com";
        public Connection connect() {
            String dataSource =
                    String.format("jdbc:mysql://%s:3306/%s?user=%s&password=%s&serverTimezone=%s&useSSL=%s&allowPublicKeyRetrieval=%s&createDatabaseIfNotExist= %s", HOST, DBNAME, USER, PASSWORD, TIMEZONE, USESSL, PUBLICKEY, DDLAUTO);
            try {
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                return DriverManager.getConnection(dataSource);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return null;
        }
    }

