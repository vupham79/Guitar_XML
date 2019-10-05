<%-- 
    Document   : crawl_success
    Created on : Oct 2, 2019, 2:52:54 PM
    Author     : VuPH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Nhạc Cụ Thích Hợp</title>
        <%@include file="header.jsp"%>
    </head>
    <body>
        <div class="container">
            <h3>Congrats, ${sessionScope.USERNAME}!</h3>
            <h5>Crawling finished!</h5>
        </div>
    </body>
</html>