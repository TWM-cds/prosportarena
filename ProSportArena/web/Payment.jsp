<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String membership = request.getParameter("membership");

int fee = 0;
if("Silver".equals(membership)) fee = 30;
if("Gold".equals(membership)) fee = 60;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Payment | ProSportArena</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="card shadow p-4" style="max-width:500px;margin:auto;">
        <h3 class="text-center mb-4">💳 Membership Payment</h3>
        <p><b>Name:</b> <%=name%></p>
        <p><b>Email:</b> <%=email%></p>
        <p><b>Membership:</b> <%=membership%></p>
        <h4 class="text-success text-center">Total Fee: RM <%=fee%></h4>

        <form action="CreateBillServlet" method="post">
            <input type="hidden" name="name" value="<%=name%>">
            <input type="hidden" name="email" value="<%=email%>">
            <input type="hidden" name="password" value="<%=password%>">
            <input type="hidden" name="membership" value="<%=membership%>">
            <input type="hidden" name="fee" value="<%=fee%>">

            <button type="submit" class="btn btn-success w-100 mt-3">
                Proceed to Payment
            </button>
        </form>
    </div>
</div>
</body>
</html>