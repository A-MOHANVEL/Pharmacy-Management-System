package com.example.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/pharmacy"; // Replace 'pharmacy' with your database name
    private static final String USER = "root"; // Replace with your database username
    private static final String PASSWORD = "1234"; // Replace with your database password

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL JDBC Driver not found.", e);
        }
        
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
