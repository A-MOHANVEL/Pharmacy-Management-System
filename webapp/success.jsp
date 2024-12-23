<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success - MediCare Hub</title>
    <style>
    /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body Styling */
body {
    font-family: 'Arial', sans-serif;
    background: linear-gradient(to bottom, #ffffff, #e3f2fd);
    text-align: center;
    padding: 20px;
}

/* Header Styling */
.header {
    background-color: navy;
    padding: 20px;
    animation: slideIn 2s ease-in-out;
}

.title {
    color: white;
    font-size: 36px;
    letter-spacing: 2px;
}

/* Content Section */
.content {
    margin-top: 50px;
    animation: fadeIn 2s ease-in-out;
}

.success-heading {
    color: #2e7d32; /* Green color for success */
    font-size: 28px;
    margin-bottom: 15px;
}

.success-message {
    font-size: 18px;
    color: #444;
    margin-bottom: 30px;
}

/* Button Styling */
.navy-blue-btn {
    background-color: navy;
    color: white;
    font-size: 16px;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: transform 0.3s ease, background-color 0.3s ease;
}

.navy-blue-btn:hover {
    background-color: #004080;
    transform: scale(1.1);
}

/* Animations */
@keyframes slideIn {
    from {
        transform: translateY(-100%);
    }
    to {
        transform: translateY(0);
    }
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
    <header class="header">
        <h1 class="title">MediCare Hub</h1>
    </header>
    <section class="content">
        <h2 class="success-heading">Success!</h2>
        <p class="success-message">Your action was successfully completed. Thank you for using MediCare Hub!</p>
        <button class="navy-blue-btn" onclick="goBack()">Go Back</button>
    </section>

    <script>
    function goBack() {
        alert("Returning to the previous page...");
        // Simulate a back action or redirect
        window.history.back("index.jsp"); // Goes to the previous page
    }
</script>
</body>
</html>
    