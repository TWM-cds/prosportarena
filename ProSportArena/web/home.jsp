<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String companyName = application.getInitParameter("companyName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=companyName%></title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    scroll-behavior:smooth;
}

.navbar{
    box-shadow:0 2px 8px rgba(0,0,0,0.2);
}

.hero{
    background: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),
    url('https://images.unsplash.com/photo-1517649763962-0c623066013b?w=1600&auto=format&fit=crop');
    background-size:cover;
    background-position:center;
    color:white;
    padding:130px 0;
    text-align:center;
}

.hero h1{
    font-size:48px;
    font-weight:bold;
}

.card{
    transition:0.3s;
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 8px 20px rgba(0,0,0,0.3);
}

.card img{
    height:220px;
    width:100%;
    object-fit:cover;
}

.countdown{
    font-weight:bold;
    font-size:20px;
}

footer{
    margin-top:60px;
}
</style>
</head>

<body>
<a href="#" class="btn btn-primary rounded-circle"
style="
position:fixed;
bottom:25px;
right:25px;
width:60px;
height:60px;
font-size:26px;
display:flex;
align-items:center;
justify-content:center;
box-shadow:0 4px 10px rgba(0,0,0,0.3);
">
💬
</a>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 sticky-top">
    <a class="navbar-brand fw-bold" href="#"><%=companyName%></a>

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


<!-- CAROUSEL -->
<div id="promoCarousel" class="carousel slide" data-bs-ride="carousel">

<div class="carousel-inner">

<div class="carousel-item active">
<div class="hero">
<h1>20% OFF Gold Members</h1>
<p class="lead">Limited Time Promotion</p>
<h3 class="countdown text-warning mt-3"></h3>
<a href="Register.jsp" class="btn btn-warning btn-lg mt-3">Join Now</a>
</div>
</div>

<div class="carousel-item">
<div class="hero">
<h1>Birthday Voucher RM20</h1>
<p class="lead">Exclusive for Gold Members</p>
</div>
</div>

<div class="carousel-item">
<div class="hero">
<h1>Sports Mega Sale</h1>
<p class="lead">Up to 30% discount on selected items</p>
</div>
</div>

</div>

</div>

<section class="container mt-5">

<h2 class="text-center mb-4">Shop By Category</h2>

<div class="row text-center">

<div class="col-md-3">
<div class="card shadow p-3">
<h4>⚽ Football</h4>
<p>Professional football gear</p>
<a href="SearchServlet?keyword=football" class="btn btn-outline-primary">Explore</a>
</div>
</div>

<div class="col-md-3">
<div class="card shadow p-3">
<h4>🏀 Basketball</h4>
<p>Elite basketball equipment</p>
<a href="SearchServlet?keyword=basketball" class="btn btn-outline-primary">Explore</a>
</div>
</div>

<div class="col-md-3">
<div class="card shadow p-3">
<h4>🏸 Badminton</h4>
<p>Professional badminton rackets</p>
<a href="SearchServlet?keyword=badminton" class="btn btn-outline-primary">Explore</a>
</div>
</div>

<div class="col-md-3">
<div class="card shadow p-3">
<h4>👟 Running</h4>
<p>High performance running shoes</p>
<a href="SearchServlet?keyword=running" class="btn btn-outline-primary">Explore</a>
</div>
</div>

</div>

</section>
<div class="container mt-5">

<h2 class="text-center mb-4">Hot Selling Products</h2>

<div class="row g-4">

<!-- Product 1 -->
<div class="col-md-3">
<div class="card shadow position-relative">
<span class="badge bg-danger position-absolute top-0 start-0 m-2">SALE</span>
<img src="https://images.unsplash.com/photo-1575361204480-aadea25e6e68?w=500&auto=format&fit=crop">
<div class="card-body text-center">
<h5>Football Pro</h5>
<p class="text-muted"><del>RM150</del></p>
<strong class="text-danger">RM120</strong>
</div>
</div>
<form action="AddToCartServlet" method="post">
<input type="hidden" name="productName" value="Football Pro">
<input type="hidden" name="price" value="120">
<button class="btn btn-success w-100 mt-2">Add To Cart</button>
</form>
</div>

<!-- Product 2 -->
<div class="col-md-3">
<div class="card shadow">
<img src="https://images.unsplash.com/photo-1519864600265-abb23847ef2c?w=500&auto=format&fit=crop">
<div class="card-body text-center">
<h5>Basketball Elite</h5>
<strong>RM180</strong>
</div>
</div>
<form action="AddToCartServlet" method="post">
<input type="hidden" name="productName" value="Basketball Elite">
<input type="hidden" name="price" value="180">
<button class="btn btn-success w-100 mt-2">Add To Cart</button>
</form>
</div>

<!-- Product 3 -->
<div class="col-md-3">
<div class="card shadow position-relative">
<span class="badge bg-warning position-absolute top-0 start-0 m-2">HOT</span>
<img src="https://images.unsplash.com/photo-1584270354949-c26b0d5b4a0d?w=500&auto=format&fit=crop">
<div class="card-body text-center">
<h5>Badminton Racket Pro</h5>
<strong>RM350</strong>
</div>
</div>
<form action="AddToCartServlet" method="post">
<input type="hidden" name="productName" value="Badminton Racket Pro">
<input type="hidden" name="price" value="350">
<button class="btn btn-success w-100 mt-2">Add To Cart</button>
</form>
</div>

<!-- Product 4 -->
<div class="col-md-3">
<div class="card shadow">
<img src="https://images.unsplash.com/photo-1599058917765-a780eda07a3e?w=500&auto=format&fit=crop">
<div class="card-body text-center">
<h5>Running Shoes</h5>
<strong>RM280</strong>
</div>
</div>
<form action="AddToCartServlet" method="post">
<input type="hidden" name="productName" value="Running Shoes">
<input type="hidden" name="price" value="280">
<button class="btn btn-success w-100 mt-2">Add To Cart</button>
</form>
</div>

</div>


<hr class="my-5">

<h2 class="text-center mb-4">Why Choose <%=companyName%>?</h2>

<div class="row text-center">

<div class="col-md-4">
<h4>Fast Delivery</h4>
<p>Nationwide delivery within 2–3 days</p>
</div>

<div class="col-md-4">
<h4>Secure Payment</h4>
<p>100% secure online payment system</p>
</div>

<div class="col-md-4">
<h4>Quality Guarantee</h4>
<p>Authentic & high-quality sports equipment</p>
</div>

</div>
<section class="bg-light p-5 mt-5">

<div class="container text-center">

<div class="row">

<div class="col-md-4">
<h1 class="text-primary">10,000+</h1>
<p>Happy Customers</p>
</div>

<div class="col-md-4">
<h1 class="text-success">5,000+</h1>
<p>Products Sold</p>
</div>

<div class="col-md-4">
<h1 class="text-danger">4.9★</h1>
<p>Customer Rating</p>
</div>

</div>

</div>

</section>
<section class="container mt-5">

<h2 class="text-center mb-4">Customer Reviews</h2>

<div class="row">

<div class="col-md-4">
<div class="card shadow p-3">
<p>"Great quality sports equipment!"</p>
<strong>- Jason</strong>
</div>
</div>

<div class="col-md-4">
<div class="card shadow p-3">
<p>"Fast delivery and excellent service."</p>
<strong>- Amanda</strong>
</div>
</div>

<div class="col-md-4">
<div class="card shadow p-3">
<p>"Best sports store online!"</p>
<strong>- Daniel</strong>
</div>
</div>

</div>

</section>

<div class="bg-dark text-white text-center p-5 mt-5 rounded">
<h3>Become a Member Today & Enjoy Exclusive Discounts!</h3>
<a href="Register.jsp" class="btn btn-success btn-lg mt-3">Register Now</a>
</div>

</div>
<button onclick="window.scrollTo({top:0,behavior:'smooth'})"
class="btn btn-dark"
style="position:fixed;bottom:100px;right:25px;">
↑
</button>
<!-- INFO SECTION -->
<div class="container mt-5">

<div class="row text-center text-md-start">

<!-- About -->
<div class="col-md-3 mb-4">
<h5 class="fw-bold">About Us</h5>
<p class="text-muted">
<%=companyName%> is a trusted online sports store providing
high quality equipment for football, basketball,
badminton and more.
</p>
</div>

<!-- Customer Service -->
<div class="col-md-3 mb-4">
<h5 class="fw-bold">Customer Service</h5>
<ul class="list-unstyled">
<li><a href="helpCenter.jsp" class="text-decoration-none text-dark">Help Center</a></li>
<li><a href="faq.jsp" class="text-decoration-none text-dark">FAQ</a></li>
<li><a href="shippingInfo.jsp" class="text-decoration-none text-dark">Shipping Info</a></li>
<li><a href="returnPolicy.jsp" class="text-decoration-none text-dark">Return Policy</a></li>
</ul>
</div>

<!-- Quick Links -->
<div class="col-md-3 mb-4">
<h5 class="fw-bold">Quick Links</h5>
<ul class="list-unstyled">
<li><a href="home.jsp" class="text-decoration-none text-dark">Home</a></li>
<li><a href="Cart.jsp" class="text-decoration-none text-dark">My Cart</a></li>
<li><a href="membership.jsp" class="text-decoration-none text-dark">Membership</a></li>
<li><a href="promotion.jsp" class="text-decoration-none text-dark">Promotions</a></li>
</ul>
</div>

<!-- Follow Us -->
<div class="col-md-3 mb-4">
<h5 class="fw-bold">Follow Us</h5>

<a href="#" class="me-2">
<img src="https://cdn-icons-png.flaticon.com/512/733/733547.png" width="30">
</a>

<a href="#" class="me-2">
<img src="https://cdn-icons-png.flaticon.com/512/733/733558.png" width="30">
</a>

<a href="#" class="me-2">
<img src="https://cdn-icons-png.flaticon.com/512/733/733579.png" width="30">
</a>

<a href="#">
<img src="https://cdn-icons-png.flaticon.com/512/733/733635.png" width="30">
</a>

<p class="mt-3 text-muted">
Follow us for latest promotions & sports deals!
</p>

</div>

</div>

</div>
<footer class="bg-dark text-white text-center p-3 mt-4">

<p class="mb-1">
© 2026 <%=companyName%> | All Rights Reserved
</p>

<p class="small text-secondary">
Designed By KPX TWM
</p>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
var countDownDate = new Date().getTime() + (6 * 60 * 60 * 1000);

var x = setInterval(function() {

var now = new Date().getTime();
var distance = countDownDate - now;

if(distance <= 0){
clearInterval(x);
var elements = document.getElementsByClassName("countdown");
for (let i = 0; i < elements.length; i++) {
elements[i].innerHTML = "Promotion Expired";
}
return;
}

var hours = Math.floor((distance % (1000*60*60*24)) / (1000*60*60));
var minutes = Math.floor((distance % (1000*60*60)) / (1000*60));
var seconds = Math.floor((distance % (1000*60)) / 1000);

var elements = document.getElementsByClassName("countdown");

for (let i = 0; i < elements.length; i++) {
elements[i].innerHTML =
"Promotion Ends In: " + hours + "h "
+ minutes + "m " + seconds + "s ";
}

}, 1000);
</script>

</body>
</html>