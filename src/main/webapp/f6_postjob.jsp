<%-- 
    Document   : f6_postjob
    Created on : Nov 8, 2023, 8:37:28 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng tin tuyển dụng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <link href='https://fonts.googleapis.com/css?family=Manrope' rel='stylesheet'>
        <link rel="stylesheet" href="job.css">
        <style>
            .container{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .postjob{
                width: 100%;
                display: flex;
                justify-content: left;
                align-items: stretch;
                gap: 50px;
                font-family: sans-serif;
            }
            .m-left{
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
            .m-left div{
                margin-left: 30px;
            }
            .m-left a{
                color: black;
                text-decoration: none;
            }
            .all-job{
                flex: 3;
            }

            .edit{
                display: flex;
                gap: 10px;
                justify-content: center;
                align-items: center;
            }
            .edit div{
                display: flex;
                gap: 10px;
                justify-content: center;
                align-items: center;
            }
            table, th, td {
                padding: 5px;
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.account != null}">
            <div>
                <jsp:include page="menu_logined.jsp"/>
            </div>
        </c:if>
        <br><br><br>
        <div class="postjob">
            <div class="m-left">
                <div class="m-title">TUYỂN DỤNG</div>
                <div class="m-ele">
                    <a href="createjob">Đăng tin</a>
                </div>
                <div class="m-ele">
                    <a href="handle">Chờ xét duyệt</a>
                </div>
                <div class="m-ele">
                    <a href="statistic">Thống kê</a>
                </div>
            </div>

            <div class="all-job p-3">
                <div class="w-75">
                    <div class="text-center" style="font-size: 40px;">Đăng tin</div>
                    <form action="createjob" method="post">
                        <table>
                            <tr>
                                <td>Chuyên ngành công việc<br></td>
                                <td>
                                    <select name="jobcategory" class="form-control">
                                        <c:forEach items="${cateList}" var="cate">
                                            <option value="${cate.idCategory}">${cate.nameCategory}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Tên công việc<br></td>
                                <td>
                                    <input type="text" name="namejob" class="form-control" required>
                                </td>
                            </tr>

                            <tr>
                                <td>Mức lương (triệu/tháng)</td>
                                <td>
                                    <div class="edit">
                                        <div>
                                            <p>Từ</p>
                                            <input type="number" name="from" class="form-control">
                                        </div>
                                        <div>
                                            <p>Đến</p>
                                            <input type="number" name="to" class="form-control">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Địa chỉ</td>
                                <td>
                                    <textarea type="text" name="addressjob" class="form-control" required></textarea>
                                </td>
                            </tr>

                            <tr>
                                <td>Hạn đăng kí</td>
                                <td>
                                    <input type="date" name="deadlinejob" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td>Mô tả công việc</td>
                                <td>
                                    <textarea type="text" name="describejob" style="height: 100px;" class="form-control"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>Yêu cầu</td>
                                <td>
                                    <textarea type="text" name="requirejob" style="height: 100px;" class="form-control"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>Lợi ích</td>
                                <td>
                                    <textarea type="text" name="benefitjob" style="height: 100px;" class="form-control"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>Yêu cầu kinh nghiệm (năm)</td>
                                <td>
                                    <input type="text" name="experiencejob" class="form-control">
                                </td>
                            </tr>
                            <tr>

                                <td colspan="2">
                                    <input type="submit" value="Đăng tin" class="form-control"
                                           style="background-color: green; color: white;">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>

            </div>
        </div>

    </body>

</html>