<%-- 
    Document   : f2_findjob_detail
    Created on : Nov 6, 2023, 7:02:46 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Jobs" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${job.nameJob}</title>
        <style>
            body {
                margin: 0px;
                background-color: white;
            }

            .container {
                width: 100%;
                margin: 0px;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: white;

            }

            .all-job {
                width: 70%;
                display: flex;
                justify-content: left;
                align-items: flex-start;
                font-family: sans-serif;
                margin-top: 100px;
            }

            .left,
            .right {
                margin: 0px 10px;
            }

            .left {
                flex: 2;
                display: flex;
                justify-content: left;
                align-items: flex-start;
                flex-direction: column;
                gap: 20px;
            }

            .right {
                flex: 1;
            }

            .left_block1,
            .left_block2,
            .right_block1{
                border: 1px solid none;
                padding: 15px;
                border-radius: 8px;
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            }
            .left_block1{
                width: 611px;
                display: flex;
                flex-direction: column;
                gap: 16px;
            }
            .left_block1-title{
                margin: 0px;
                font-weight: bolder;
                font-size: 25px;
                opacity: 80%;
            }
            .left_block1_infor{
                display: flex;
                justify-content: left;
                align-items: center;
            }
            .lb1_infor_ele{
                display: flex;
                justify-content: left;
                align-items: center;
                flex: 1;
                gap: 13px;
            }
            .lb1_infor_ele-first{
                width: 36px;
                height: 36px;
            }
            .lb1_infor_ele-first img{
                width: 100%;
            }
            .lb1_infor_ele-second{
                margin: auto 0px;
            }
            .lb1_infor_ele-second p:first-child{
                margin: 0px;
                margin-bottom: 5px;
                font-size: 14px;
            }
            .lb1_infor_ele-second p:last-child{
                margin: 0px;
                margin-top: 6px;
                font-size: 14px;
                font-weight: bolder;
            }
            .left_block1_deadline{
                display: flex;
                justify-content: left;
                align-items: center;
                gap: 10px;
                background-color: #f6f8f8;
                width: 36%;
                padding: 5px;
                color: rgb(92, 92, 92);
                border-radius: 5px;
            }
            .left_block1_deadline p{
                font-size: 15px;
                margin: 0px;
            }
            .left_block1_apply{
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 10px;
            }
            .lb1_apply-left{
                flex: 2;
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 15px;
                text-decoration: none;
                color: white;
                background-color: #17b65e;
                border-radius: 5px;
                padding: 6px;
            }
            .lb1_apply-left p{
                margin: 0px;
            }
            .lb1_apply-right{
                flex:1;
                display: flex;
                justify-content: center;
                align-items: center;
                text-decoration: none;
                color: black;
                border: 1px solid #17b65e;
                padding: 5px;
                border-radius: 5px;
            }
            .lb1_apply-right form div{
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 10px;
            }
            .lb1_apply-right form div p{
                margin: 0px;
            }

            .left_block2{
                width: 611px;
            }
            .left_block2 h2{
                margin: 0px;
                margin-bottom: 20px;
            }
            .left_block2 p{
                margin: 8px;
                font-size: 15px;
                color: #41454b;
            }
            .left_block2 h4{
                margin: 5px;
                font-size: 16px;
            }


            .right{
                display: flex;
                flex-direction: column;
                justify-content: left;
                align-items: flex-start;
            }

            .right_block1{
                display: flex;
                align-items: center;
                flex-direction: column;
                font-family: sans-serif;
                gap: 10px;
                width: 100%;
            }
            .right_block1_info{
                width: 100%;
                display: flex;
                justify-content: left;
                align-items: flex-start;
                gap: 16px;
            }
            .right_block1_info div{
                width: 86px;
                height: 77px;
            }
            .right_block1_info div img{
                width: 86px;
                height: 77px;
                border-radius: 8px;
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            }
            .right_block1_info p{
                line-height: 22px;
                font-weight: bold;
                opacity: 0.8;
                margin: 0px;
            }


            .right_block1_more{
                width: 100%;
                display: flex;
                justify-content: left;
                align-items: flex-start;
                gap: 15px;
                font-size: 14px;
            }
            .right_block1_more div{
                display: flex;
                justify-content: left;
                align-items: center;
                gap: 10px;
                color: #7D848C;
                width: 86px;
            }
            .right_block1_more p:last-child{
                flex: 2;
                line-height: 20px;
                margin: 0px;
                text-align: justify;
            }


        </style>
    </head>

    <body>

        <c:if test="${sessionScope.account != null}">
            <div>
                <jsp:include page="menu_logined.jsp"/>
            </div>
        </c:if>

        <%
            Jobs job = (Jobs) request.getAttribute("job");
            String[] jobDescri = job.getDescribes().split("#");
            String[] jobRequi = job.getRequirements().split("#");
            String[] jobBene = job.getBenefits().split("#");
        %>

        <div class="container">
            <div class="all-job">
                <div class="left">
                    <div class="left_block1">
                        <p class="left_block1-title">${job.nameJob}</p>
                        <div class="left_block1_infor">
                            <div class="lb1_infor_ele">
                                <div class="lb1_infor_ele-first">
                                    <img src="image/money.png" alt="">
                                </div>
                                <div class="lb1_infor_ele-second">
                                    <p>Mức lương</p>
                                    <p>${job.salary}</p>
                                </div>
                            </div>
                            <div class="lb1_infor_ele">
                                <div class="lb1_infor_ele-first">
                                    <img src="image/location.png" alt="">
                                </div>
                                <div class="lb1_infor_ele-second">
                                    <p>Địa điểm</p>
                                    <p>${job.address}</p>
                                </div>
                            </div>
                            <div class="lb1_infor_ele">
                                <div class="lb1_infor_ele-first">
                                    <img src="image/customer.png" alt="">
                                </div>
                                <div class="lb1_infor_ele-second">
                                    <p>Kinh nghiệm</p>
                                    <p>${job.experience}</p>
                                </div>
                            </div>
                        </div>
                        <div class="left_block1_deadline">
                            <img src="image/clock.png" alt="">
                            <p>Hạn nộp hồ sơ: ${job.deadline}</p>
                        </div>
                        <div class="left_block1_apply">
                            <a href="apply?idJob=${job.idJob}" class="lb1_apply-left">
                                <img src="image/paper.png" alt="">
                                <p>Ứng tuyển ngay</p>
                            </a>
                            <a href="#" class="lb1_apply-right">
                                <form class="pes_right" onclick="toggleImage(1)">
                                    <div id="heart1">
                                        <img src="image/heart.png" >
                                        <p>Yêu thích</p>
                                    </div>

                                    <div id="heart1red" style="display: none; color: red;">
                                        <img src="image/heart-red.png" >
                                        <p>Yêu thích</p>
                                    </div>
                                </form>
                            </a>
                        </div>
                    </div>

                    <div class="left_block2">
                        <h2>Chi tiết tuyển dụng</h2>
                        <h4>Mô tả công việc</h4>
                        <%
                            for (int i = 0; i < jobDescri.length; i++) {
                            %>
                                <p><%= jobDescri[i]%></p>
                            <%
                            }
                        %>
                        <br>

                        <h4>Yêu cầu ứng viên</h4>
                        <%
                            for (int i = 0; i < jobRequi.length; i++) {
                            %>
                                <p><%= jobRequi[i]%></p>
                            <%
                            }
                        %>

                        <br>

                        <h4>Quyền lợi</h4>
                        <%
                            for (int i = 0; i < jobBene.length; i++) {
                            %>
                                <p><%= jobBene[i]%></p>
                            <%
                            }
                        %>

                        <br>

                        <h4>Địa điểm làm việc</h4>
                        <c:forEach items="${emList}" var="em">
                            <c:if test="${em.idEmployer == job.idEmployer}">
                                <p>${em.address}</p>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

                <div class="right">
                    <div class="right_block1">
                        <c:forEach items="${emList}" var="em">
                            <c:if test="${em.idEmployer == job.idEmployer}">
                                <c:forEach items="${userList}" var="user">
                                    <c:if test="${user.email == em.emailEmployer}">
                                        <div class="right_block1_info">
                                            <div>
                                                <img src="${user.logo}">
                                            </div>
                                            <p>${user.name}</p>
                                        </div>

                                        <div class="right_block1_more">
                                            <div>
                                                <img src="image/age-group.png" alt="">
                                                <p>Quy mô:</p>
                                            </div>
                                            <p>${em.numberOfEmployees}</p>
                                        </div>

                                        <div class="right_block1_more">
                                            <div>
                                                <img src="image/placeholder.png" alt="">
                                                <p>Địa điểm:</p>
                                            </div>  
                                            <p>${em.address}</p>
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
        
        <script>
            function toggleImage(id) {
                var img1 = document.getElementById("heart" + id);
                var img2 = document.getElementById("heart" + id + "red");

                if (img1.style.display === "flex") {
                    img1.style.display = "none";
                    img2.style.display = "flex";
                } else {
                    img1.style.display = "flex";
                    img2.style.display = "none";
                }
            }
        </script>
    </body>

</html>
