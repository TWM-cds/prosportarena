package controller;

import util.DBConnection;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirmPassword");
        String level = request.getParameter("membership"); // FIXED

        // Password validation
        if (!password.equals(confirm)) {

            request.setAttribute("error", "Password does not match!");

            RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
            rd.forward(request, response);

            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            // Insert customer (ID auto generated)
            String sql = "INSERT INTO CUSTOMER(NAME, EMAIL, PASSWORD, MEMBERLEVEL) VALUES (?, ?, ?, ?)";

            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, level);

            int rows = ps.executeUpdate();

            if (rows > 0) {

                // Get generated ID
                rs = ps.getGeneratedKeys();

                if (rs.next()) {

                    int generatedID = rs.getInt(1);

                    System.out.println("New Customer ID: " + generatedID);

                }

                // Redirect to login
                response.sendRedirect("Login.jsp");

            }

        } catch (Exception e) {

            request.setAttribute("error", "Registration Failed: " + e.getMessage());

            RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
            rd.forward(request, response);

        } finally {

            try {

                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }
}