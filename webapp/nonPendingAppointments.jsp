<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Non-Pending Appointments</title>
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
    </style>
</head>
<body>
    <h2>Non-Pending Appointments</h2>
    <table>
        <tr>
            <th>Phone Number</th>
            <th>Name</th>
            <th>Age</th>
            <th>Address</th>
            <th>Specialist</th>
            <th>Reason</th>
            <th>Status</th>
        </tr>
        <%
            // Database connection setup
            String url = "jdbc:mysql://localhost:3306/pharmacy"; // Update with your database details
            String user = "root"; // Update with your database username
            String password = "1234"; // Update with your database password
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                String query = "SELECT * FROM appointments WHERE status != 'pending'";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("phnumber") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getInt("age") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("specialist") %></td>
            <td><%= rs.getString("reason") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <tr>
            <td colspan="7" style="text-align: center; color: red;">Error fetching data from database.</td>
        </tr>
        <%
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
