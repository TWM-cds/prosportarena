<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String companyName = application.getInitParameter("companyName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shipping Info | <%=companyName%></title>

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
    url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1600&auto=format&fit=crop');
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

.info-section h3 {
    margin-top: 20px;
    font-weight: bold;
}

.info-section p {
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
    <h1>Shipping Information</h1>
    <p class="lead">Everything you need to know about our delivery services</p>
</div>

<!-- SHIPPING INFO SECTION -->
<section class="container my-5 info-section">
    <h2 class="text-center mb-4">Shipping Details</h2>

    <div class="row">
        <div class="col-md-6 mb-4">
            <h3>Delivery Time</h3>
            <p>We provide nationwide delivery across Malaysia. Most orders are processed within <strong>24 hours</strong> and delivered within <strong>2–3 business days</strong>.</p>
        </div>

        <div class="col-md-6 mb-4">
            <h3>Shipping Cost</h3>
            <p>Standard shipping is <strong>RM10</strong> for orders below RM100. Orders above RM100 enjoy <strong>free shipping</strong>. Shipping fees are automatically calculated at checkout.</p>
        </div>

        <div class="col-md-6 mb-4">
            <h3>Order Tracking</h3>
            <p>Once your order is shipped, you will receive a tracking number via email. Track your order through the "My Orders" page in your account for real-time updates.</p>
        </div>

        <div class="col-md-6 mb-4">
            <h3>International Shipping</h3>
            <p>Currently, we only ship within Malaysia. We are planning to expand internationally in the near future. Subscribe to our newsletter for updates.</p>
        </div>

        <div class="col-md-12 mb-4">
            <h3>Special Handling</h3>
            <p>All products are carefully packed to ensure they reach you in perfect condition. Fragile items are marked and handled with extra care.</p>
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