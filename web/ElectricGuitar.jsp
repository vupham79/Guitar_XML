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
    <body>
        <div class="container-fluid primary">
            <c:if test="${sessionScope.USER.isIsAdmin()}">
                <c:redirect url="admin.jsp"/>
            </c:if>
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
                               <c:if var="login" test="${sessionScope.USER != null}">
                                    <c:if var="notDidQuiz" test="${sessionScope.USER.getCateIdOfFavor() == null 
                                                                   || sessionScope.USER.getCateIdOfFavor() == 0}">
                                          <form action="ProcessServlet" class="form-inline">
                                              <input class="btn btn-primary mr-sm-2" name="action" type="submit" value="Làm Quiz">
                                          </form>
                                    </c:if>
                                </c:if>
                                <c:if test="${not login}">
                                    <form action="ProcessServlet" class="form-inline">
                                        <input class="btn btn-primary mr-sm-2" name="action" type="submit" value="Làm Quiz">
                                    </form>
                                    <form action="ProcessServlet" class="form-inline">
                                        <input name="action" value="Log In" type="submit" class="btn btn-success"/>
                                    </form>
                                </c:if>
                                <c:if test="${login}">
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
                                                <li><a href="organ.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i> ĐÀN ORGAN </a>
                                                </li>
                                                <li><a href="piano.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i> ĐÀN PIANO </a>
                                                </li>
                                                <li><a href="ClassicGuitar.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i> ĐÀN CLASSIC GUITAR </a>
                                                </li>
                                                <li class="bgwhite"><a href="ElectricGuitar.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i> ĐÀN GUITAR ĐIỆN</a>
                                                </li>
                                                <li><a href="drum.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i> TRỐNG </a>
                                                </li>
                                                <li><a href="flute.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i> SÁO </a>
                                                </li>
                                                <li><a href="harmonica.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i> HARMONICA </a>
                                                </li>
                                                <li><a href="cajon.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i> CAJON </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <c:if var="xml" test="${not empty applicationScope.XML}">
                                    <c:import var="xslt" url="WEB-INF/xsl/electric_guitar_jsp.xsl" charEncoding="utf-8"/>
                                    <x:transform doc="${applicationScope.XML}" xslt="${xslt}"/>
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
    </body>
    <%@include file="footer.jsp" %>
</html>
