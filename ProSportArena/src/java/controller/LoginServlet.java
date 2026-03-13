package controller;
import util.DBConnection;
import model.Customer;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class LoginServlet extends HttpServlet{

protected void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException{

String email=request.getParameter("email");
String password=request.getParameter("password");
String role=request.getParameter("role");

try{
Connection con=DBConnection.getConnection();

if(role.equals("admin")){

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM admin WHERE email=? AND password=?");
ps.setString(1,email);
ps.setString(2,password);

ResultSet rs=ps.executeQuery();

if(rs.next()){
HttpSession session=request.getSession();
session.setAttribute("admin",email);
response.sendRedirect("adminHome.jsp");
}else{
request.setAttribute("error","Invalid Admin");
request.getRequestDispatcher("Login.jsp").forward(request,response);
}

}else{

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM customer WHERE email=? AND password=?");
ps.setString(1,email);
ps.setString(2,password);

ResultSet rs=ps.executeQuery();

if(rs.next()){

Customer c=new Customer();
c.setId(rs.getInt("id"));
c.setName(rs.getString("name"));
c.setEmail(rs.getString("email"));
c.setMemberLevel(rs.getString("memberLevel"));

HttpSession session=request.getSession();
session.setAttribute("customer",c);

response.sendRedirect("customerHome.jsp");

}else{
request.setAttribute("error","Invalid Customer");
request.getRequestDispatcher("Login.jsp").forward(request,response);
}
}

}catch(Exception e){
e.printStackTrace();
}
}
}