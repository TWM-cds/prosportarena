<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String companyName = application.getInitParameter("companyName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Promotions | <%=companyName%></title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#f8f9fa;
}

.promo-header{
background:linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),
url('https://images.unsplash.com/photo-1521417531039-02e7bcb5c9e8?w=1600&auto=format&fit=crop');
background-size:cover;
background-position:center;
color:white;
padding:120px 0;
text-align:center;
}

.card{
transition:0.3s;
}

.card:hover{
transform:translateY(-8px);
box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

.promo-badge{
position:absolute;
top:10px;
left:10px;
font-size:14px;
}

.countdown{
font-weight:bold;
color:red;
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

<a class="btn btn-outline-light me-2" href="Cart.jsp">My Cart</a>
<a class="btn btn-danger" href="LogoutServlet">Logout</a>

</nav>


<!-- HEADER -->

<div class="promo-header">

<h1>🔥 Mega Sports Promotions</h1>
<p class="lead">Limited time deals for our customers</p>
<h4 class="countdown"></h4>

</div>


<div class="container mt-5">

<h2 class="text-center mb-4">Latest Deals</h2>

<div class="row g-4">

<!-- Promo 1 -->

<div class="col-md-4">

<div class="card shadow position-relative">

<span class="badge bg-danger promo-badge">30% OFF</span>

<img src="https://images.unsplash.com/photo-1575361204480-aadea25e6e68?w=500&auto=format&fit=crop">

<div class="card-body text-center">

<h5>Professional Football</h5>

<p class="text-muted"><del>RM150</del></p>

<h4 class="text-danger">RM105</h4>

<a href="SearchServlet?keyword=football" class="btn btn-primary mt-2">Shop Now</a>

</div>

</div>

</div>


<!-- Promo 2 -->

<div class="col-md-4">

<div class="card shadow position-relative">

<span class="badge bg-warning promo-badge">HOT</span>

<img src="https://images.unsplash.com/photo-1519864600265-abb23847ef2c?w=500&auto=format&fit=crop">

<div class="card-body text-center">

<h5>Basketball Elite</h5>

<p class="text-muted"><del>RM180</del></p>

<h4 class="text-danger">RM140</h4>

<a href="SearchServlet?keyword=basketball" class="btn btn-primary mt-2">Shop Now</a>

</div>

</div>

</div>


<!-- Promo 3 -->

<div class="col-md-4">

<div class="card shadow position-relative">

<span class="badge bg-success promo-badge">MEMBER DEAL</span>

<img src="https://images.unsplash.com/photo-1584270354949-c26b0d5b4a0d?w=500&auto=format&fit=crop">

<div class="card-body text-center">

<h5>Badminton Racket Pro</h5>

<p class="text-muted"><del>RM350</del></p>

<h4 class="text-danger">RM299</h4>

<a href="SearchServlet?keyword=badminton" class="btn btn-primary mt-2">Shop Now</a>

</div>

</div>

</div>

</div>


<hr class="my-5">


<h2 class="text-center mb-4">Special Member Offers</h2>

<div class="row text-center">

<div class="col-md-4">

<div class="card shadow p-4">

<h4>🎂 Birthday Voucher</h4>

<p>Gold members receive RM20 birthday voucher every year.</p>

</div>

</div>

<div class="col-md-4">

<div class="card shadow p-4">

<h4>💳 Member Discount</h4>

<p>Gold members enjoy up to 20% discount on selected products.</p>

</div>

</div>

<div class="col-md-4">

<div class="card shadow p-4">

<h4>🚚 Free Shipping</h4>

<p>Premium members enjoy free delivery nationwide.</p>

</div>

</div>

</div>


</div>


<!-- CTA -->

<div class="bg-dark text-white text-center p-5 mt-5">

<h3>Become a Member & Unlock More Deals</h3>

<a href="membership.jsp" class="btn btn-warning btn-lg mt-3">Join Membership</a>

</div>


<footer class="bg-dark text-white text-center p-3 mt-4">

<p>© 2026 <%=companyName%> | All Rights Reserved</p>

<p class="small text-secondary">Designed By KPX TWM</p>

</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


<script>

var countDownDate = new Date().getTime() + (5 * 60 * 60 * 1000);

var x = setInterval(function() {

var now = new Date().getTime();
var distance = countDownDate - now;

if(distance <= 0){

clearInterval(x);
document.querySelector(".countdown").innerHTML = "Promotion Ended";
return;

}

var hours = Math.floor((distance % (1000*60*60*24)) / (1000*60*60));
var minutes = Math.floor((distance % (1000*60*60)) / (1000*60));
var seconds = Math.floor((distance % (1000*60)) / 1000);

document.querySelector(".countdown").innerHTML =
"Promotion Ends In: " + hours + "h " + minutes + "m " + seconds + "s ";

},1000);

</script>

</body>
</html>