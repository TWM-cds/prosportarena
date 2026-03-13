package controller;

import util.DBConnection;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        ArrayList<String[]> list = new ArrayList<>();

        try{

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM product WHERE product_name LIKE ?";

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, "%" + keyword + "%");

            ResultSet rs = stmt.executeQuery();

            while(rs.next()){

                String[] row = new String[4];

                row[0] = rs.getString("product_name");
                row[1] = rs.getString("price");
                row[2] = rs.getString("product_id");
                row[3] = rs.getString("image");

                list.add(row);
            }

            String[][] results = new String[list.size()][4];

            for(int i=0;i<list.size();i++){
                results[i] = list.get(i);
            }

            request.setAttribute("results", results);

        }
        catch(Exception e){
            e.printStackTrace();
        }

        request.setAttribute("keyword", keyword);

        RequestDispatcher rd = request.getRequestDispatcher("searchResult.jsp");
        rd.forward(request,response);
    }
}