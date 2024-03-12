
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách công ty</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>
        <style>
            body{
                background: white;
            }
            .container{
                font-family: sans-serif;
            }
            .container .search{
                margin: 20px;  
                margin-top: 10px;
                width: 1000px;
                display: flex;
                justify-content: center;
            }
            .container .search-button{
                font-size: 20px;
                padding: 2px 8px;
                color: green;
                font-weight: 600;
                border-radius: 8px;
                border: 1px solid rgba(0, 0, 0, 0.2);
            }
            .container .block {
                width: 340px;
                height: 300px;
                border: 1px solid none;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                border-radius: 10px;
                overflow: hidden;
                padding: 0px;
                background: white;
            }
            .container .block_first{
                width: 100%;
                height: 160px;
            }
            .container .block_first-img{
                width: 100%;
                height: 100%;
                margin-bottom: 0px;
            }
            .container .block_second{
                font-family: 'Baloo';
                font-size: 20px;
                white-space: nowrap;
                /* Ngăn ngừng dòng */
                overflow: hidden;
                /* Ẩn nội dung vượt quá phần tử */
                text-overflow: ellipsis;
                /* Thay thế bằng dấu "..." */
            }
            .container .block_third{
                text-align: justify;
                margin-bottom: 5px;
                font-size: 13px;

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




        <div class="container">
            <br><br><br><br><br>
            <h1 style="text-align: center; font-family: 'Baloo';">Danh sách công ty<h1>
            <div class="row" style="display: flex; justify-content: center;">
                <form action = "employer" method="post" class="search" style="height: 35px;">
                    <img src="image/find.png" alt="alt"/> &nbsp;&nbsp;
                    <input type="text" name="name" value="${param.name}"
                           class="form-control" placeholder="Nhập tên công ty">&nbsp;&nbsp;
                    <input type="submit" value="Tìm kiếm"  class="search-button"/>
                </form>
            </div>

            <div class="row" style="display: flex; justify-content: center;">
                <c:forEach items="${requestScope.userList}" var="u">
                    <c:forEach items="${requestScope.emList}" var="e">
                        <c:if test="${u.email == e.emailEmployer}">
                            <div class="col-4 block m-3">
                                <div class="block_first">
                                    <img class="col-3 block_first-img" src="${u.image}">
                                </div>

                                <h5 class="block_second m-2">${u.name}</h5>
                                <p class="block_third m-2 ">"${e.describes}"</p>
                            </div> 
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </div>
        </div>


        <div>
            <jsp:include page="footer.jsp"/>
        </div>

    </body>
</html>
