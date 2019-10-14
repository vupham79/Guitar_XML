<%-- 
    Document   : quiz
    Created on : Oct 3, 2019, 9:24:18 PM
    Author     : VuPH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <c:if test="${empty sessionScope.USER}">
                <c:redirect url="login.jsp"/>
            </c:if>
            <c:if test="${sessionScope.USER.isIsAdmin()}">
                <c:redirect url="admin.jsp"/>
            </c:if>
            <c:if test="${sessionScope.USER.getCateIdOfFavor() != null && sessionScope.USER.getCateIdOfFavor() != 0}">
                <c:redirect url="index.jsp"/>
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
                    <div class="container-fluid question1" id="question1">
                        <div class="question-container">
                            <div class="row">
                                <h1 class="alert-dark">Câu 1: Bạn thích nhạc cụ cổ điển hay hiện đại?</h1>
                            </div>
                            <div class="row container">
                                <div class="col">
                                    <a id="1" href="#question2" class="btn btn-block btn-outline-light btn-lg rounded-pill cursorPointer" onclick="question12(1)">Cổ điển</a>
                                </div>
                                <div class="col">
                                    <a id="2" href="#question2" class="btn btn-block btn-outline-light btn-lg rounded-pill cursorPointer" onclick="question12(2)">Hiện đại</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid question2" id="question2">
                        <div class="question-container">
                            <div class="row">
                                <h1 class="alert-dark">Câu 2: Nhạc cụ bạn thích thuộc bộ gì?</h1>
                            </div>
                            <div class="row container">
                                <div class="col">
                                    <a id="3" href="#question3" class="btn btn-block btn-light btn-lg rounded-pill cursorPointer" onclick="question36(3)">Dây</a>
                                    <a id="4" href="#question3" class="btn btn-block btn-light btn-lg rounded-pill cursorPointer" onclick="question36(4)">Phím</a>
                                </div>
                                <div class="col">
                                    <a id="5" href="#question3" class="btn btn-block btn-light btn-lg rounded-pill cursorPointer" onclick="question36(5)">Hơi</a>
                                    <a id="6" href="#question3" class="btn btn-block btn-light btn-lg rounded-pill cursorPointer" onclick="question36(6)">Gõ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid question3" id="question3">
                        <div class="question-container">
                            <div class="row">
                                <h1 class="alert-dark">Câu 3: Bạn ưa thích sự sôi động hay nhẹ nhàng?</h1>
                            </div>
                            <div class="row container">
                                <div class="col">
                                    <a id="7" href="#question4" class="btn btn-block btn-light btn-lg rounded-pill cursorPointer" onclick="question78(7)">Sôi động</a>
                                </div>
                                <div class="col">
                                    <a id="8" href="#question4" class="btn btn-block btn-light btn-lg rounded-pill cursorPointer" onclick="question78(8)">Nhẹ nhàng</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid question4" id="question4">
                        <div class="question-container">
                            <div class="row">
                                <h1 class="alert-dark">Câu hỏi cuối nè: Bạn chơi nhạc để làm gì?</h1>
                            </div>
                            <div class="row container">
                                <div class="col">
                                    <a id="9" href="#result" class="btn btn-block btn-light btn-lg rounded-pill cursorPointer" onclick="questionLast(9)">Giải toả căng thẳng</a>
                                    <a id="10" href="#result" class="btn btn-block btn-light btn-lg rounded-pill cursorPointer" onclick="questionLast(10)">Chơi những lúc rảnh rỗi</a>
                                </div>
                                <div class="col">
                                    <a id="11" href="#result" class="btn btn-block btn-light btn-lg rounded-pill cursorPointer" onclick="questionLast(11)">Vì đam mê</a>
                                    <a id="12" href="#result" class="btn btn-block btn-light btn-lg rounded-pill cursorPointer" onclick="questionLast(12)">Tìm hiểu</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid result" id="result">
                        <div class="question-container align-items-center">
                            <button class="btn btn-outline-light btn-lg rounded-pill cursorPointer" onclick="seeResult()">
                                Xem kết quả nào
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%@include file="footer.jsp" %>
    <script>
        let question1 = false;
        let question2 = false;
        let question3 = false;
        let question4 = false;

        function question12(e) {
            if (!question1) {
                for (let i = 1; i <= 2; i++) {
                    let element = document.getElementById(i);
                    if (i === e) {
                        question1 = i;
                        element.classList.remove("btn-outline-light");
                        element.classList.add("answer");
                    } else {
                        element.classList.add("disabled");
                    }
                }
            }
        }
        function question36(e) {
            if (!question2) {
                for (let i = 3; i <= 6; i++) {
                    let element = document.getElementById(i);
                    if (i === e) {
                        question2 = i;
                        element.classList.remove("btn-light");
                        element.classList.add("answer");
                    } else {
                        element.classList.add("disabled");
                    }
                }
            }
        }
        function question78(e) {
            if (!question3) {
                for (let i = 7; i <= 8; i++) {
                    let element = document.getElementById(i);
                    if (i === e) {
                        question3 = i;
                        element.classList.remove("btn-light");
                        element.classList.add("answer");
                    } else {
                        element.classList.add("disabled");
                    }
                }
            }
        }
        function questionLast(e) {
            if (!question4) {
                for (let i = 9; i <= 12; i++) {
                    let element = document.getElementById(i);
                    if (i === e) {
                        question4 = i;
                        element.classList.remove("btn-light");
                        element.classList.add("answer");
                    } else {
                        element.classList.add("disabled");
                    }
                }
            }
        }
        function seeResult() {
            if (question1 && question2 && question3 && question4) {
                document.location.href = "ProcessServlet?action=quiz&answer=" + question1
                        + " " + question2
                        + " " + question3
                        + " " + question4;
            } else {
                if (!question1) {
                    location.href = "#question1";
                } else
                if (!question2) {
                    location.href = "#question2";
                } else
                if (!question3) {
                    location.href = "#question3";
                } else
                if (!question4) {
                    location.href = "#question4";
                }
            }
        }
    </script>
</html>
