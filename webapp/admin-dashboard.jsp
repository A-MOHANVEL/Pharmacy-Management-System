<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Medi Care Hub</title>
    <style>
        /* General Reset */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            text-align: center;
        }

        /* Header Styling */
        .header {
            font-size: 36px;
            font-weight: bold;
            padding: 20px;
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

        /* Button Styling */
        button {
            display: inline-block;
            background-color: #001f3f;
            color: white;
            font-size: 16px;
            font-weight: bold;
            padding: 15px 25px;
            margin: 10px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
        }

        button:hover {
            background-color: #004080;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            transform: scale(1.05);
        }

        /* Page Title Styling */
        h2 {
            font-size: 28px;
            color: #333;
            margin-top: 20px;
        }

        /* Container for buttons */
        .button-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header">Medi Care Hub</div>
    <h2>Admin Dashboard</h2>
    <div class="button-container">
        <button onclick="location.href='CartUpdateStatus.jsp'">View Pending Tablets</button>
        <button onclick="location.href='DisplayCart.jsp'">Tablet Status</button>
        <button onclick="location.href='AppointmentUpdateStatus.jsp'">Pending Appointments</button>
        <button onclick="location.href='nonPendingAppointments.jsp'">Appointment Status</button>
        <button onclick="location.href='DisplayReview.jsp'">View Reviews</button>
        <button onclick="location.href='ScanUpdateStatus.jsp'">Pending Scans</button>
        <button onclick="location.href='DisplayScan.jsp'">Scan Status</button>
    </div>
</body>
</html>
