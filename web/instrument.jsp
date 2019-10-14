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
            <div class="row">
                <div class="cont">
                    <div class="cus-col-left">
                        <div class="row">
                            <div class="col-lg-3 col-cat">
                                <div class="column_right">
                                    <div class="box">
                                        <div class="box-heading">DANH MỤC</div>
                                        <div class="box-content">
                                            <ul class="box-category">
                                                <li id="Organ"><a href="instrument.jsp?category=Organ"><i class="fa fa-angle-right" aria-hidden="true"></i> ĐÀN ORGAN </a>
                                                </li>
                                                <li id="Piano"><a href="instrument.jsp?category=Piano"><i class="fa fa-angle-right" aria-hidden="true"></i> ĐÀN PIANO </a>
                                                </li>
                                                <li id="ClassicGuitar"><a href="instrument.jsp?category=Classic Guitar"><i class="fa fa-angle-right" aria-hidden="true"></i> ĐÀN CLASSIC GUITAR </a>
                                                </li>
                                                <li id="ElectricGuitar"><a href="instrument.jsp?category=Electric Guitar"><i class="fa fa-angle-right" aria-hidden="true"></i> ĐÀN GUITAR ĐIỆN</a>
                                                </li>
                                                <li id="Drum"><a href="instrument.jsp?category=Drum"><i class="fa fa-angle-right" aria-hidden="true"></i> TRỐNG </a>
                                                </li>
                                                <li id="Flute"><a href="instrument.jsp?category=Flute"><i class="fa fa-angle-right" aria-hidden="true"></i> SÁO </a>
                                                </li>
                                                <li id="Harmonica"><a href="instrument.jsp?category=Harmonica"><i class="fa fa-angle-right" aria-hidden="true"></i> HARMONICA </a>
                                                </li>
                                                <li id="Cajon"><a href="instrument.jsp?category=Cajon"><i class="fa fa-angle-right" aria-hidden="true"></i> CAJON </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <c:set var="category" value="${param.category}"/>
                                <c:if var="page0" test="${param.page == null}">
                                    <c:set var="currentPage" value="1"/>
                                </c:if>
                                <c:if test="${not page0}">
                                    <c:set var="currentPage" value="${param.page}"/>
                                </c:if>
                                <c:if var="xml" test="${not empty applicationScope.XML}">
                                    <c:import var="xslt" url="WEB-INF/xsl/instrument_jsp.xsl" charEncoding="utf-8"/>
                                    <x:transform doc="${applicationScope.XML}" xslt="${xslt}">
                                        <x:param name="category" value="${category}"/>
                                        <x:param name="page" value="${currentPage}"/>
                                    </x:transform>
                                    <div class="container pagination">
                                        <nav aria-label="...">
                                            <ul class="pagination justify-content-center">
                                                <c:set var="totalPage" value="${Math.ceil(applicationScope.TOTALS.get(param.category)/9)}"/>

                                                <c:if var="lt10" test="${totalPage <= 10}">
                                                    <c:set var="start" value="1"/>
                                                    <c:set var="end" value="${totalPage}"/>
                                                </c:if>
                                                <c:if test="${not lt10}">
                                                    <c:set var="start" value="${Math.max(1*1.0, ((currentPage * 1.0) - 4))}"/>
                                                    <c:set var="end" value="${Math.min(totalPage, ((currentPage*1.0) + 5))}"/>
                                                </c:if>
                                                <c:forEach 
                                                    var="i" begin="${start}" 
                                                    step="1" 
                                                    end="${end}">
                                                    <c:if var="active" test="${currentPage == i}">
                                                        <li class="page-item active"><a class="page-link" href="instrument.jsp?category=${param.category}&page=${i}">${i}</a></li>
                                                        </c:if>
                                                        <c:if test="${not active}">
                                                        <li class="page-item"><a class="page-link" href="instrument.jsp?category=${param.category}&page=${i}">${i}</a></li>
                                                        </c:if>
                                                    </c:forEach>
                                            </ul>
                                        </nav>
                                    </div>
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
        var category = location.search.split('category=')[1].replace("%20", "");
        var element = document.getElementById(category);
        element.classList.add("bg-white");
    </script>
</html>
