<%-- 
    Document   : login
    Created on : Oct 2, 2019, 6:10:38 PM
    Author     : VuPH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhạc Cụ Của Tui</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <c:if test="${not empty sessionScope.USER}">
            <c:redirect url="index.jsp"/>
        </c:if>
        <div class="container-fluid login-container">
            <div class="login-form">
                <form action="ProcessServlet" method="POST">
                    <label for="username">Username</label>
                    <input name="txtUsername" id="username" type="text" class="form-control form-text"/>
                    <br/>
                    <label for="password">Password</label>
                    <input name="txtPassword" id="password" type="password" class="form-control"/>
                    <span>${requestScope.error}</span>
                    <br/>
                    <input name="action" type="submit" value="Login" class="btn btn-dark btn-block"/>
                </form>
            </div>
        </div>
    </body>
</html>
