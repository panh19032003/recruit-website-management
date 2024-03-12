<%-- 
    Document   : f6_statistic
    Created on : Nov 10, 2023, 1:46:59 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <style>
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .postjob {
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

            .all_job {
                flex: 3;
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

        <div class="all_job py-5 row">
            <div class="col-md-6">
                <form action="statistic" method="post">
                    <div class="">
                        <div>
                            Nhập tháng: <input type="number" name="month" class="form-control">
                        </div>
                        <div>
                            Nhập năm: <input type="number" name="year" class="form-control">
                            <p>${count}</p>
                        </div>
                    </div>
                    <input type="submit" value="Thống kê" class="form-control"
                           style="background: rgb(74, 74, 243); color: white;">
                </form>

            </div>
                        
            <div class="col-md-6">
                <div id="myChart"></div>
            </div>
        </div>
    </div>

    <div>
        <jsp:include page="footer.jsp"/>
    </div>
    
    <script src="https://www.gstatic.com/charts/loader.js"></script>
        <script>
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                // Set Data
                const data = google.visualization.arrayToDataTable([
                    ['RoleId', 'Mhl'],
                    ['Thành công', ${success}],
                    ['Chờ xét duyệt', ${process}],
                    ['Thất bại', ${fail}]
                ]);
                
                // Set Options with Colors
                const options = {
                    colors: ['green', 'orange', 'red'], 
                };

                // Draw
                const chart = new google.visualization.PieChart(document.getElementById('myChart'));
                chart.draw(data, options);

            }
        </script>
</body>

</html>
