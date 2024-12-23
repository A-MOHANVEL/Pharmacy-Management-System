<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pharmacy Services</title>
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
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            margin: 10px 0;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to the Pharmacy Services</h2>
        <form action="chooseTabletsAndOrder.jsp">
            <button type="submit">Buy Tablet</button>
        </form>
        <form action="Appointment.jsp">
            <button type="submit">Appointment</button>
        </form>
        <form action="Review.jsp">
            <button type="submit">Review</button>
        </form>
        <form action="ScanBooking.jsp">
            <button type="submit">Scan Booking</button>
        </form>
        <form action="KnowStatus.jsp">
            <button type="submit">KnowStatus</button>
        </form>
    </div>
</body>
</html>
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    
    <title>Pharmacy Management System</title>
    <style>
        /* Global styles */
       /* General Styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

/* Image Section (Home) */
#home {
    background-color: #f0f8ff;
    text-align: center;
    padding: 50px 20px;
    opacity: 0;
    animation: fadeInUp 1.5s forwards;
}

#home h2 {
    font-size: 2.5em;
    margin-bottom: 20px;
    color: #004d99;
}

#home img {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
    animation: slideIn 1s forwards;
    opacity: 0;
}

/* About Section */
#about {
    padding: 60px 20px;
    background-color: #f4f4f4;
    background-image:url("about.jpeg")
    opacity: 0;
    animation: fadeInUp 1.5s forwards 0.5s; /* Delay to start after home */
}

.about-container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    max-width: 1200px;
    margin: 0 auto;
}

.about-content {
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    max-width: 700px;
    animation: fadeInUp 2s forwards;
    opacity: 0;
}

.about-content h2 {
    font-size: 2em;
    margin-bottom: 20px;
    color: #004d99;
}

.about-content p {
    font-size: 1.1em;
    line-height: 1.6;
}

/* Animations */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes slideIn {
    from {
        opacity: 0;
        transform: translateX(-50px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

/* Responsive Design */
@media (max-width: 768px) {
    #home h2 {
        font-size: 2em;
    }

    .about-content {
        max-width: 100%;
    }
}


        header {
            background-color: #004d99;
            color: white;
            padding: 20px 0;
            text-align: center;
        }

        header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        header h1 {
            margin: 0;
        }

        header nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        header nav ul li {
            margin: 0 15px;
        }

        header nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        main {
            padding: 20px;
        }

        

        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 300px;
        }

        .card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .discount {
            text-align: center;
            background-color: #e6f7ff;
            padding: 20px;
            margin: 20px 0;
            border-radius: 5px;
            color: #004d99;
            font-size: 1.5em;
            font-weight: bold;
        }

        .footer {
            background-color: #004d99;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }



        .products {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

.product {
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px;
    width: 150px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.product img {
    width: 100px;
    height: 100px;
}

.product button {
    margin-top: 10px;
    padding: 5px 10px;
    background-color: #004d99;
    color: white;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

.product button:hover {
    background-color: #003366;
}


.discount {
    text-align: center;
    background-color: #e6f7ff;
    padding: 20px;
    margin: 20px 0;
    border-radius: 5px;
    color: #004d99;
    font-size: 1.5em;
    font-weight: bold;
    position: relative;
    overflow: hidden;
    animation: fadeInOut 3s infinite, bounce 1.5s infinite;
}

/* Fade In and Out Animation */
@keyframes fadeInOut {
    0%, 100% {
        opacity: 1;
    }
    50% {
        opacity: 0.5;
    }
}

/* Bounce Animation */
@keyframes bounce {
    0%, 100% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-10px);
    }
}

/* Sparkling Effect */
.discount::before,
.discount::after {
    content: '';
    position: absolute;
    width: 50px;
    height: 50px;
    background: radial-gradient(circle, rgba(255, 255, 255, 0.8), transparent);
    border-radius: 50%;
    animation: sparkle 2s infinite;
}

.discount::before {
    top: -20px;
    left: -20px;
    animation-delay: 0s;
}

.discount::after {
    bottom: -20px;
    right: -20px;
    animation-delay: 1s;
}

@keyframes sparkle {
    0%, 100% {
        transform: scale(0) translateY(0);
        opacity: 0;
    }
    50% {
        transform: scale(1) translateY(-10px);
        opacity: 1;
    }
}



#doctors {
    background-color: #f9f9f9;
    padding: 40px 20px;
    text-align: center;
    border-radius: 5px;
    margin: 20px 0;
}

#doctors h2 {
    color: #004d99;
    margin-bottom: 10px;
    font-size: 2em;
}

#doctors p {
    color: #555;
    margin-bottom: 30px;
}

.doctor-cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
}

.doctor-card {
    background-color: white;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 200px;
    text-align: center;
    transition: transform 0.3s, box-shadow 0.3s;
}

.doctor-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}

.doctor-card img {
    border-radius: 50%;
    width: 100px;
    height: 100px;
    margin-bottom: 10px;
}

.doctor-card h3 {
    color: #004d99;
    font-size: 1.2em;
    margin-bottom: 5px;
}

.doctor-card p {
    color: #777;
    font-size: 0.9em;
    margin-bottom: 5px;
}



/* General Section Styles */
#services {
    background-color: #f9f9f9;
    padding: 40px 20px;
    text-align: center;
    border-radius: 5px;
    margin: 20px 0;
}

#services h2 {
    color: #004d99;
    margin-bottom: 10px;
    font-size: 2em;
    animation: fadeIn 1s ease-in-out;
}

#services p {
    color: #555;
    margin-bottom: 30px;
    font-size: 1em;
    animation: fadeIn 1.5s ease-in-out;
}

/* Service Cards */
.service-cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
}

.service-card {
    background-color: white;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 250px;
    text-align: center;
    transition: transform 0.3s, box-shadow 0.3s;
    animation: slideIn 1s ease-in-out forwards;
    opacity: 0;
}

.service-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}

.service-card img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin-bottom: 10px;
    border: 2px solid #004d99;
    animation: rotateIn 1s ease-in-out;
}

.service-card h3 {
    color: #004d99;
    font-size: 1.2em;
    margin-bottom: 10px;
}

.service-card p {
    color: #777;
    font-size: 0.9em;
    margin-bottom: 10px;
}

/* Button with Hover Animation */
.service-card button {
    background-color: #004d99;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 10px 15px;
    cursor: pointer;
    font-size: 0.9em;
    transition: background-color 0.3s, transform 0.2s;
}

.service-card button:hover {
    background-color: #003366;
    transform: scale(1.1);
}

/* Keyframes for Animations */
@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

@keyframes slideIn {
    from {
        transform: translateY(50px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

@keyframes rotateIn {
    from {
        transform: rotate(-360deg);
        opacity: 0;
    }
    to {
        transform: rotate(0deg);
        opacity: 1;
    }
}

/* Media Queries for Responsiveness */
@media (max-width: 768px) {
    .service-cards {
        flex-direction: column;
    }
}


/* Contact Section Styles */
#contact {
    background-color: #f3f7fa;
    padding: 40px 20px;
    text-align: center;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin: 20px 0;
}

#contact h2 {
    color: #004d99;
    font-size: 2em;
    margin-bottom: 10px;
    animation: fadeInDown 1s ease-in-out;
}

#contact p {
    color: #555;
    font-size: 1em;
    margin-bottom: 30px;
    animation: fadeIn 1.5s ease-in-out;
}

/* Contact Details */
.contact-details {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 20px;
}

.contact-card {
    background-color: white;
    border-radius: 8px;
    padding: 20px;
    width: 250px;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
    animation: slideInUp 1s ease-in-out forwards;
    opacity: 0;
}

.contact-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}

.contact-card img {
    width: 80px;
    height: 80px;
    margin-bottom: 10px;
    animation: pulse 2s infinite;
}

.contact-card h3 {
    color: #004d99;
    font-size: 1.2em;
    margin-bottom: 10px;
}

.contact-card p {
    color: #777;
    font-size: 0.9em;
}

/* Animations */
@keyframes fadeInDown {
    from {
        opacity: 0;
        transform: translateY(-30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes slideInUp {
    from {
        transform: translateY(30px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

@keyframes pulse {
    0%, 100% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.1);
    }
}

/* Responsive Design */
@media (max-width: 768px) {
    .contact-details {
        flex-direction: column;
        align-items: center;
    }
}




.review-card {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    max-width: 300px;
    text-align: center;
    opacity: 0;
    animation: fadeInUp 2s forwards;
}

.review-card h3 {
    font-size: 1.8em;
    color: #004d99;
    margin-bottom: 10px;
}

.review-card p {
    font-size: 1.1em;
    margin-bottom: 20px;
}

/* Scan Booking Section */
#scan-booking {
    background-color: #f0f8ff;
    animation: fadeInUp 1.5s forwards 0.5s;
}

.scan-card {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    max-width: 350px;
    margin: 20px auto;
    opacity: 0;
    animation: fadeInUp 2s forwards;
}

.scan-card h3 {
    font-size: 1.8em;
    color: #004d99;
    margin-bottom: 10px;
}

.scan-card p {
    font-size: 1.1em;
    margin-bottom: 20px;
}

/* Buttons */
button {
    padding: 10px 20px;
    font-size: 1.1em;
    color: #fff;
    background-color: #004d99;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

button:hover {
    background-color: #003366;
    transform: scale(1.1);
}

/* Animations */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}



#reviews {
    padding: 60px 20px;
    text-align: center;
}

/* Review Button Animation */
.review-btn {
    padding: 15px 30px;
    font-size: 1.2em;
    color: #fff;
    background-color: #004d99;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: transform 0.3s ease, background-color 0.3s ease, box-shadow 0.3s ease;
    opacity: 0;
    transform: translateY(30px);
    animation: fadeInUp 1.5s forwards; /* Apply the fade-in effect */
}

/* Button Hover Effect */
.review-btn:hover {
    background-color: #003366;
    transform: translateY(-5px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

/* Fade-In Animation */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}


/* General Styles for the Upload Prescription Section */
#upload {
    padding: 60px 20px;
    text-align: center;
    background-color: #f9f9f9;
}

#upload h2 {
    font-size: 2.5em;
    color: #004d99;
    margin-bottom: 20px;
}

#upload p {
    font-size: 1.2em;
    margin-bottom: 30px;
    color: #333;
}

/* Upload Button with Animation */
.upload-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
}

.scan-btn {
    padding: 15px 30px;
    font-size: 1.2em;
    color: #fff;
    background-color: #007bff;  /* Blue color */
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: transform 0.3s ease, background-color 0.3s ease, box-shadow 0.3s ease;
    opacity: 0;
    transform: translateY(30px);
    animation: fadeInUp 1.5s forwards; /* Apply the fade-in effect */
}

/* Button Hover Effect */
.scan-btn:hover {
    background-color: #0056b3; /* Darker blue for hover */
    transform: translateY(-5px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

/* Fade-In Animation */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}





/* General Styles for Products Section */
#products {
    padding: 40px 20px;
    text-align: center;
    background-color: #f9f9f9;
}

#products h2 {
    font-size: 2.5em;
    margin-bottom: 20px;
    color: #004d99;
}

.products {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-bottom: 20px;
}

.product {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
    text-align: center;
    width: 200px;
    background-color: #fff;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.product:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.product img {
    max-width: 100px;
    margin-bottom: 10px;
}

.product p {
    margin: 10px 0;
    font-size: 1.2em;
    color: #333;
}

/* Single Shop Now Button */
.shop-now-btn {
    padding: 15px 30px;
    font-size: 1.2em;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: transform 0.3s ease, background-color 0.3s ease;
    animation: fadeIn 1.5s ease;
}

.shop-now-btn:hover {
    background-color: #0056b3;
    transform: scale(1.1);
}

/* Fade-In Animation for Button */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}




.footer-section ul {
    list-style: none;
    padding: 0;
}

.footer-section ul li {
    margin: 5px 0;
}

.footer-section form {
    margin-top: 10px;
}

.footer-section input[type="email"] {
    padding: 8px;
    width: 70%;
    border: none;
    border-radius: 5px;
    margin-right: 10px;
}

.footer-section button {
    padding: 8px 15px;
    border: none;
    border-radius: 5px;
    background-color: #00bcd4;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s;
}

.footer-section button:hover {
    background-color: #0097a7;
}




    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1>MediCare Hub</h1>
            <nav>
                <ul>
                    <li><a href="#home">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="chooseTabletsAndOrder.jsp" id="store">Store</a></li>
                    <li><a href="Appointment.jsp" id="appointment">Appointment</a></li>
                    <li><a href="ScanBooking.jsp" id="scanbooking">Scan Booking</a></li>
                    <li><a href="Review.jsp" id="review">Review</a></li>
                    <li><a href="KnowStatus.jsp" id="review">KnowStatus</a></li>
                </ul>
            </nav>
        </div>
    </header>
    

    <main>
        <!-- Image of tablets -->
        <section id="home" class="image-section">
            <h2>Welcome to Our Pharmacy</h2>
            <img src="home.jpg" alt="Tablets">
        </section>
        
        <section id="about">
            <div class="about-container">
                <div class="about-content">
                    <h2>About Our Pharmacy</h2>
                    <p>
                        Our pharmacy is committed to providing top-quality healthcare products and services. 
                        We offer a wide range of medications, healthcare essentials, and specialized medical advice.
                    </p>
                    <p>
                        With years of expertise, we ensure the highest standards of service to promote your health and well-being.
                        Whether it’s advice, prescriptions, or over-the-counter products, we are here for you!
                    </p>
                </div>
            </div>
        </section>

        

        <section id="products">
            <h2>Our Products</h2>
            <div class="products">
                <div class="product">
                    <img src="t1.jpg" alt="Product 1">
                    <p>Product</p>
                </div>
                <div class="product">
                    <img src="t2.jpg" alt="Product 2">
                    <p>Product</p>
                </div>
                <div class="product">
                    <img src="t3.jpg" alt="Product 3">
                    <p>Product</p>
                </div>
                <div class="product">
                    <img src="t4.jpg" alt="Product 4">
                    <p>Product</p>
                </div>
                <div class="product">
                    <img src="t5.jpg" alt="Product 5">
                    <p>Product</p>
                </div>
                <div class="product">
                    <img src="t6.jpg" alt="Product 6">
                    <p>Product</p>
                </div>
                <div class="product">
                    <img src="t7.jpg" alt="Product 7">
                    <p>Product</p>
                </div>
                <div class="product">
                    <img src="t8.jpg" alt="Product 8">
                    <p>Product</p>
                </div>
                <div class="product">
                    <img src="t9.jpg" alt="Product 9">
                    <p>Product</p>
                </div>
                <div class="product">
                    <img src="t10.jpg" alt="Product 10">
                    <p>Product</p>
                </div>
            </div>
            <button class="shop-now-btn" onclick="shop()" >Shop Now</button>
        </section>
        <script>
        function shop(){
        	window.location.href="chooseTabletsAndOrder.jsp";
        }
        
        function appoint(){
        	window.location.href="Appointment.jsp";
        }
        
        function prec(){
        	window.location.href="precept.jsp";
        }

        </script>





        <!-- 50% Discount -->
        <section id="discount">
            <div class="discount">
                🎉 50% OFF on Selected Scans and Tests! 🎉
            </div>
        </section>



        <section id="services">
            <h2>Our Services</h2>
            <p>We provide specialized and general healthcare services to meet your needs.</p>
            <div class="service-cards">
                <div class="service-card">
                    <img src="ph2.jpg" alt="Orthopedic Service">
                    <h3>Orthopedic Services</h3>
                    <p>Comprehensive care for bones, joints, and muscles.</p>
                    <button onclick="appoint()">Book Appointment</button>
                </div>
                <div class="service-card">
                    <img src="ph1.jpg" alt="Cardiology Service">
                    <h3>Cardiology Services</h3>
                    <p>Expert diagnosis and treatment for heart conditions.</p>
                    <button onclick="appoint()">Book Appointment</button>
                </div>
                <div class="service-card">
                    <img src="ph3.jpg" alt="General Health">
                    <h3>General Health</h3>
                    <p>Routine checkups and preventive care for your health.</p>
                    <button onclick="appoint()">Book Appointment</button>
                </div>
            </div>
        </section>

        <section id="upload">
            <h2>Upload Your Prescription</h2>
            <p>To proceed with your medication order, please upload your prescription below.</p>
            <div class="upload-container">
                <button class="scan-btn" onclick="prec()">Upload the Prescription</button>
            </div>
        </section>
        

        
       
        
        


                      
                     
        
        <section id="doctors">
            <h2>Our Experienced Doctors</h2>
            <p>Our team of doctors brings together decades of expertise across various specializations, ensuring premium care for our patients.</p>
            <div class="doctor-cards">
                <div class="doctor-card">
                    <img src="d1.jpeg" alt="Dr. John Doe">
                    <h3>Dr. John Doe</h3>
                    <p>Specialist in Cardiology</p>
                    <p>20+ years of experience</p>
                </div>
                <div class="doctor-card">
                    <img src="d2.jpeg" alt="Dr. Jane Smith">
                    <h3>Dr. Jane Smith</h3>
                    <p>Expert in Pediatrics</p>
                    <p>15+ years of experience</p>
                </div>
                <div class="doctor-card">
                    <img src="d3.jpg" alt="Dr. Arjun Rao">
                    <h3>Dr. Arjun Rao</h3>
                    <p>Dermatology Specialist</p>
                    <p>18+ years of experience</p>
                </div>
                <div class="doctor-card">
                    <img src="d4.jpg" alt="Dr. Priya Nair">
                    <h3>Dr. Priya Nair</h3>
                    <p>Expert in Orthopedics</p>
                    <p>22+ years of experience</p>
                </div>
                <div class="doctor-card">
                    <img src="d5.jpg" alt="Dr. Vijay Kapoor">
                    <h3>Dr. Vijay Kapoor</h3>
                    <p>Neurosurgeon</p>
                    <p>25+ years of experience</p>
                </div>
            </div>
        </section>



        <section id="reviews">
            <h2>Customer Reviews</h2>
            <p>See what our customers have to say about our services!</p>
            <button href="Review.jsp" class="review-btn">Leave a Review</button>
        </section>
        
        


        <section id="contact">
            <h2>Contact Us</h2>
            <p>We'd love to hear from you! Reach out to us via the details below:</p>
            <div class="contact-details">
                <div class="contact-card">
                    <img src="https://img.icons8.com/ios-filled/100/email.png" alt="Email">
                    <h3>Email</h3>
                    <p>contact@pharmacy.com</p>
                </div>
                <div class="contact-card">
                    <img src="https://img.icons8.com/ios-filled/100/phone.png" alt="Phone">
                    <h3>Phone</h3>
                    <p>+1 (555) 123-4567</p>
                </div>
                <div class="contact-card">
                    <img src="https://img.icons8.com/ios-filled/100/chat-message.png" alt="Message">
                    <h3>Message</h3>
                    <p>Drop us a message anytime!</p>
                </div>
            </div>
        </section>
        
        
    </main>

    

    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                
           
           
            <div class="footer-section">
                <h4>Newsletter</h4>
                <p>Subscribe to our newsletter to stay updated on our latest healthcare solutions.</p>
                
            </div>
            <div class="footer-section social-media">
                <h4>Follow Us</h4>
                <a href="#"><i class="fab fa-facebook"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-linkedin"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Pharmacy Management System. All Rights Reserved.</p>
        </div>
    </footer>
    


    
</body>
</html>