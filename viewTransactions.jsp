<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Transactions</title>
       </head>
<body>
    <h2>Last 10 Transactions</h2>
    <%
        String accountNo = (String) session.getAttribute("account_no");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem", "root", "Kaviya");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM transactions WHERE customer_id=(SELECT customer_id FROM customer WHERE account_no=?) ORDER BY transaction_date DESC LIMIT 10");
        ps.setString(1, accountNo);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
    %>
        <div class="transaction">
            <p><strong>Date:</strong> <%= rs.getTimestamp("transaction_date") %></p>
            <p><strong>Amount:</strong> <%= rs.getDouble("amount") %></p>
            <p><strong>Type:</strong> <%= rs.getString("type") %></p>
        </div>
    <%
        }
    %>
    <a href="viewCustomers.jsp" class="back-link">Back to Dashboard</a>
    <a href="DownloadPDFServlet" class="download-link">Download Transactions as PDF</a>
</body>
</html>
