<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String companyName = application.getInitParameter("companyName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Membership | <%=companyName%></title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#f8f9fa;
}

/* Header */
.membership-header{
    background:linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),
    url('https://images.unsplash.com/photo-1517649763962-0c623066013b?w=1600&auto=format&fit=crop');
    background-size:cover;
    background-position:center;
    color:white;
    padding:100px 0;
    text-align:center;
}

/* Card hover animation */
.card{
    transition:0.3s;
}

.card:hover{
    transform:translateY(-10px);
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

.price{
    font-size:40px;
    font-weight:bold;
}

.feature-list{
    list-style:none;
    padding:0;
}

.feature-list li{
    padding:8px 0;
}

.popular{
    border:3px solid gold;
}

.badge-popular{
    position:absolute;
    top:-10px;
    right:-10px;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 sticky-top">
<a class="navbar-brand fw-bold" href="home.jsp"><%=companyName%></a>

<form class="d-flex ms-auto me-3" action="SearchServlet" method="get">
<input class="form-control me-2" type="search" name="keyword" placeholder="Search products...">
<button class="btn btn-warning">Search</button>
</form>

<a class="btn btn-outline-light me-2" href="Login.jsp">Login</a>
<a class="btn btn-success" href="Register.jsp">Register</a>
</nav>


<!-- HEADER -->
<div class="membership-header">
<h1>Join <%=companyName%> Membership</h1>
<p class="lead">Enjoy exclusive discounts and premium benefits</p>
</div>


<div class="container mt-5">

<h2 class="text-center mb-5">Choose Your Membership Plan</h2>

<div class="row g-4">

<!-- FREE MEMBER -->
<div class="col-md-4">
<div class="card shadow text-center p-4">

<h3>Free Member</h3>

<p class="price text-secondary">RM0</p>

<ul class="feature-list">
<li>✔ Basic account access</li>
<li>✔ Add products to cart</li>
<li>✔ Access to promotions</li>
</ul>

<a href="Register.jsp" class="btn btn-outline-primary mt-3">Join Free</a>

</div>
</div>


<!-- SILVER MEMBER -->
<div class="col-md-4">
<div class="card shadow text-center p-4 position-relative popular">

<span class="badge bg-warning text-dark badge-popular">POPULAR</span>

<h3>Silver Member</h3>

<p class="price text-primary">RM30 per year</p>

<ul class="feature-list">
<li>✔ 5% product discount</li>
<li>✔10% on member day</li>
<li>✔ Early access promotions</li>
</ul>

<a href="Register.jsp" class="btn btn-primary mt-3">Upgrade Now</a>

</div>
</div>


<!-- GOLD MEMBER -->
<div class="col-md-4">
<div class="card shadow text-center p-4">

<h3>Gold Member</h3>

<p class="price text-warning">RM60 per year</p>

<ul class="feature-list">
<li>✔ 10% product discount</li>
<li>✔ Birthday voucher RM20</li>
<li>✔ 20% on member day</li>
</ul>

<a href="Register.jsp" class="btn btn-warning mt-3">Become Gold</a>

</div>
</div>

</div>


<!-- BENEFITS SECTION -->
<section class="mt-5">

<h2 class="text-center mb-4">Membership Benefits</h2>

<div class="row text-center">

<div class="col-md-3">
<h4>🎁 Exclusive Rewards</h4>
<p>Members receive special vouchers and rewards.</p>
</div>

<div class="col-md-3">
<h4>🚚 Fast Delivery</h4>
<p>Priority shipping for premium members.</p>
</div>

<div class="col-md-3">
<h4>⚡ Early Promotions</h4>
<p>Access sales earlier than regular users.</p>
</div>

<div class="col-md-3">
<h4>💬 VIP Support</h4>
<p>Premium customer service for members.</p>
</div>

</div>

</section>


<!-- CTA -->
<div class="bg-dark text-white text-center p-5 mt-5 rounded">
<h3>Become a Member Today & Save More!</h3>
<a href="Register.jsp" class="btn btn-success btn-lg mt-3">Register Now</a>
</div>


</div>


<!-- FOOTER -->
<footer class="bg-dark text-white text-center p-3 mt-5">
<p>© 2026 <%=companyName%> | All Rights Reserved</p>
<p class="small text-secondary">Designed By KPX TWM</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>