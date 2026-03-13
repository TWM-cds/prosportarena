<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String companyName = application.getInitParameter("companyName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Return Policy | <%=companyName%></title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    scroll-behavior: smooth;
}

.navbar {
    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
}

.hero {
    background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
    url('https://images.unsplash.com/photo-1612831455545-7d356b1803b7?w=1600&auto=format&fit=crop');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 100px 0;
    text-align: center;
}

.hero h1 {
    font-size: 48px;
    font-weight: bold;
}

.policy-section h3 {
    margin-top: 20px;
    font-weight: bold;
}

.policy-section p, .policy-section li {
    margin-bottom: 15px;
}

footer {
    margin-top: 60px;
}
</style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 sticky-top">
    <a class="navbar-brand fw-bold" href="#"> <%=companyName%> </a>

    <form class="d-flex ms-auto me-3" action="SearchServlet" method="get">
        <input class="form-control me-2" type="search" name="keyword" placeholder="Search products...">
        <button class="btn btn-warning">Search</button>
    </form>

    <%
        String user = (String) session.getAttribute("user");
        if(user != null){
    %>
        <a href="Cart.jsp" class="btn btn-outline-light me-2">
            Cart (<%= session.getAttribute("cartCount") == null ? 0 : session.getAttribute("cartCount") %>)
        </a>
        <a href="LogoutServlet" class="btn btn-danger">Logout</a>
    <%
        } else {
    %>
        <a class="btn btn-outline-light me-2" href="Login.jsp">Login</a>
        <a class="btn btn-success" href="Register.jsp">Register</a>
    <%
        }
    %>
</nav>

<!-- HERO SECTION -->
<div class="hero">
    <h1>Return Policy</h1>
    <p class="lead">Learn how to return products easily and securely</p>
</div>

<!-- RETURN POLICY SECTION -->
<section class="container my-5 policy-section">
    <h2 class="text-center mb-4">Our Return Policy</h2>

    <div class="row">
        <div class="col-md-6 mb-4">
            <h3>Eligibility for Returns</h3>
            <p>Products can be returned within <strong>14 days</strong> of delivery. To qualify for a return, the item must:</p>
            <ul>
                <li>Be unused and in the same condition as received</li>
                <li>Be in its original packaging</li>
                <li>Include all tags, accessories, and manuals</li>
            </ul>
        </div>

        <div class="col-md-6 mb-4">
            <h3>Non-Returnable Items</h3>
            <p>The following items are not eligible for return:</p>
            <ul>
                <li>Gift cards and vouchers</li>
                <li>Customized or personalized products</li>
                <li>Items damaged due to misuse or accidents</li>
            </ul>
        </div>

        <div class="col-md-6 mb-4">
            <h3>Return Process</h3>
            <p>To initiate a return:</p>
            <ol>
                <li>Log in to your account and visit "My Orders".</li>
                <li>Select the order and click "Return Item".</li>
                <li>Fill out the return form and print the return label.</li>
                <li>Pack the item securely and attach the return label.</li>
                <li>Drop it off at the nearest courier or schedule a pickup.</li>
            </ol>
        </div>

        <div class="col-md-6 mb-4">
            <h3>Refund Policy</h3>
            <p>Once we receive your returned item:</p>
            <ul>
                <li>We will inspect the product and notify you via email.</li>
                <li>Approved refunds will be processed within <strong>5–7 business days</strong>.</li>
                <li>Refunds will be credited to your original payment method.</li>
            </ul>
        </div>

        <div class="col-md-12 mb-4">
            <h3>Contact Us</h3>
            <p>If you have any questions about our return policy, please contact our customer support through the "Help Center" or chat with us using the chat button on any page.</p>
        </div>
    </div>

</section>

<!-- FOOTER -->
<footer class="bg-dark text-white text-center p-3 mt-4">
<p class="mb-1">© 2026 <%=companyName%> | All Rights Reserved</p>
<p class="small text-secondary">Designed By KPX TWM</p>
<a href="home.jsp" class="text-white ms-2">HOME</a> | FOLLOW US : |
<a href="#" class="text-white ms-2">FB</a> | 
<a href="#" class="text-white ms-2">IG</a> | 
<a href="#" class="text-white ms-2">Twitter</a>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>