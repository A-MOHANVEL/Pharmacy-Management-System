<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reviews</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <h2>User Reviews</h2>
    <table>
        <thead>
            <tr>
                <th>Phone Number</th>
                <th>Review</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy", "root", "1234");

                    // Query to fetch all reviews
                    String query = "SELECT phnumber, review FROM reviews";
                    stmt = conn.prepareStatement(query);
                    rs = stmt.executeQuery();

                    // Iterate through the results
                    while (rs.next()) {
                        String phnumber = rs.getString("phnumber");
                        String review = rs.getString("review");
            %>
            <tr>
                <td><%= phnumber %></td>
                <td><%= review %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='2' style='color: red; text-align: center;'>Error fetching reviews: " + e.getMessage() + "</td></tr>");
                    e.printStackTrace(new java.io.PrintWriter(out));  // Correct way to print stack trace
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace(new java.io.PrintWriter(out));  // Handle closing resources errors
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
