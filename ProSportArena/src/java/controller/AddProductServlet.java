package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String price = request.getParameter("price");

        // For now we just print in console
        System.out.println("Product Added: " + name + " RM" + price);

        response.sendRedirect("home.jsp");
    }
}