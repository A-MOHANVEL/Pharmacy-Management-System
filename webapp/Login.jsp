<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
     body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        header {
            width: 100%;
            background-color: navy;
            color: white;
            text-align: center;
            padding: 15px 0;
            font-size: 24px;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .form-container {
            background-color: #fff;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
            margin-top: 20px;
            animation: fadeIn 1.5s ease-in-out;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            text-align: left;
        }
        input[type="text"], input[type="password"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
            transition: all 0.3s ease;
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: navy;
            box-shadow: 0 0 5px rgba(0, 0, 128, 0.5);
        }
        button {
            padding: 10px;
            background-color: navy;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        button:hover {
            background-color: #004080;
            transform: scale(1.05);
        }
        .signup-link {
            margin-top: 10px;
            font-size: 14px;
            color: navy;
            text-decoration: none;
        }
        .signup-link:hover {
            text-decoration: underline;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<header>
        MediCare Hub
    </header>
    <div class="form-container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <label for="phnumber">Phone Number:</label>
            <input type="text" id="phnumber" name="phnumber" placeholder="Enter your phone number" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required><br>
            <button type="submit">Login</button>
        </form>
        <a href="Signup.jsp" class="signup-link">Don't have an account? Sign up here</a>
    </div>
</body>
</html>