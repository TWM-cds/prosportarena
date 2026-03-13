<%@page contentType="text/html"%>
<%
    String role = (String) session.getAttribute("userRole");
    if(role == null || !role.equals("customer")){
        response.sendRedirect("login.jsp");
    }
%>

<html>
<head>
<title>Customer Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
    <h2>? Customer Dashboard</h2>
    <p>Welcome, <%=session.getAttribute("userEmail")%></p>

    <div class="card p-4">
        <h4>Your Benefits</h4>
        <ul>
            <li>Member Discounts</li>
            <li>Exclusive Promotions</li>
            <li>Faster Checkout</li>
        </ul>
    </div>

    <a href="LogoutServlet" class="btn btn-danger mt-3">Logout</a>
</div>

</body>
</html>