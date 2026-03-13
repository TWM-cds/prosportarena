<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login | ProSportArena</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body{
            background: linear-gradient(-45deg,#0f2027,#203a43,#2c5364,#000000);
            background-size: 400% 400%;
            animation: gradient 10s ease infinite;
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
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark px-4">
    <span class="logo">🏆 ProSportArena</span>
</nav>

<div class="container d-flex justify-content-center align-items-center" style="height:90vh;">
    <div class="card shadow p-4" style="width:400px;">

        <h3 class="text-center mb-3">🔐 Login</h3>

        <form action="LoginServlet" method="post">

            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Password</label>
                <div class="input-group">
                    <input type="password" name="password" id="password" class="form-control" required>
                    <button type="button" class="btn btn-outline-secondary" onclick="togglePassword()">👁</button>
                </div>
            </div>

            <div class="mb-3">
                <label>Login As</label>
                <select name="role" class="form-select">
                    <option value="customer">Customer</option>
                    <option value="admin">Admin</option>
                </select>
            </div>

            <button type="submit" class="btn btn-dark w-100">Login</button>
        </form>

        <div class="text-danger text-center mt-2">
            <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
        </div>

        <div class="text-center mt-3">
            Don't have account? <a href="Register.jsp">Register</a>
        </div>

    </div>
</div>

<script>
function togglePassword(){
    var x = document.getElementById("password");
    if(x.type === "password"){
        x.type = "text";
    } else {
        x.type = "password";
    }
}
</script>

</body>
</html>