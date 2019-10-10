<%-- 
    Document   : admin
    Created on : Oct 3, 2019, 4:18:46 PM
    Author     : VuPH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhạc Cụ Của Tui | Admin</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <c:if test="${empty sessionScope.USER}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <c:if test="${not sessionScope.USER.isIsAdmin()}">
            <c:redirect url="index.jsp"/>
        </c:if>
        <div class="container-fluid admin-container">
            <div class="forms-wrapper">
                <h1 class="alert alert-light">Welcome ${sessionScope.USER.getFullname()}</h1>
                <div style="text-align: center"><h6 class="text-success" style="text-align: center">${requestScope.SUCCESS}</h6></div>
                <div style="text-align: center"><h6 class="text-danger" style="text-align: center">${requestScope.ERROR}</h6></div>
                <div id="spinner" style="text-align: center" class="noDisplay"><p class="spinner-border"></p></div>
                <form action="ProcessServlet" class="form-control-lg btn-block">
                    <input id="btnCrawl" onclick="btnCrawlClick()" type="submit" name="action" value="Crawl" class="btn btn-outline-light btn-block"/>
                </form>
                <form action="ProcessServlet" class="form-control-lg">
                    <input id="btnLogout" type="submit" name="action" value="Log out" class="btn btn-danger btn-block"/>
                </form>
            </div>
        </div>
    </body>
    <script>
        function btnCrawlClick() {
            let element = document.getElementById("btnCrawl");
            element.setAttribute("disabled", true);
            element = document.getElementById("btnLogout");
            element.setAttribute("disabled", true);
            element = document.getElementById("spinner");
            element.classList.remove("noDisplay");
            window.location.href = '/XML_SE63200/CrawlServlet';
        }
    </script>
</html>
