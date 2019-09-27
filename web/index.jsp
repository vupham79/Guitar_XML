<%-- 
    Document   : index
    Created on : Sep 27, 2019, 5:58:53 PM
    Author     : VuPH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Guitar - So sánh giá</title>
        <%@include file="header.jsp"%>
    </head>
    <body>
        <div class="container">
            <c:if test="${empty sessionScope.USERNAME}">
                <c:redirect url="login.html"/>
            </c:if>
            <h3 style="color: red">Welcome, ${sessionScope.USERNAME}</h3>
            <form action="ProcessServlet" class="form-inline">
                <input type="search" name="txtSearch" placeholder="Model..." class="form-control"/>
                <input name="action" value="Search" type="submit" class="btn btn-primary"/>
            </form>
            <c:set value="${requestScope.RESULT}" var="guitars"/>
            <c:if test="${guitars != null}">
                <c:if test="${not empty guitars}" var="result">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Store</th>
                                <th>Link</th>        
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${guitars}" var="guitar" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${guitar.name}</td>
                                    <td>${guitar.price}</td>
                                    <td>${guitar.store}</td>
                                    <td><a href="${guitar.url}" target="blank">BUY</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${not result}">
                    No result found!
                </c:if>
            </c:if>
        </div>
    </body>
</html>
