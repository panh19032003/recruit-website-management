<%-- 
    Document   : f2_jobsave
    Created on : Nov 7, 2023, 12:53:01 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="cookie.css">
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>
        <style>
            .container_love {
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .all_love {
                border: 1px solid none;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                border-radius: 10px;
                padding: 15px 20px;
                width: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                gap: 15px;
                font-family: sans-serif;
                padding-bottom: 30px;
            }

            .all_love .title {
                margin: 0px;
                width: 100%;
                font-family: 'Baloo';
                letter-spacing: 1px;
                text-align: center;
            }

            .all_love .love {
                display: flex;
                justify-content: left;
                align-items: flex-start;
                gap: 20px;
                border-top: 1px dotted rgb(117, 80, 80);
                padding-top: 15px;
                align-items: stretch;
            }

            .love_logo {
                flex: 1;
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: stretch;
            }

            .love_logo img {
                width: 100%;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
                border-radius: 8px;
            }

            .love_content {
                flex: 6;
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                flex-direction: column;
                gap: 10px;
            }

            .love_content_title {
                color: black;
                text-decoration: none;
                display: flex;
                justify-content: left;
                align-items: flex-start;
                flex-direction: column;
                gap: 5px;
            }

            .love_content_title p:first-child {
                font-size: 21px;
                font-weight: bold;
            }

            .love_content_title p:last-child {
                font-size: 13px;
            }

            .love_content_info {
                display: flex;
                justify-content: left;
                align-items: center;
                gap: 5px;
            }

            .love_content_info p {
                border: 1px solid none;
                background-color: #F4F5F5;
                color: rgb(73, 69, 69);
                padding: 5px 8px;
                font-size: 13px;
                border-radius: 3px;
            }

            .love_content p {
                margin: 0px;
            }

            .love_delete {
                width: 100%;
                flex: 1;
                display: flex;
                justify-content: right;
                align-items: center;
                min-height: 78px;
            }

            .love_delete a {
                width: 15%;
                display: flex;
                justify-content: right;
                align-items: center;
            }

            .love_delete img {
                width: 100%;
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.account != null}">
            <div>
                <jsp:include page="menu_logined.jsp"/>
            </div>
        </c:if>

        <br><br><br><br><br><br>
        <div class="container_love">
            <div class="all_love">
                <h1 class="title">Việc làm đã lưu</h1>

                <c:forEach items="${loveList}" var="love">
                    <c:if test="${love.idUser == sessionScope.account.idUser && love.status == 'on'}">
                        <c:forEach items="${jobList}" var="job">
                            <c:if test="${love.idJob == job.idJob}">
                                <c:forEach items="${emList}" var="em">
                                    <c:if test="${em.idEmployer == job.idEmployer}">
                                        <c:forEach items="${userList}" var="user">
                                            <c:if test="${user.email == em.emailEmployer}">
                                                <div class="love">
                                                    <div class="love_logo">
                                                        <img src="${user.logo}"
                                                             alt="">
                                                    </div>

                                                    <div class="love_content">
                                                        <a href="findjobdetail?idJob=${job.idJob}" class="love_content_title">
                                                            <p>${job.nameJob}</p>
                                                            <p>${user.name}</p>
                                                        </a>

                                                        <div class="love_content_info">
                                                            <p>${job.salary}</p>
                                                            <p>${job.address}</p>
                                                        </div>
                                                    </div>

                                                    <div class="love_delete">
                                                        <a href="deletelovejob?page=findjob&option=savejob&status=no_heart&idJob=${job.idJob}&idUser=${sessionScope.account.idUser}">
                                                            <img src="image/cross.png" alt="">
                                                        </a>
                                                    </div>
                                                </div>

                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </c:forEach>

            </div>
        </div>
        
        <div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>

</html>