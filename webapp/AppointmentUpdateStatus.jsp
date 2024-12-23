<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Appointment Status</title>
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
    <h1>Update Appointment Status</h1>
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
                String updateQuery = "UPDATE appointments SET status = ? WHERE id = ? AND status = 'Pending'";
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
            String fetchQuery = "SELECT id, phnumber, name, age, address, specialist, reason, status FROM appointments WHERE status = 'Pending'";
            ps = conn.prepareStatement(fetchQuery);
            rs = ps.executeQuery();
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Phone Number</th>
            <th>Name</th>
            <th>Age</th>
            <th>Address</th>
            <th>Specialist</th>
            <th>Reason</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <%
            while (rs.next()) {
                int id = rs.getInt("id");
                String phnumber = rs.getString("phnumber");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String address = rs.getString("address");
                String specialist = rs.getString("specialist");
                String reason = rs.getString("reason");
                String status = rs.getString("status");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= phnumber %></td>
            <td><%= name %></td>
            <td><%= age %></td>
            <td><%= address %></td>
            <td><%= specialist %></td>
            <td><%= reason %></td>
            <td><%= status %></td>
            <td>
                <form method="POST" action="AppointmentUpdateStatus.jsp">
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
