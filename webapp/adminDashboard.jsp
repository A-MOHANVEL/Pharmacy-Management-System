<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        /* General reset */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f3f3;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        /* Header styling */
        .header {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 30px;
            background: linear-gradient(90deg, #001f3f, #007BFF);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: gradientMove 4s infinite;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Button styling */
        button {
            background-color: #001f3f;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            padding: 12px 20px;
            margin: 10px;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transform: scale(1.05);
        }

        /* Center content */
        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

    </style>
</head>
<body>
    <div class="header">Medi Care Hub</div>
    <h2>Admin Dashboard</h2>
    <button onclick="location.href='viewPendingCart.jsp'">View Pending Tablets</button>
    <button onclick="location.href='viewCartStatus.jsp'">Tablet Status</button>
    <button onclick="location.href='viewPendingAppointments.jsp'">Pending Appointments</button>
    <button onclick="location.href='viewAppointmentStatus.jsp'">Appointment Status</button>
    <button onclick="location.href='viewReviews.jsp'">View Reviews</button>
    <button onclick="location.href='viewPendingScans.jsp'">Pending Scans</button>
    <button onclick="location.href='viewScanStatus.jsp'">Scan Status</button>
</body>
</html>
