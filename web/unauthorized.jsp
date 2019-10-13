<%-- 
    Document   : unauthorized
    Created on : Oct 13, 2019, 12:30:07 PM
    Author     : VuPH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Nhạc Cụ Của Tui</title>
        <%@include file="header.jsp"%>
        <link type="text/css" rel="stylesheet" href="css/stylesheet.css">
    </head>
    <body>
        <div class="container-fluid primary">
            <div class="container">
                <div class="row">
                    <nav class="navbar navbar-expand-md navbar-light fullwidth d-flex justify-content-between">
                        <div class="hidden-sm hidden-xs">
                            <a class="navbar-brand" href="">
                                <img src="img/logo.png" width="70" height="70" class="d-inline-block align-top" alt=""/>
                            </a>
                        </div>
                        <div class="hidden-sm hidden-xs">
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <form action="ProcessServlet" class="form-inline my-2 my-lg-0">
                                    <input class="form-control mr-sm-2" type="text" name="txtSearch" placeholder="Tìm kiếm..." aria-label="Search"/>
                                    <input type="submit" name="action" value="Search" class="form-control mr-sm-2"/>
                                </form>
                                <c:if test="${didQuiz || not login}">
                                    <form action="ProcessServlet" class="form-inline">
                                        <input class="btn btn-primary mr-sm-2" name="action" type="submit" value="Làm Quiz">
                                    </form>
                                </c:if>
                                <c:if var="isLogin" test="${empty sessionScope.USER}">
                                    <form action="ProcessServlet" class="form-inline">
                                        <input name="action" value="Log In" type="submit" class="btn btn-success"/>
                                    </form>
                                </c:if>
                                <c:if test="${!isLogin}">
                                    <form action="ProcessServlet" class="form-inline">
                                        <input name="action" value="Log out" type="submit" class="btn btn-danger"/>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="cont">
                </div>
            </div>
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
