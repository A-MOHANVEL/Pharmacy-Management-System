<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare Hub</title>
    <style>
    /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body Styling */
body {
    font-family: Arial, sans-serif;
    background: linear-gradient(to bottom, #ffffff, #e0f7fa);
    text-align: center;
    padding: 20px;
}

/* Header Styling */
.header {
    background-color: #005f73;
    padding: 20px;
    animation: slideIn 2s ease-in-out;
}

.title {
    color: white;
    font-size: 36px;
    letter-spacing: 2px;
}

/* Section Content */
.content {
    margin-top: 50px;
    animation: fadeIn 2s ease-in-out;
}

.sub-heading {
    color: #333;
    font-size: 24px;
    margin-bottom: 10px;
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

/* Confirmation Message */
#confirmation-message {
    color: green;
    font-size: 18px;
    margin-top: 20px;
    opacity: 0;
    transition: opacity 1s ease-in-out;
}

.hidden {
    display: none;
}

.visible {
    display: block;
    opacity: 1;
    animation: slideUp 1s ease-in-out;
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

@keyframes slideUp {
    from {
        transform: translateY(50%);
    }
    to {
        transform: translateY(0);
    }
}
    </style>
</head>
<body>
    <header class="header">
        <h1 class="title">MediCare Hub</h1>
    </header>
    <section class="content">
        <h2 class="sub-heading">Upload Your Perception</h2>
        <p>Please upload your perception, and we will provide the necessary medicine.</p>
        <button class="navy-blue-btn" onclick="uploadPerception()">Upload Perception</button>
        <p id="confirmation-message" class="hidden">Thank you! Medicine will be provided shortly.</p>
    </section>

    <script>
    function uploadPerception() {
        const confirmationMessage = document.getElementById('confirmation-message');
        confirmationMessage.classList.remove('hidden');
        confirmationMessage.classList.add('visible');

        // Optional: Add more functionality, like redirecting or uploading files
    }
</script>
</body>
</html>
    