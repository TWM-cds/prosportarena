<%@page contentType="text/html"%>
<%
    String role = (String) session.getAttribute("userRole");
    if(role == null || !role.equals("admin")){
        response.sendRedirect("login.jsp");
    }
%>

<html>
<head>
<title>Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark text-white">

<div class="container mt-5">
    <h2>? Admin Dashboard</h2>
    <p>Welcome, <%=session.getAttribute("userEmail")%></p>

    <div class="card p-4 bg-light text-dark">
        <h4>Admin Controls</h4>
        <ul>
            <li>Manage Products</li>
            <li>View Orders</li>
            <li>Manage Members</li>
        </ul>
    </div>

    <a href="LogoutServlet" class="btn btn-danger mt-3">Logout</a>
</div>

</body>
</html>