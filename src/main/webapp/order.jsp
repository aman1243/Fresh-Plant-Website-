<%-- 
    Document   : order
    Created on : 17 Mar, 2022, 2:14:48 PM
    Author     : lenovo
--%>
<%
    User user =(User) session.getAttribute("current-user");
    
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/include/head.jsp"%> 
    </head>
    <body>
        <%@include file="/include/navbar.jsp"%>
        <div class="container">
        <form>
            <div class="form-group">
            <label>Name:</label>
            <input name="text"  value="<%=user.getUserName()%>" type="text" class="form-control">
            </div>
            
        </form>
    </div>
        <%@include file="/include/footter.jsp"%> 
    </body>
</html>
