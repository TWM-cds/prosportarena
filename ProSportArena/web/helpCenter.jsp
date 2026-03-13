<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String companyName = application.getInitParameter("companyName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Help Center | <%=companyName%></title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#f5f6fa;
}

.hero{
    background:linear-gradient(135deg,#1e3c72,#2a5298);
    color:white;
    padding:70px 0;
    text-align:center;
}

.search-box{
    max-width:500px;
    margin:auto;
}

.card:hover{
    transform:translateY(-5px);
    transition:0.3s;
    box-shadow:0 8px 20px rgba(0,0,0,0.2);
}

.faq-section{
    margin-top:50px;
}

.live-chat{
    position:fixed;
    bottom:25px;
    right:25px;
    width:60px;
    height:60px;
    border-radius:50%;
    background:#28a745;
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:26px;
    cursor:pointer;
    box-shadow:0 4px 10px rgba(0,0,0,0.3);
    z-index:1000;
}

.ticket-form{
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 8px 25px rgba(0,0,0,0.2);
    max-width:600px;
    margin:auto;
}

</style>

</head>

<body>

<!-- HERO -->
<div class="hero">
<h1>Help Center</h1>
<p>Find answers or contact support quickly</p>

<div class="search-box mt-4">
<input type="text" class="form-control form-control-lg" placeholder="Search help topics..." id="faqSearch" onkeyup="filterFAQ()">
</div>

</div>

<div class="container mt-5">

<!-- HELP CATEGORIES -->
<h3 class="text-center mb-4">Browse Help Topics</h3>

<div class="row g-4">

<div class="col-md-3">
<div class="card text-center p-3">
<h5>Account</h5>
<p class="text-muted">Login, registration, and profile</p>
</div>
</div>

<div class="col-md-3">
<div class="card text-center p-3">
<h5>Orders</h5>
<p class="text-muted">Track or manage orders</p>
</div>
</div>

<div class="col-md-3">
<div class="card text-center p-3">
<h5>Payments</h5>
<p class="text-muted">Billing and payment options</p>
</div>
</div>

<div class="col-md-3">
<div class="card text-center p-3">
<h5>Delivery</h5>
<p class="text-muted">Shipping time & policies</p>
</div>
</div>

</div>

<!-- FAQ SECTION -->
<div class="faq-section mt-5">
<h3 class="text-center mb-4">Frequently Asked Questions</h3>

<div class="accordion" id="faqAccordion">

<div class="accordion-item faq-item">
<h2 class="accordion-header">
<button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#faq1">
How do I create an account?
</button>
</h2>
<div id="faq1" class="accordion-collapse collapse show">
<div class="accordion-body">
Click the Register button on the homepage and fill in your details.
</div>
</div>
</div>

<div class="accordion-item faq-item">
<h2 class="accordion-header">
<button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#faq2">
How can I track my order?
</button>
</h2>
<div id="faq2" class="accordion-collapse collapse">
<div class="accordion-body">
Track your order in the account dashboard after purchase.
</div>
</div>
</div>

<div class="accordion-item faq-item">
<h2 class="accordion-header">
<button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#faq3">
What payment methods are available?
</button>
</h2>
<div id="faq3" class="accordion-collapse collapse">
<div class="accordion-body">
Credit/Debit cards and online banking are accepted.
</div>
</div>
</div>

<div class="accordion-item faq-item">
<h2 class="accordion-header">
<button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#faq4">
How long does delivery take?
</button>
</h2>
<div id="faq4" class="accordion-collapse collapse">
<div class="accordion-body">
Delivery usually takes 2–5 working days depending on location.
</div>
</div>
</div>

</div>

</div>

<!-- TICKET SUBMISSION -->
<div class="mt-5">
<h3 class="text-center mb-4">Submit a Support Ticket</h3>

<div class="ticket-form">
<form action="SubmitTicketServlet" method="post">
<div class="mb-3">
<label for="name" class="form-label">Your Name</label>
<input type="text" class="form-control" id="name" name="name" required>
</div>

<div class="mb-3">
<label for="email" class="form-label">Email address</label>
<input type="email" class="form-control" id="email" name="email" required>
</div>

<div class="mb-3">
<label for="subject" class="form-label">Subject</label>
<input type="text" class="form-control" id="subject" name="subject" required>
</div>

<div class="mb-3">
<label for="message" class="form-label">Message</label>
<textarea class="form-control" id="message" name="message" rows="4" required></textarea>
</div>

<button type="submit" class="btn btn-primary w-100">Submit Ticket</button>
</form>
</div>
</div>

</div>

<!-- LIVE CHAT BUTTON -->
<div class="live-chat" onclick="openChat()">
💬
</div>

<!-- FOOTER -->
<footer class="bg-dark text-white text-center p-3 mt-5">
© 2026 <%=companyName%> Help Center | 
<a href="home.jsp" class="text-white ms-2">HOME</a>  | Follow us: |
<a href="#" class="text-white ms-2">FB</a> | 
<a href="#" class="text-white ms-2">IG</a> | 
<a href="#" class="text-white ms-2">Twitter</a>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
// FAQ search filter
function filterFAQ(){
    let input = document.getElementById('faqSearch').value.toLowerCase();
    let items = document.getElementsByClassName('faq-item');
    Array.from(items).forEach(function(item){
        let text = item.innerText.toLowerCase();
        item.style.display = text.includes(input) ? '' : 'none';
    });
}

// Dummy live chat popup
function openChat(){
    alert("Welcome to live chat! Our support team will contact you shortly.");
}
</script>

</body>
</html>
