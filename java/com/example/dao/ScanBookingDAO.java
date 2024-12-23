package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.example.model.ScanBooking;
import com.example.utils.DBConnection;

public class ScanBookingDAO {

    public boolean bookScan(ScanBooking scanBooking) {
        boolean status = false;
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DBConnection.getConnection();
            String query = "INSERT INTO scans (phnumber, patient_name, address, age, scan_type) VALUES (?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);
            pst.setString(1, scanBooking.getPhnumber());
            pst.setString(2, scanBooking.getPatientName());
            pst.setString(3, scanBooking.getAddress());
            pst.setInt(4, scanBooking.getAge());
            pst.setString(5, scanBooking.getScanType());

            int result = pst.executeUpdate();
            if (result > 0) {
                status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return status;
    }
}
