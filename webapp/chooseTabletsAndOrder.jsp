<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.example.utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Choose Tablets and Place Order</title>
</head>
<body>
    <h1>Choose Tablets and Place Order</h1>
    
    <form method="POST" action="chooseTabletsAndOrder.jsp">
        <% 
            // Database connection and result set initialization
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            // Retrieve the logged-in user's phone number from the session
            String phnumber = (String) session.getAttribute("phnumber");
            if (phnumber == null) {
                out.println("<h3>You are not logged in. Please log in first.</h3>");
                response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
                return;
            }

            String address = request.getParameter("address");
            String status = "Pending"; // Default status
            String name = request.getParameter("name");

            // Only process the form if the user has submitted it
            if (address != null && name != null) {
                try {
                    conn = DBConnection.getConnection();

                    // Get current date and time for order_date and order_time
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
                    Date date = new Date();
                    String orderDate = dateFormat.format(date);
                    String orderTime = timeFormat.format(date);

                    // Initialize variables to store tablet names and total cost
                    StringBuilder tabletNames = new StringBuilder();
                    double totalCost = 0.0;

                    // Fetch the selected tablets and quantities
                    String[] selectedTablets = request.getParameterValues("selectedTablets");
                    if (selectedTablets != null) {
                        for (String tabletIdStr : selectedTablets) {
                            int tabletId = Integer.parseInt(tabletIdStr);
                            String quantityParam = request.getParameter("quantity_" + tabletId);
                            int quantity = Integer.parseInt(quantityParam);

                            // Fetch the cost of the tablet
                            String tabletQuery = "SELECT TabletName, Cost FROM tablets WHERE id = ?";
                            ps = conn.prepareStatement(tabletQuery);
                            ps.setInt(1, tabletId);
                            rs = ps.executeQuery();
                            double tabletCost = 0.0;
                            String tabletName = "";
                            if (rs.next()) {
                                tabletName = rs.getString("TabletName");
                                tabletCost = rs.getDouble("Cost");
                            }

                            // Add the tablet name to the tabletNames list and calculate total cost
                            if (tabletNames.length() > 0) {
                                tabletNames.append(", ");
                            }
                            tabletNames.append(tabletName);
                            totalCost += tabletCost * quantity;
                        }

                        // Insert data into the cart table
                        String insertQuery = "INSERT INTO cart (phnumber, name, address, status, order_date, order_time, tablet_names, total_cost) "
                                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                        ps = conn.prepareStatement(insertQuery);
                        ps.setString(1, phnumber);
                        ps.setString(2, name);
                        ps.setString(3, address);
                        ps.setString(4, status);
                        ps.setString(5, orderDate);
                        ps.setString(6, orderTime);
                        ps.setString(7, tabletNames.toString());
                        ps.setDouble(8, totalCost);

                        // Execute the insert query
                        ps.executeUpdate();
                        out.println("<h3>Order placed successfully!</h3>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<h3>Error placing order. Please try again.</h3>");
                } finally {
                    // Closing resources to avoid memory leaks
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }

            // Fetch available tablets to display in the form
            try {
                conn = DBConnection.getConnection();
                String query = "SELECT id, TabletName, Cost FROM tablets";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int tabletId = rs.getInt("id");
                    String tabletName = rs.getString("TabletName");
                    double tabletCost = rs.getDouble("Cost");
        %>
                <div>
                    <input type="checkbox" name="selectedTablets" value="<%= tabletId %>">
                    <label for="<%= tabletId %>"><%= tabletName %> - Cost: <%= tabletCost %></label>
                    <label for="quantity_<%= tabletId %>"> Quantity:</label>
                    <input type="number" name="quantity_<%= tabletId %>" min="1" value="1">
                </div>
        <% 
                } 
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                // Closing resources to avoid memory leaks
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>

        <h3>Enter Order Details:</h3>

        <div>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>

        <div>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
        </div>

        <div>
            <input type="hidden" name="status" value="Pending">
        </div>

        <div>
            <button type="submit">Place Order</button>
        </div>
    </form>
</body>
</html>
