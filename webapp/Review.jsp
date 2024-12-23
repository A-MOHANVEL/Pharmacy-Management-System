<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write Your Review</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
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
        input[type="text"], textarea {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
        }
        textarea {
            resize: none;
        }
        button {
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Write Your Review</h2>

        <form action="SubmitReviewServlet" method="post">
            <!-- Hidden input for phnumber (retrieved from session) -->
            <%
                String phnumber = (String) request.getSession().getAttribute("phnumber");
                if (phnumber != null) {
            %>
                <input type="hidden" name="phnumber" value="<%= phnumber %>">
            <% } else { %>
                <p>You must be logged in to submit a review.</p>
                <a href="Login.jsp">Login</a>
            <% } %>

            <div>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required>
            </div>

            <div>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" placeholder="Enter your address" required>
            </div>

            <div>
                <label for="review">Review:</label>
                <textarea id="review" name="review" rows="6" placeholder="Write your review here..." required></textarea>
            </div>

            <button type="submit">Submit Review</button>
        </form>
    </div>
</body>
</html>
