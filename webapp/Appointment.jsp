<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment - Medi Care</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        h2 {
            text-align: center;
            color: #333;
            font-size: 28px;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }
        p {
            text-align: center;
            font-size: 16px;
            margin-bottom: 20px;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input[type="text"], input[type="number"], select, textarea {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
        }
        textarea {
            resize: none;
            height: 80px;
        }
        button {
            background-color: #001f3f;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        button:hover {
            background-color: #003366;
            transform: scale(1.05);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            font-size: 36px;
            color: #001f3f;
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="header">
            <h1>Medi Care</h1>
        </div>
        <h2>Book an Appointment</h2>
        <%
            // Get phone number from session
            String phnumber = (String) session.getAttribute("phnumber");
            if (phnumber == null) {
        %>
            <p>Please <a href="Login.jsp">log in</a> to book an appointment.</p>
        <%
            } else {
        %>
            <form action="SubmitAppointmentServlet" method="POST">
                <input type="hidden" name="phnumber" value="<%= phnumber %>" />
                <input type="text" name="name" placeholder="Name" required />
                <input type="number" name="age" placeholder="Age" required />
                <input type="text" name="address" placeholder="Address" required />
                <select name="specialist" required>
                    <option value="" disabled selected>Select a specialist</option>
                    <option value="Dermatologist">Dermatologist</option>
                    <option value="Cardiologist">Cardiologist</option>
                    <option value="Orthopedic">Orthopedic</option>
                    <option value="Pediatrician">Pediatrician</option>
                    <option value="Neurologist">Neurologist</option>
                    <option value="Ophthalmologist">Ophthalmologist</option>
                    <option value="Dentist">Dentist</option>
                    <option value="Psychiatrist">Psychiatrist</option>
                    <option value="General Physician">General Physician</option>
                    <option value="ENT Specialist">ENT Specialist</option>
                    <option value="Oncologist">Oncologist</option>
                </select>
                <textarea name="reason" placeholder="Reason for visit" required></textarea>
                <button type="submit">Book Appointment</button>
            </form>
        <%
            }
        %>
    </div>
</body>
</html>
