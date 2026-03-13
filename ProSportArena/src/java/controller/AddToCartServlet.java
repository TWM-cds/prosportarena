package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

import javax.servlet.annotation.WebServlet;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String productName = request.getParameter("productName");
        String price = request.getParameter("price");

        HttpSession session = request.getSession();

        List<String> cart = (List<String>) session.getAttribute("cart");

        if(cart == null){
            cart = new ArrayList<>();
        }

        cart.add(productName + " - RM" + price);

        session.setAttribute("cart", cart);
        session.setAttribute("cartCount", cart.size());

        response.sendRedirect("home.jsp");
    }
}