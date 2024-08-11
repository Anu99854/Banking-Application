<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>viewCustomers</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Welcome, Customer</h2>
    <div class="dashboard-info">
    <%
        String accountNo = (String) session.getAttribute("account_no");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem", "root", "Kaviya");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE account_no=?");
        ps.setString(1, accountNo);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            out.print("Account No: " + rs.getString("account_no") + "<br>");
            out.print("Balance: " + rs.getDouble("initial_balance") + "<br>");
        }
    %>
    </div>
    <div class="nav-links">
    <a href="viewTransactions.jsp">View Transactions</a> |
    <a href="deposit.jsp">Deposit</a> |
    <a href="withdraw.jsp">Withdraw</a> |
    <a href="closeAccount.jsp">Close Account</a> |
    <a href="logout.jsp">Logout</a>
    </div>
</body>
</html>
