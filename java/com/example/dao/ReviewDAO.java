package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.example.model.Review;
import com.example.utils.DBConnection;

public class ReviewDAO {

    public boolean addReview(Review review) {
        try (Connection connection = DBConnection.getConnection()) {
            String sql = "INSERT INTO reviews (name, phnumber, address, review) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, review.getName());
            stmt.setString(2, review.getPhnumber());
            stmt.setString(3, review.getAddress());
            stmt.setString(4, review.getReview());

            int rowsAffected = stmt.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
