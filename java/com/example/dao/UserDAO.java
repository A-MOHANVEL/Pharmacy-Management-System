package com.example.dao;

import com.example.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public boolean registerUser(String phnumber, String password) throws SQLException {
        String query = "INSERT INTO users (phnumber, password) VALUES (?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, phnumber);
            stmt.setString(2, password);
            return stmt.executeUpdate() > 0;
        }
    }
   
    public boolean validateUser(String phnumber, String password) throws SQLException {
        String query = "SELECT * FROM users WHERE phnumber = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, phnumber);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }
}
