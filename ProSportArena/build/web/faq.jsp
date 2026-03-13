<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String companyName = application.getInitParameter("companyName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ | <%=companyName%></title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    scroll-behavior: smooth;
}

.navbar {
    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
}

.hero {
    background: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),
    url('https://images.unsplash.com/photo-1581090700227-91a5e8c78da1?w=1600&auto=format&fit=crop');
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

.accordion-button:focus {
    box-shadow: none;
}

footer {
    margin-top: 60px;
}
</style>
</head>
<body>

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
<h1>Frequently Asked Questions</h1>
<p class="lead">Find answers to common questions about our products & services</p>
</div>

<!-- FAQ SECTION -->
<section class="container my-5">
<h2 class="text-center mb-4">Your Questions Answered</h2>

<div class="accordion" id="faqAccordion">

  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        1. How can I track my order?
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
      <div class="accordion-body">
        You can track your order by logging into your account and visiting the "My Orders" page. Click on the order you want to track to see the latest status and tracking details.
      </div>
    </div>
  </div>

  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        2. What is the return policy?
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
      <div class="accordion-body">
        Our return policy allows returns within 14 days of delivery. Products must be unused and in their original packaging. Visit the "Return Policy" page for detailed instructions.
      </div>
    </div>
  </div>

  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        3. How do I apply a discount code?
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
      <div class="accordion-body">
        You can enter your discount code during the checkout process. The discount will be applied before payment is processed. Only one code can be used per order.
      </div>
    </div>
  </div>

  <div class="accordion-item">
    <h2 class="accordion-header" id="headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        4. Do you offer international shipping?
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#faqAccordion">
      <div class="accordion-body">
        Currently, we only offer shipping within Malaysia. We are planning to expand internationally soon. Stay updated through our newsletter for future shipping options.
      </div>
    </div>
  </div>

  <div class="accordion-item">
    <h2 class="accordion-header" id="headingFive">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
        5. How do I contact customer support?
      </button>
    </h2>
    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#faqAccordion">
      <div class="accordion-body">
        You can reach our customer support team via the "Help Center" link in the footer, by email, or by clicking the chat button on any page. We aim to respond within 24 hours.
      </div>
    </div>
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