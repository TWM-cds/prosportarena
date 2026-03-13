package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import util.DBConnection;


import javax.servlet.annotation.WebServlet;

@WebServlet("/CheckEmailServlet")

public class CheckEmailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM users WHERE email = ?"
            );
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                response.getWriter().write("EXISTS");
            } else {
                response.getWriter().write("AVAILABLE");
            }

            conn.close();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}