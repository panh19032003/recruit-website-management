<%-- 
    Document   : f2_giveinfor
    Created on : Nov 8, 2023, 11:19:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>
        <style>
            .infor {
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .frame {
                width: 60%;
                font-family: sans-serif;
                border: 1px solid none;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                border-radius: 10px;
                padding: 20px;
            }

            .frame h2 {
                margin: 0px;
                font-size: 40px;
                font-family: 'Baloo';
                color: green;
                margin: 10px auto;
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
        <div class="infor">
            <div class="frame">
                <form action="apply" method="post">
                    <h2>Thông tin chi tiết</h2>

                    <strong style="font-size: 15px;">Họ và tên</strong><br>
                    <input type="text" name="nameInfor" class="form-control" placeholder="Họ và tên hiển thị với NTD"
                           required><br>

                    <strong style="font-size: 15px;">Email</strong><br>
                    <input type="text" name="emailInfor" class="form-control" placeholder="Email hiển thị với NTD" required><br>

                    <strong style="font-size: 15px;">Số điện thoại</strong><br>
                    <input type="tel" name="phoneInfor" class="form-control" placeholder="Số điện thoại hiển thị với NTD"
                           required><br>

                    <strong style="font-size: 15px;">CV của bạn (gửi đính kèm link)</strong><br>
                    <input type="text" name="linkInfor" class="form-control" placeholder="Link CV (đính kèm)" ><br>

                    <input type="submit" value="Nộp hồ sơ ứng tuyển" class="form-control"
                           style="background-color: rgb(50, 50, 192); color:white" />
                    <input type="hidden" name="id_job" value="${idJob}" />
                </form>
            </div>
        </div>
        
        <div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>

</html>
