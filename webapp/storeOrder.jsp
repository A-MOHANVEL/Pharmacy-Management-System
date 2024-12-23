<%@ page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            animation: fadeIn 1s ease-in-out;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            font-size: 2.5em;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        h1 span {
            color: #2980b9;
            font-family: 'Georgia', serif;
        }
        .btn {
            display: inline-block;
            background-color: #1e3a8a; /* Navy Blue */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            font-size: 1em;
            transition: background-color 0.3s ease, transform 0.3s ease;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #153477;
            transform: scale(1.05);
        }
        p {
            text-align: center;
            font-size: 1.2em;
            margin-top: 20px;
            color: #2c3e50;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1><span>Medi</span> Care Hub</h1>

    <% 
        String quantity = request.getParameter("quantity");
        String address = request.getParameter("address");
        String[] selectedTablets = request.getParameterValues("tabletId");

        if (selectedTablets != null && selectedTablets.length > 0) {
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy", "root", "1234");
                
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
                Date currentDate = new Date();
                String formattedDate = dateFormat.format(currentDate);  // current date
                String formattedTime = timeFormat.format(currentDate);  // current time

                for (String tabletId : selectedTablets) {
                    double tabletCost = Double.parseDouble(request.getParameter("tablet_cost_" + tabletId));  // Cost for the selected tablet

                    String query = "INSERT INTO cart (phnumber, tablet_id, quantity, address, status, order_date, order_time, tablet_cost) VALUES (?, ?, ?, ?, 'Pending', ?, ?, ?)";
                    ps = conn.prepareStatement(query);
                    ps.setString(1, "1234567890");  // Replace with dynamic user's phone number
                    ps.setInt(2, Integer.parseInt(tabletId));
                    ps.setInt(3, Integer.parseInt(quantity));
                    ps.setString(4, address);
                    ps.setString(5, formattedDate);
                    ps.setString(6, formattedTime);
                    ps.setDouble(7, tabletCost);

                    ps.executeUpdate();
                }
                out.println("<p>Your order has been placed successfully!</p>");
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error placing order. Please try again later.</p>");
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            out.println("<p>No tablets selected. Please go back and select at least one tablet.</p>");
        }
    %>

    <div style="text-align: center;">
        <a href="chooseTabletsAndOrder.jsp" class="btn">Go Back</a>
    </div>
</div>

</body>
</html>