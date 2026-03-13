package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.net.*;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/CreateBillServlet")
public class CreateBillServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String membership = request.getParameter("membership");
        int fee = Integer.parseInt(request.getParameter("fee"));

        // --- If Basic membership, skip payment ---
        if(fee == 0){
            // redirect to RegisterServlet directly
            response.sendRedirect("RegisterServlet?name=" + URLEncoder.encode(name, "UTF-8")
                    + "&email=" + URLEncoder.encode(email, "UTF-8")
                    + "&password=" + URLEncoder.encode(request.getParameter("password"), "UTF-8")
                    + "&membership=" + URLEncoder.encode(membership, "UTF-8"));
            return;
        }

        // --- ToyyibPay credentials ---
        String userSecretKey = "YOUR_SECRET_KEY";
        String categoryCode = "YOUR_CATEGORY_CODE";

        // --- Build POST data ---
        String postData = "userSecretKey=" + URLEncoder.encode(userSecretKey, "UTF-8")
                + "&categoryCode=" + URLEncoder.encode(categoryCode, "UTF-8")
                + "&billName=" + URLEncoder.encode("ProSportArena Membership", "UTF-8")
                + "&billDescription=" + URLEncoder.encode(membership + " Membership Payment", "UTF-8")
                + "&billAmount=" + (fee*100)  // in cents
                + "&billReturnUrl=" + URLEncoder.encode("http://localhost:8080/ProSportArena/paymentSuccess.jsp", "UTF-8")
                + "&billCallbackUrl=" + URLEncoder.encode("http://localhost:8080/ProSportArena/paymentSuccess.jsp", "UTF-8")
                + "&billTo=" + URLEncoder.encode(name, "UTF-8")
                + "&billEmail=" + URLEncoder.encode(email, "UTF-8");

        // --- Call ToyyibPay API ---
        URL url = new URL("https://toyyibpay.com/index.php/api/createBill");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        try(OutputStream os = conn.getOutputStream()){
            os.write(postData.getBytes("UTF-8"));
            os.flush();
        }

        // --- Read response ---
        StringBuilder sb = new StringBuilder();
        try(BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))){
            String line;
            while((line = br.readLine()) != null) sb.append(line);
        }

        // --- Parse JSON Array correctly ---
        JSONArray arr = new JSONArray(sb.toString());
        JSONObject billJson = arr.getJSONObject(0);
        String billCode = billJson.getString("BillCode");

        // --- Redirect to ToyyibPay page ---
        response.sendRedirect("https://toyyibpay.com/" + billCode);
    }
}