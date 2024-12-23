<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Scan Status</title>
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
    <h1>Update Scan Status</h1>
    <%
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();

            // Update status if a form submission is detected
            String updateId = request.getParameter("phnumber");
            String newStatus = request.getParameter("status");

            if (updateId != null && newStatus != null) {
                String updateQuery = "UPDATE scans SET status = ? WHERE phnumber = ? AND status = 'Pending'";
                ps = conn.prepareStatement(updateQuery);
                ps.setString(1, newStatus);
                ps.setString(2, updateId);
                int rowsUpdated = ps.executeUpdate();
                if (rowsUpdated > 0) {
                    out.println("<p>Status updated successfully!</p>");
                } else {
                    out.println("<p>Failed to update status. Ensure it is currently 'Pending'.</p>");
                }
            }

            // Fetch all rows with status 'Pending'
            String fetchQuery = "SELECT phnumber, patient_name, address, age, scan_type FROM scans WHERE status = 'Pending'";
            ps = conn.prepareStatement(fetchQuery);
            rs = ps.executeQuery();
    %>
    <table>
        <tr>
            <th>Phone Number</th>
            <th>Patient Name</th>
            <th>Address</th>
            <th>Age</th>
            <th>Scan Type</th>
            <th>Actions</th>
        </tr>
        <%
            while (rs.next()) {
                String phnumber = rs.getString("phnumber");
                String patientName = rs.getString("patient_name");
                String address = rs.getString("address");
                int age = rs.getInt("age");
                String scanType = rs.getString("scan_type");
        %>
        <tr>
            <td><%= phnumber %></td>
            <td><%= patientName %></td>
            <td><%= address %></td>
            <td><%= age %></td>
            <td><%= scanType %></td>
            <td>
                <form method="POST" action="ScanUpdateStatus.jsp">
                    <input type="hidden" name="phnumber" value="<%= phnumber %>">
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
