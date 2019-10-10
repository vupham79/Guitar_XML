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
        <title>Nhạc Cụ Của Tui</title>
        <%@include file="header.jsp"%>
    </head>
    <body>
        <div class="container">
            <c:if test="${sessionScope.USER.isIsAdmin()}">
                <c:redirect url="admin.jsp"/>
            </c:if>
            <nav class="navbar navbar-expand-lg navbar-light bg-warning">
                <a class="navbar-brand" href="">
                    <img src="img/logo.png" width="70" height="70" class="d-inline-block align-top" alt="">
                </a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Piano</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Guitar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Sáo</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Trống</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Organ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Harmonica</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Trống</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm..." aria-label="Search">
                    </form>
                    <form action="ProcessServlet" class="form-inline">
                        <input class="btn btn-outline-dark mr-sm-2" name="action" type="submit" value="Làm Quiz">
                    </form>
                    <c:if var="isLogin" test="${empty sessionScope.USER}">
                        <form action="ProcessServlet" class="form-inline">
                            <input name="action" value="Log In" type="submit" class="btn btn-outline-info"/>
                        </form>
                    </c:if>
                    <c:if test="${!isLogin}">
                        <form action="ProcessServlet" class="form-inline">
                            <input name="action" value="Log out" type="submit" class="btn text-danger"/>
                        </form>
                    </c:if>
                </div>
            </nav>
        </div>
    </body>
</html>
