<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Scan Bookings</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        h2 {
            text-align: center;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Scan Booking Details</h2>
    <table>
        <tr>
            <th>Phone Number</th>
            <th>Patient Name</th>
            <th>Address</th>
            <th>Age</th>
            <th>Scan Type</th>
            <th>Status</th>
        </tr>
        <%
            String url = "jdbc:mysql://localhost:3306/pharmacy"; // Update with your database details
            String user = "root"; // Update with your database username
            String password = "1234"; // Update with your database password
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                String query = "SELECT * FROM scans WHERE status != 'pending'";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();

                boolean hasRecords = false;
                while (rs.next()) {
                    hasRecords = true;
        %>
        <tr>
            <td><%= rs.getString("phnumber") %></td>
            <td><%= rs.getString("patient_name") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getInt("age") %></td>
            <td><%= rs.getString("scan_type") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
        <%
                }
                if (!hasRecords) {
        %>
        <tr>
            <td colspan="6" style="text-align: center;">No non-pending scan bookings found.</td>
        </tr>
        <%
                }
            } catch (Exception e) {
        %>
        <tr>
            <td colspan="6" class="error">Error: <%= e.getMessage() %></td>
        </tr>
        <%
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
</body>
</html>
