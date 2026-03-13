<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Register | ProSportArena</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background: linear-gradient(-45deg,#1f4037,#99f2c8,#000000,#434343);
background-size:400% 400%;
animation:gradient 12s ease infinite;
height:100vh;
}

@keyframes gradient{
0%{background-position:0% 50%}
50%{background-position:100% 50%}
100%{background-position:0% 50%}
}

.card{
border-radius:15px;
}

.logo{
font-weight:bold;
font-size:24px;
color:white;
}

#membership{
width:100%;
padding:8px 12px;
border-radius:8px;
border:1px solid #ccc;
box-sizing:border-box;
font-size:14px;
white-space:normal;
overflow-wrap:break-word;
}

@media(max-width:500px){
.card{
width:90%;
}
}

</style>
</head>

<body>

<nav class="navbar navbar-dark bg-dark px-4">
<span class="logo">🏆 ProSportArena</span>
</nav>

<div class="container d-flex justify-content-center align-items-center" style="height:90vh;">

<div class="card shadow p-4" style="width:450px;">

<h3 class="text-center mb-3">📝 Register</h3>

<!-- ONLY ADD id -->
<form id="registerForm" action="RegisterServlet" method="post" onsubmit="return validatePassword()">

<div class="mb-3">
<label>Full Name</label>
<input type="text" name="name" class="form-control" required>
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" id="email" class="form-control" required>
<small id="emailMsg" class="fw-bold"></small>
</div>

<div class="mb-3">

<label>Password</label>

<div class="input-group">

<input type="password" id="password" name="password" class="form-control" required>

<button type="button" class="btn btn-outline-secondary" onclick="togglePassword()">
👁
</button>

</div>

</div>

<div class="mb-3">

<label>Confirm Password</label>

<input type="password" name="confirmPassword" id="confirmPassword" class="form-control" required>

<div id="match" class="small text-danger mt-1">
• Passwords must match
</div>

<div class="progress mt-2">
<div id="strengthBar" class="progress-bar" style="width:0%"></div>
</div>

<small id="strengthText" class="fw-bold"></small>

</div>

<div class="mb-3">

<label>Membership Level</label>

<select name="membership" id="membership">

<option value="Basic">
Basic (0%) — Free, no annual fee
</option>

<option value="Silver">
Silver (5% discount + 10% on member day)— RM30/year
</option>

<option value="Gold">
Gold (10% discount + Birthday RM20 voucher + 20% on member day)— RM60/year
</option>

</select>

</div>

<!-- CHANGE BUTTON TYPE ONLY -->

<button type="button" onclick="handleRegistration()" class="btn btn-success w-100">
Create Account
</button>

</form>

<div class="text-danger text-center mt-2">
<%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
</div>

<div class="text-center mt-3">
Already have account? <a href="Login.jsp">Login</a>
</div>

<div class="text-center mt-3">
Guest? <a href="home.jsp">Home</a>
</div>

</div>
</div>

<script>

// SHOW / HIDE PASSWORD
function togglePassword(){
const pass=document.getElementById("password");
pass.type=pass.type==="password"?"text":"password";
}

// PASSWORD STRENGTH
const password=document.getElementById("password");
const strengthBar=document.getElementById("strengthBar");
const strengthText=document.getElementById("strengthText");

password.addEventListener("keyup",function(){

let value=password.value;
let strength=0;

if(value.length>=8) strength+=25;
if(/[A-Z]/.test(value)) strength+=25;
if(/[0-9]/.test(value)) strength+=25;
if(/[^A-Za-z0-9]/.test(value)) strength+=25;

strengthBar.style.width=strength+"%";

if(strength<=25){
strengthBar.className="progress-bar bg-danger";
strengthText.innerText="Weak";
strengthText.className="text-danger fw-bold";
}
else if(strength<=50){
strengthBar.className="progress-bar bg-warning";
strengthText.innerText="Medium";
strengthText.className="text-warning fw-bold";
}
else if(strength<=75){
strengthBar.className="progress-bar bg-info";
strengthText.innerText="Strong";
strengthText.className="text-info fw-bold";
}
else{
strengthBar.className="progress-bar bg-success";
strengthText.innerText="Very Strong";
strengthText.className="text-success fw-bold";
}

});


// ⭐ ADDED PASSWORD MATCH CHECK
const confirmPassword=document.getElementById("confirmPassword");
const match=document.getElementById("match");

confirmPassword.addEventListener("keyup",function(){

if(confirmPassword.value!==password.value){
match.innerText="Passwords do not match";
match.className="text-danger";
}else{
match.innerText="Passwords match ✔";
match.className="text-success";
}

});


// EMAIL LIVE CHECK
const emailInput=document.getElementById("email");
const emailMsg=document.getElementById("emailMsg");

emailInput.addEventListener("keyup",function(){

let email=emailInput.value;

if(email.length>5){

fetch("CheckEmailServlet?email="+email)
.then(response=>response.text())
.then(data=>{

if(data==="EXISTS"){

emailMsg.innerText="Email already registered!";
emailMsg.className="text-danger fw-bold";

emailInput.classList.add("is-invalid");
emailInput.classList.remove("is-valid");

}
else{

emailMsg.innerText="Email available ✔";
emailMsg.className="text-success fw-bold";

emailInput.classList.add("is-valid");
emailInput.classList.remove("is-invalid");

}

});

}

});


// MEMBERSHIP FEE DISPLAY
const membership=document.getElementById("membership");
const membershipFee=document.getElementById("membershipFee");

membership.addEventListener("change",function(){

let value=membership.value;

if(value==="Basic"){
membershipFee.innerText="RM0";
}
else if(value==="Silver"){
membershipFee.innerText="RM30";
}
else if(value==="Gold"){
membershipFee.innerText="RM60";
}

});


// ⭐ ADDED VALIDATION FUNCTION
function validatePassword(){

const password=document.getElementById("password").value;
const confirm=document.getElementById("confirmPassword").value;

if(password!==confirm){
alert("Passwords do not match!");
return false;
}

return true;

}


// ⭐ NEW FEATURE (ONLY ADD)
function handleRegistration(){

const membership=document.getElementById("membership").value;

if(membership==="Basic"){

document.getElementById("registerForm").submit();

}
else{

const name=document.querySelector("input[name='name']").value;
const email=document.querySelector("input[name='email']").value;
const password=document.querySelector("input[name='password']").value;

window.location.href=
"Payment.jsp?name="+encodeURIComponent(name)+
"&email="+encodeURIComponent(email)+
"&password="+encodeURIComponent(password)+
"&membership="+membership;

}

}

</script>

</body>
</html>