package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get current session, do NOT create new
        HttpSession session = request.getSession(false);
        
        if(session != null){
            // Optional: get user info for logging
            String email = (String) session.getAttribute("userEmail");
            String role = (String) session.getAttribute("userRole");
            
            System.out.println("User logged out: " + email + " (" + role + ")");
            
            // Invalidate session
            session.invalidate();
        }
        
        // Redirect to homepage after logout
        response.sendRedirect("home.jsp");
    }
    
    // Optional: handle POST as well
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}