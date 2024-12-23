<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cart Details</title>
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
    <h2>Cart Details</h2>
    <table>
        <tr>
            <th>Phone Number</th>
            <th>Name</th>
            <th>Address</th>
            <th>Status</th>
            <th>Order Date</th>
            <th>Order Time</th>
            <th>Tablet Names</th>
            <th>Total Cost</th>
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

                // Corrected query based on your table columns
                String query = "SELECT * FROM cart WHERE status != 'pending'";  // Corrected to use `status` column
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();

                boolean hasRecords = false;
                while (rs.next()) {
                    hasRecords = true;
        %>
        <tr>
            <td><%= rs.getString("phnumber") %></td>    <!-- Phone number -->
            <td><%= rs.getString("name") %></td>        <!-- Name -->
            <td><%= rs.getString("address") %></td>     <!-- Address -->
            <td><%= rs.getString("status") %></td>      <!-- Status -->
            <td><%= rs.getString("order_date") %></td>  <!-- Order date -->
            <td><%= rs.getString("order_time") %></td>  <!-- Order time -->
            <td><%= rs.getString("tablet_names") %></td><!-- Tablet names -->
            <td><%= rs.getDouble("total_cost") %></td>  <!-- Total cost -->
        </tr>
        <%
                }
                if (!hasRecords) {
        %>
        <tr>
            <td colspan="8" style="text-align: center;">No non-pending cart items found.</td>
        </tr>
        <%
                }
            } catch (Exception e) {
        %>
        <tr>
            <td colspan="8" class="error">Error: <%= e.getMessage() %></td>
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
