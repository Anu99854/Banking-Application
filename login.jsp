<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Admin Login</h2>
    <form action="AdminLoginServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>