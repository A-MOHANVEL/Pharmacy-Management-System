<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.utils.DBConnection" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard - Medi Care Hub</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .header {
            text-align: center;
            padding: 20px;
            font-size: 36px;
            font-weight: bold;
            color: white;
            background: linear-gradient(90deg, #001f3f, #4CAF50);
            animation: gradientMove 5s infinite;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h1, h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #001f3f;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
            transform: scale(1.02);
            transition: all 0.2s ease-in-out;
        }

        p {
            text-align: center;
            font-size: 16px;
            color: #666;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header">Medi Care Hub</div>

    <h1>Welcome to Your Dashboard</h1>

    <%
        // Retrieve the phnumber from the session
        String phnumber = (String) session.getAttribute("phnumber");

        // If phnumber is null, prompt the user to login
        if (phnumber == null) {
            out.println("<p>Please <a href='Login.jsp'>login</a> to view your details.</p>");
        } else {
            // Database connection
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                conn = DBConnection.getConnection();

                // Fetch Cart details
                String cartQuery = "SELECT * FROM cart WHERE phnumber = ?";
                ps = conn.prepareStatement(cartQuery);
                ps.setString(1, phnumber);
                rs = ps.executeQuery();
                out.println("<h2>Your Cart</h2>");
                if (rs.next()) {
                    out.println("<table><tr><th>Tablet Names</th><th>Total Cost</th><th>Address</th><th>Status</th></tr>");
                    do {
                        String tabletNames = rs.getString("tablet_names");
                        double totalCost = rs.getDouble("total_cost");
                        String address = rs.getString("address");
                        String status = rs.getString("status");

                        out.println("<tr><td>" + tabletNames + "</td><td>" + totalCost + "</td><td>" + address + "</td><td>" + status + "</td></tr>");
                    } while (rs.next());
                    out.println("</table>");
                } else {
                    out.println("<p>No items in your cart.</p>");
                }

                // Fetch Appointments details
                String appointmentsQuery = "SELECT * FROM appointments WHERE phnumber = ?";
                ps = conn.prepareStatement(appointmentsQuery);
                ps.setString(1, phnumber);
                rs = ps.executeQuery();
                out.println("<h2>Your Appointments</h2>");
                if (rs.next()) {
                    out.println("<table><tr><th>Name</th><th>Age</th><th>Specialist</th><th>Reason</th><th>Address</th><th>Status</th></tr>");
                    do {
                        String name = rs.getString("name");
                        int age = rs.getInt("age");
                        String specialist = rs.getString("specialist");
                        String reason = rs.getString("reason");
                        String address = rs.getString("address");
                        String status = rs.getString("status");

                        out.println("<tr><td>" + name + "</td><td>" + age + "</td><td>" + specialist + "</td><td>" + reason + "</td><td>" + address + "</td><td>" + status + "</td></tr>");
                    } while (rs.next());
                    out.println("</table>");
                } else {
                    out.println("<p>No appointments found.</p>");
                }

                // Fetch Scans details
                String scansQuery = "SELECT * FROM scans WHERE phnumber = ?";
                ps = conn.prepareStatement(scansQuery);
                ps.setString(1, phnumber);
                rs = ps.executeQuery();
                out.println("<h2>Your Scan Bookings</h2>");
                if (rs.next()) {
                    out.println("<table><tr><th>Patient Name</th><th>Scan Type</th><th>Age</th><th>Address</th><th>Status</th></tr>");
                    do {
                        String patientName = rs.getString("patient_name");
                        String scanType = rs.getString("scan_type");
                        int age = rs.getInt("age");
                        String address = rs.getString("address");
                        String status = rs.getString("status");

                        out.println("<tr><td>" + patientName + "</td><td>" + scanType + "</td><td>" + age + "</td><td>" + address + "</td><td>" + status + "</td></tr>");
                    } while (rs.next());
                    out.println("</table>");
                } else {
                    out.println("<p>No scan bookings found.</p>");
                }

            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error retrieving data. Please try again later.</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>

</body>
</html>
