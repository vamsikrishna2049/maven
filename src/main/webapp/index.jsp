<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My JSP Page</title>
</head>
<body>
    <h1>Welcome to my JSP Page!</h1>
    <p>Simple example of a JSP page.</p>
    <%-- Java code can go here --%>
    <% 
        String message = "Hello, world!";
        out.println("<p>" + message + "</p>");
    %>
</body>
</html>
