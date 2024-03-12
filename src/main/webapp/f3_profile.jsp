<%-- 
    Document   : f2_profile
    Created on : Oct 31, 2023, 12:23:11 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <style>
            .body{
                background-color: #F0F0F0;
            }

            .all{
                margin-top: 50px;
                font-family: sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: justify;
            }
            .container{
                width: 70%;
                background-color: white;
                padding: 15px 40px;
                box-sizing: border-box;
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.account == null}">
            <div>
                <jsp:include page="menu_nologin.jsp"/>
            </div>
        </c:if>

        <c:if test="${sessionScope.account != null}">
            <div>
                <jsp:include page="menu_logined.jsp"/>
            </div>
        </c:if>
        
        <div class="all">
            <div class="container">
            
            </div>
        </div>
    </body>
</html>
