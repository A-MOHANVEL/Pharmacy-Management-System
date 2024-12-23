<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Cart Status</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid black;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Update Cart Status</h1>
    <%
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();

            // Update status if a form submission is detected
            String updateId = request.getParameter("id");
            String newStatus = request.getParameter("status");

            if (updateId != null && newStatus != null) {
                String updateQuery = "UPDATE cart SET status = ? WHERE id = ? AND status = 'Pending'";
                ps = conn.prepareStatement(updateQuery);
                ps.setString(1, newStatus);
                ps.setInt(2, Integer.parseInt(updateId));
                int rowsUpdated = ps.executeUpdate();
                if (rowsUpdated > 0) {
                    out.println("<p>Status updated successfully!</p>");
                } else {
                    out.println("<p>Failed to update status. Ensure it is currently 'Pending'.</p>");
                }
            }

            // Fetch all rows with status 'Pending'
            String fetchQuery = "SELECT id, phnumber, name, address, order_date, order_time, tablet_names, total_cost FROM cart WHERE status = 'Pending'";
            ps = conn.prepareStatement(fetchQuery);
            rs = ps.executeQuery();
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Phone Number</th>
            <th>Name</th>
            <th>Address</th>
            <th>Order Date</th>
            <th>Order Time</th>
            <th>Tablet Names</th>
            <th>Total Cost</th>
            <th>Actions</th>
        </tr>
        <%
            while (rs.next()) {
                int id = rs.getInt("id");
                String phnumber = rs.getString("phnumber");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String orderDate = rs.getString("order_date");
                String orderTime = rs.getString("order_time");
                String tabletNames = rs.getString("tablet_names");
                double totalCost = rs.getDouble("total_cost");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= phnumber %></td>
            <td><%= name %></td>
            <td><%= address %></td>
            <td><%= orderDate %></td>
            <td><%= orderTime %></td>
            <td><%= tabletNames %></td>
            <td><%= totalCost %></td>
            <td>
                <form method="POST" action="CartUpdateStatus.jsp">
                    <input type="hidden" name="id" value="<%= id %>">
                    <button type="submit" name="status" value="Accept">Accept</button>
                    <button type="submit" name="status" value="Reject">Reject</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error fetching or updating data. Please try again later.</p>");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
