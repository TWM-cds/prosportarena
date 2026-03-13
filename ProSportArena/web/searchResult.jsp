<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Results</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>

body{
    background:#f4f6f9;
}

.search-container{
    margin-top:40px;
}

/* Product Card */

.product-card{
    border:none;
    border-radius:12px;
    overflow:hidden;
    transition:0.35s;
    background:white;
}

.product-card:hover{
    transform:translateY(-8px);
    box-shadow:0 10px 30px rgba(0,0,0,0.18);
}

/* Product Image */

.product-img{
    height:220px;
    object-fit:cover;
}

/* Price */

.price{
    color:#e63946;
    font-weight:bold;
    font-size:18px;
}

/* Rating */

.rating{
    color:#f4b400;
    font-size:14px;
}

/* Badge */

.badge-hot{
    position:absolute;
    top:10px;
    left:10px;
}

/* Empty Result */

.empty-box{
    padding:50px;
}

</style>
</head>

<body>

<div class="container search-container">

<%
String keyword = (String) request.getAttribute("keyword");
String[][] results = (String[][]) request.getAttribute("results");

int total = 0;
if(results != null){
    total = results.length;
}
%>

<!-- Search Header -->

<div class="text-center mb-4">

<h2 class="fw-bold">Product Search</h2>

<p class="text-muted">
<%=total%> result(s) found for 
<strong class="text-primary"><%=keyword%></strong>
</p>

</div>

<!-- Search Bar -->

<div class="row justify-content-center mb-5">

<div class="col-md-6">

<form action="SearchServlet" method="get" class="d-flex">

<input type="text" name="keyword" class="form-control me-2"
placeholder="Search product again..." required>

<button class="btn btn-primary">
<i class="bi bi-search"></i>
</button>

</form>

</div>
</div>


<div class="row">

<%
if(results != null && results.length > 0){

for(int i=0;i<results.length;i++){
%>

<div class="col-lg-3 col-md-4 col-sm-6 mb-4">

<div class="card product-card">

<div style="position:relative;">

<span class="badge bg-danger badge-hot">
HOT
</span>

<img src="<%=results[i][3]%>" class="card-img-top product-img">

</div>

<div class="card-body">

<h6 class="card-title fw-semibold">
<%=results[i][0]%>
</h6>

<p class="price mb-1">
RM <%=results[i][1]%>
</p>

<p class="rating mb-2">
<i class="bi bi-star-fill"></i>
<i class="bi bi-star-fill"></i>
<i class="bi bi-star-fill"></i>
<i class="bi bi-star-fill"></i>
<i class="bi bi-star-half"></i>
</p>

<div class="d-grid gap-2">

<a href="product.jsp?id=<%=results[i][2]%>" 
class="btn btn-outline-primary btn-sm">

<i class="bi bi-eye"></i> View Product

</a>

<a href="CartServlet?id=<%=results[i][2]%>" 
class="btn btn-success btn-sm">

<i class="bi bi-cart"></i> Add to Cart

</a>

</div>

</div>

</div>

</div>

<%
}

}else{
%>

<div class="col-12">

<div class="text-center empty-box">

<h4 class="text-muted mb-3">
No products found
</h4>

<p class="text-secondary">
Try searching with different keywords.
</p>

<a href="home.jsp" class="btn btn-secondary mt-2">
Back to Home
</a>

</div>

</div>

<%
}
%>

</div>

</div>

</body>
</html>