package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.example.model.Appointment;
import com.example.utils.DBConnection;

public class AppointmentDao {

    public boolean saveAppointment(Appointment appointment) {
        boolean isSaved = false;
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO appointments (phnumber, name, age, address, specialist, reason) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, appointment.getPhnumber());
            stmt.setString(2, appointment.getName());
            stmt.setInt(3, appointment.getAge());
            stmt.setString(4, appointment.getAddress());
            stmt.setString(5, appointment.getSpecialist());
            stmt.setString(6, appointment.getReason());

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                isSaved = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSaved;
    }
}
