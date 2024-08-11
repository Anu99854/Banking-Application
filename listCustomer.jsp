<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Customers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Customer List</h2>
    <table>
        <tr>
            <th>Customer ID</th>
            <th>Full Name</th>
            <th>Address</th>
            <th>Mobile No</th>
            <th>Email ID</th>
            <th>Account Type</th>
            <th>Initial Balance</th>
            <th>Date of Birth</th>
            <th>Account No</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem", "root", "Kaviya");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM customer");
                
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("customer_id") %></td>
                        <td><%= rs.getString("full_name") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td><%= rs.getString("mobile_no") %></td>
                        <td><%= rs.getString("email_id") %></td>
                        <td><%= rs.getString("account_type") %></td>
                        <td><%= rs.getDouble("initial_balance") %></td>
                        <td><%= rs.getDate("dob") %></td>
                        <td><%= rs.getString("account_no") %></td>
                    </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <a href="adminDashboard.jsp" class="back-link">Back to Dashboard</a>
</body>
</html>