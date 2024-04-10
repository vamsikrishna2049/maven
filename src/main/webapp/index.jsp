<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Greet Me - JSP Example</title>
</head>
<body>
    <h1>Welcome to Greet Me</h1>
    <p>Please enter your name below:</p>
    
    <form action="greet.jsp" method="post">
        <input type="text" name="name" placeholder="Enter your name">
        <button type="submit">Greet Me!</button>
    </form>
    
    <%-- Java code embedded in JSP --%>
    <%
        // Retrieve the submitted name from the request
        String name = request.getParameter("name");
        
        // Check if the name is not null and not empty
        if (name != null && !name.isEmpty()) {
            out.println("<h2>Hello, " + name + "!</h2>");
        }
    %>
</body>
</html>
