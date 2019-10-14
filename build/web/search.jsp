<%-- 
    Document   : search
    Created on : Oct 13, 2019, 9:06:36 PM
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
                                <input id="txtSearch" type="text" name="search" value="${param.txtSearch}" placeholder="Từ khóa" id="input-search" class="input_search form-control">
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
            <div class="row">
                <div class="cont">
                    <div class="col-lg-12">
                        <c:if var="xml" test="${not empty applicationScope.XML}">
                            <c:import var="xslt" url="WEB-INF/xsl/search_jsp.xsl" charEncoding="utf-8"/>
                            <x:transform doc="${applicationScope.XML}" xslt="${xslt}">
                                <x:param name="search" value="${param.txtSearch}"/>
                            </x:transform>
                        </c:if>
                        <c:if test="${not xml}">
                            <div class="cont_html_top">
                                <div class="tit_html_top">Không có sản phẩm phù hợp</div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 conbottom1">
        </div>
    </body>
    <%@include file="footer.jsp" %>
    <script>
        function onSearch() {
            var txtSearch = document.getElementById('txtSearch').value;
            location.href = 'search.jsp?txtSearch=' + txtSearch;
        }
    </script>
</html>
