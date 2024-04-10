<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Greet Me - Greeting Page</title>
</head>
<body>
    <h1>Greeting Page</h1>
    
    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String name = request.getParameter("name");
            if (name != null && !name.isEmpty()) {
                out.println("<h2>Hello, " + name + "!</h2>");
            } else {
                out.println("<h2>Please enter your name in the <a href=\"index.jsp\">form</a>.</h2>");
            }
        } else {
            out.println("<h2>Please submit the form to see the greeting.</h2>");
        }
    %>
</body>
</html>
