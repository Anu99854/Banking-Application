<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WELCOME </title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff;
        text-align: center;
        padding: 50px;
    }
    h2 {
        color: #333;
        font-size: 2.5em;
        margin-bottom: 20px;
    }
    div {
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        display: inline-block;
        padding: 20px;
        margin-top: 30px;
    }
    a {
        display: inline-block;
        text-decoration: none;
        color: white;
        background-color: #007bff;
        padding: 10px 20px;
        border-radius: 5px;
        margin: 10px 0;
        transition: background-color 0.3s ease;
    }
    a:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<h2>Welcome to BankingSystem</h2>
<div>
    <a href="login.jsp" target="_blank" style="background-color: #28a745;">Admin Page</a><br>
    <a href="customerLogin.jsp" target="_blank" style="background-color: #dc3545;">Customer Page</a>
</div>
</body>
</html>