
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xét duyệt</title>
        <link rel="stylesheet" href="job.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
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

            .small_list {
                width: 75%;
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
                width: 120px;
                height: 120px;
                display: flex;
                align-items: flex-start;
            }

            .infor_left img {
                width: 120px;
                height: 120px;
                border: 1px solid none;
                border-radius: 4px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
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

            .infor_right {
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                gap: 20px;
            }

            .infor_right input {
                width: 80%;
                height: 40px;
                color: white;
                border: none;
                border-radius: 4px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
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
                    <div class="small_list">
                        <div class="list-title" style="font-size: 50px; margin-left: 250px;">Ứng viên</div>
                        <c:forEach items="${hisList}" var="his">
                            <c:if test="${his.idJob == idJob && his.handle == 'stop'}">
                                <c:forEach items="${userList}" var="user">
                                    <c:if test="${user.idUser == his.idUser}">
                                        <form action="handledetail" class="form_list" method="post">
                                            <div class="infor">
                                                <div class="infor_left">
                                                    <img src="${user.image}"
                                                         alt="">
                                                </div>
                                                <div class="infor_center">
                                                    <p>${his.name}</p>
                                                    <p>${his.email}</p>
                                                    <p>${his.phone}</p>
                                                    <a href="${his.link}" style="text-decoration: none; color: blue"> Link CV (click vào để mở)</a>
                                                </div>
                                                <div class="infor_right">
                                                    <input type="hidden" name="idJob" value="${his.idJob}" style="background-color: red;">
                                                    <input type="hidden" name="idHis" value="${his.idHistory}" style="background-color: red;">
                                                    <input type="submit" name="accept" value="ACCEPT" style="background-color: green;" class="cursor-pointer">
                                                    <input type="submit" name="reject" value="REJECT" style="background-color: red;" class="cursor-pointer">
                                                </div>
                                            </div>
                                        </form>
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