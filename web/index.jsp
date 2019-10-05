<%-- 
    Document   : index
    Created on : Sep 27, 2019, 5:58:53 PM
    Author     : VuPH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Nhạc Cụ Thích Hợp</title>
        <%@include file="header.jsp"%>
    </head>
    <body>
        <div class="container" style="background-image: url(WEB-INF/asset/baby_grand_piano_playing_music.jpg); background-size: cover">
            <c:if test="${empty sessionScope.USER}">
                <c:redirect url="login.jsp"/>
            </c:if>
            <c:if test="${sessionScope.USER.isIsAdmin()}">
                <c:redirect url="admin.jsp"/>
            </c:if>
            <h3 style="color: red">Welcome, ${sessionScope.USERNAME}</h3>
            <!--            <form action="ProcessServlet" class="form-inline">
                            <input type="search" name="txtSearch" placeholder="Model..." class="form-control-lg"/>
                            <input name="action" value="Search" type="submit" class="btn btn-primary"/>
                        </form>-->
            <form action="ProcessServlet" class="form-inline">
                <input name="action" value="Log out" type="submit" class="btn btn-primary"/>
            </form>
        </div>
    </body>
</html>
