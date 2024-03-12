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
        <title>Xét duyệt</title>
        <link rel="stylesheet" href="job.css">
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>
        <style>
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .postlist {
                width: 100%;
                display: flex;
                justify-content: left;
                align-items: stretch;
                gap: 50px;
                font-family: sans-serif;
            }

            .m-left {
                flex: 1;
                width: 100%;
                display: flex;
                width: 700px;
                flex-direction: column;
                justify-content: center;
                align-items: flex-start;
                background-color: rgb(233, 228, 228);
                font-family: sans-serif;
                gap: 30px;
                font-size: 30px;
            }

            .m-left div {
                margin-left: 30px;
            }

            .m-left a {
                color: black;
                text-decoration: none;
            }

            .all-list {
                flex: 3;
                display: flex;
                justify-content: left;
                align-items: first;
                flex-direction: column;
                font-family: sans-serif;

            }

            .infor {
                display: flex;
                gap: 20px;
                justify-content: left;
                align-items: stretch;
                margin: 30px 0px;
            }

            .infor_left {
                flex: 1;
                display: flex;
                align-items: flex-start;
            }

            .infor_left img {
                width: 100%;
                height: 130px;
                border: 1px solid none;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            }

            .infor_center {
                flex: 4;
                font-size: 18px;
                display: flex;
                flex-direction: column;
                align-items: first baseline;
                gap: 10px;
            }

            .infor_center p {
                margin: 0px;
            }

            .infor_center p:first-child {
                font-size: 25px;
                font-weight: bold;
            }
            .all_love {
                padding: 15px 20px;
                width: 70%;
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
                color: green;
                letter-spacing: 1px;
                text-align: center;
            }

            .all_love .love {
                width: 100%;
                display: flex;
                justify-content: left;
                align-items: flex-start;
                gap: 50px;
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
                flex: 4;
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
                flex: 2;
                display: flex;
                justify-content: right;
                align-items: center;
            }

            .love_delete a {
                width: 100%;
                display: flex;
                justify-content: right;
                align-items: center;
                text-decoration: none;
                color: black;
                text-align: center;
            }
            .love_delete a:hover {
                color: red;

            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.account != null}">
            <div>
                <jsp:include page="menu_logined.jsp"/>
            </div>
        </c:if>

        <br><br><br><br>
        <div class="container">
            <div class="postlist">
                <div class="m-left">
                    <div class="m-title">TUYỂN DỤNG</div>
                    <div class="m-ele">
                        <a href="createjob">Đăng tin</a>
                    </div>
                    <div class="m-ele">
                        <a href="handle">Xét duyệt</a>
                    </div>
                    <div class="m-ele">
                        <a href="statistic">Thống kê</a>
                    </div>
                </div>

                <div class="all-list">
                    <div class="all_love p-4">
                        <h1 class="title">Việc làm đã đăng</h1>


                        <c:forEach items="${emList}" var="em">
                            <c:if test="${sessionScope.account.email ==  em.emailEmployer}">
                                <c:forEach items="${jobList}" var="job">
                                    <c:if test="${job.idEmployer ==  em.idEmployer}">
                                        <div class="love">
                                            <div class="love_logo">
                                                <img src="${sessionScope.account.logo}"
                                                     alt="">
                                            </div>

                                            <div class="love_content">
                                                <a href="findjobdetail?idJob=${job.idJob}" class="love_content_title">
                                                    <p>${job.nameJob}</p>
                                                    <p>${sessionScope.account.name}</p>
                                                </a>

                                                <div class="love_content_info">
                                                    <p>${job.salary}</p>
                                                    <p>${job.address}</p>
                                                </div>
                                            </div>
                                            <div class="love_delete">
                                                <a href="handledetail?idJob=${job.idJob}">Chi tiết người ứng tuyển</a>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
        
        <div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>

</html>