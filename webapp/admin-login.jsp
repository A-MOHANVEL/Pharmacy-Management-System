<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - Medi Care Hub</title>
    <style>
        /* General reset and styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            text-align: center;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        /* Animated header */
        .header {
            font-size: 36px;
            font-weight: bold;
            color: white;
            background: linear-gradient(90deg, #001f3f, #4CAF50);
            animation: gradientMove 4s infinite;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 20px;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Form styling */
        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 300px;
            animation: fadeIn 1.5s;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        input[type="text"], input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #001f3f;
            border: none;
            color: white;
            font-weight: bold;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: transform 0.3s, background-color 0.3s, box-shadow 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #004080;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        /* Error message styling */
        .error {
            color: red;
            margin-top: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="header">Medi Care Hub</div>
    <form action="AdminLoginServlet" method="post">
        <input type="text" name="username" placeholder="Admin Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <input type="submit" value="Login">
    </form>
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <div class="error"><%= errorMessage %></div>
    <%
        }
    %>
</body>
</html>
