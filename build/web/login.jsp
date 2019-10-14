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
        <link type="text/css" rel="stylesheet" href="css/stylesheet.css">
    </head>
    <body class="bgwhite">
        <div class="container-fluid primary">
            <c:if test="${sessionScope.USER.isIsAdmin()}">
                <c:redirect url="admin.jsp"/>
            </c:if>
            <div class="container">
                <div class="row">
                    <nav class="navbar navbar-expand-md navbar-light fullwidth d-flex justify-content-between">
                        <div class="col-lg-2 col-md-2">
                            <a class="navbar-brand" href="index.jsp">
                                <img src="img/logo.png" width="120" height="70" class="d-inline-block align-top" alt=""/>
                            </a>
                        </div>
                        <div class="col-lg-8 col-md-8 hidden-sm hidden-xs">
                            <div id="search" class="input-group">
                                <input id="txtSearch" type="text" name="search" placeholder="Từ khóa" id="input-search" class="input_search form-control">
                                <button onclick="onSearch()" type="button" class="btn_search">Tìm kiếm</button>
                            </div>
                        </div>
                        <div class="hidden-sm hidden-xs">
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <form action="favor.jsp" class="form-inline">
                                    <input class="btn btn-primary mr-sm-2" name="action" type="submit" value="Nhạc Cụ Của Tui"/>
                                </form>
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
            <div class="cont login-container">
                <div class="login-form">
                    <form action="ProcessServlet" method="POST">
                        <label for="username">Username</label>
                        <input name="txtUsername" id="username" type="text" class="form-control form-text"/>
                        <label for="password">Password</label>
                        <input name="txtPassword" id="password" type="password" class="form-control"/>
                        <br/>
                        <div class="tit_html_top">${requestScope.error}</div>
                        <div class="tit_html_top">${requestScope.success}</div>
                        <br/>
                        <input name="action" type="submit" value="Login" class="btn btn-dark btn-block"/>
                        <a class="btn btn-primary btn-block" href="signup.jsp" role="button">Sign Up</a>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-xs-12 conbottom1">
        </div>
    </body>
    <%@include file="footer.jsp" %>
    <c:if test="${not empty sessionScope.USER}">
        <c:redirect url="index.jsp"/>
    </c:if>
    <script>
        function onSearch() {
            var txtSearch = document.getElementById('txtSearch').value;
            location.href = 'search.jsp?txtSearch=' + txtSearch;
        }
        var category = location.search.split('category=')[1].replace("%20", "");
        var element = document.getElementById(category);
        element.classList.add("bg-white");
    </script>
</html>
