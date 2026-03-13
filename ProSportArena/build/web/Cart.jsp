<%@page import="java.util.*"%>

<h2>Your Cart</h2>

<%
    List<String> cart = (List<String>) session.getAttribute("cart");

    if(cart == null || cart.isEmpty()){
%>
        <p>Your cart is empty.</p>
<%
    } else {
        for(String item : cart){
%>
        <div><%= item %></div>
<%
        }
    }
%>

<a href="home.jsp">Back to Home</a>