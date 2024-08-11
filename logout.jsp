<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  <head>
 <meta charset="UTF-8">
    <title>Session Invalidated</title>
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
        p {
            font-size: 1.2em;
            margin-top: 20px;
        }
        a {
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Session Invalidated</h2>
    <p>Your session has been successfully invalidated.</p>
    <p><a href="login.jsp">Click here to login again</a></p>
</body>
</html>