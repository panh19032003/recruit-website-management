<%-- 
    Document   : f2_findjob
    Created on : Nov 3, 2023, 9:37:29 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</html>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tìm việc làm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <style>
            .search_job {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 100%;
            }

            .table_job,
            tr,
            td {
                padding: 10px;
            }

            .table_job-td {
                width: 300px;
            }

            .search_submit {
                background-color: rgb(15, 143, 15);
                color: white;
                font-size: 17px;
                width: 60%;
                border-radius: 5px;
                margin-left: 200px;
            }
            .part {
                /*margin-top: 150px;*/
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .part-ele {
                width: 25%;
                border: 1px solid none;
                margin: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                border-radius: 10px;
                padding: 10px 8px;
                background-color: white;
            }

            .part-ele-first {
                margin-bottom: 10px;
                text-decoration: none;
                color: black;
            }

            .part-ele-first div:first-child {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .part-ele-first div:last-child{
                margin: auto 0px;
            }
            .part-ele-first div:last-child h5 {
                margin: 0px;
                font-size: 18px;
                white-space: nowrap;
                /* Ngăn ngừng dòng */
                overflow: hidden;
                /* Ẩn nội dung vượt quá phần tử */
                text-overflow: ellipsis;
                /* Thay thế bằng dấu "..." */
            }

            .part-ele-first div:last-child p {
                margin: 0px;
                font-size: 13px;
            }

            .part-ele-first div img {
                width: 55px;
                height: 48px;
                border-radius: 6px;
            }
            .part-ele-first:hover{
                color: black;
            }
            .part-ele-first div h5:hover{
                color: green;
                text-decoration: underline;
            }
            .part-ele-first div p:hover{
                color: black;
            }
            .part-ele-second {
                display: flex;
                justify-content: left;
                align-items: center;
            }

            .pes_left {
                display: flex;
                justify-content: left;
                align-items: center;
            }

            .pes_left p {
                font-size: 12px;
                margin: 0px;
                margin-right: 10px;
                border: 1px solid none;
                padding: 2px 5px;
                background: #F4F5F5;
            }

            .pes_right {
                cursor: pointer;
                margin: 0px;

            }

            .pes_right img {
                width: 65%;
                display: block;
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.account != null}">
            <div>
                <jsp:include page="menu_logined.jsp"/>
            </div>
        </c:if>

        <br><br><br><br><br>
        <div class="findjob">
            <form class="search_job" action="searchjob">
                <table class="table_job">
                    <tr>
                        <td>Ngành nghề</td>
                        <td class="table_job-td">
                            <select name="cate_search" class="form-control">
                                <option value="">Tất cả</option>
                                <c:forEach items="${cateList}" var="cate">
                                    <option value="${cate.idCategory}">${cate.nameCategory}</option>    
                                </c:forEach>
                            </select>
                        </td>

                        <td>Nhập tên công việc</td>
                        <td class="table_job-td">
                            <input type="text" name="name_search" class="form-control">
                        </td>
                    </tr>

                    <tr>
                        <td>Chọn mức lương</td>
                        <td class="table_job-td">
                            <select name="salary_search" class="form-control">
                                <option value="0">Thỏa thuận</option>
                                <option value="1">Dưới 10 triệu</option>
                                <option value="2">20 - 30 triệu</option>
                                <option value="3">30 - 40 triệu</option>
                                <option value="4">40 - 50 triệu</option>
                                <option value="5">Trên 50 triệu</option>
                            </select>
                        </td>
            
                        <td>Địa chỉ</td>
                        <td class="table_job-td">
                            <input type="text" name="address_search" class="form-control">
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4" class="tr_end">
                            <input type="submit" value="Tìm kiếm" class="form-control search_submit">

                        </td>
                    </tr>
                </table>
            </form>
            <div class="row part">
                <c:forEach items="${requestScope.jobList}" var="job">
                    <c:forEach items="${requestScope.emList}" var="em">
                        <c:if test="${em.idEmployer == job.idEmployer}">
                            <c:forEach items="${requestScope.userList}" var="user">
                                <c:if test="${em.emailEmployer == user.email}">
                                    <div class="col-4 part-ele">
                                        <a class="row part-ele-first" href="findjobdetail?idJob=${job.idJob}">
                                            <div class="col-3"><img src="${user.logo}">
                                            </div>
                                            <div class="col-9">
                                                <h5>${job.nameJob}</h5>
                                                <p>${user.name}</p>
                                            </div>
                                        </a>

                                        <div class="row part-ele-second">
                                            <div class="col-10 pes_left">
                                                <p>${job.salary}</p>
                                                <p>${job.address}</p>
                                            </div>
                                            <c:if test="${sessionScope.account != null}">
                                                <form class="col-2 pes_right">
                                                    <c:set var="check" value="false" /> 
                                                    <c:forEach items="${loveList}" var="love">
                                                        <c:if test="${love.idUser == sessionScope.account.idUser && love.idJob == job.idJob}">
                                                            <c:if test="${love.status == 'on'}">
                                                                <a href="findjob?page=findjob&option=savejob&status=no_heart&idJob=${job.idJob}&idUser=${sessionScope.account.idUser}">
                                                                    <img src="image/heart-red.png" id="heart${job.idJob}red"></a>
                                                                    <c:set var="check" value="true" />
                                                                </c:if>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:if test="${check == false}">
                                                        <a href="findjob?page=findjob&option=savejob&status=heart&idJob=${job.idJob}&idUser=${sessionScope.account.idUser}">
                                                            <img src="image/heart.png" id="heart${job.idJob}"></a>
                                                        </c:if>
                                                </form>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </div>
        </div>


        <div>
            <jsp:include page="footer.jsp"/>
        </div>

        <script>
            function toggleImage(idJob, idUser) {
                var img1 = document.getElementById("heart" + idJob);
                var img2 = document.getElementById("heart" + idJob + "red");
                var url = "idJob=" + idJob + "&idUser=" + idUser;

                if (img1.style.display === "block") {
                    window.location.href = "findjob?page=findjob&option=savejob&status=no_heart&" + url;
                } else {
                    window.location.href = "findjob?page=findjob&option=savejob&status=heart&" + url;
                }
            }
        </script>
    </body>

</html>
