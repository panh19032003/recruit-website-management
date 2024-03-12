

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu no login</title>
        <!--<link rel="stylesheet" href="style_menu_nologin.css">-->
        <style>
            * {
                margin: 0;
                padding: 0;
            }

            .menu {
                height: 70px;
                background: #e7edf5;
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-family: sans-serif;
                width: 100%;
                position: fixed;
            }

            /* ========================= MENU LEFT =====================*/
            .menu-left {
                margin-left: 20px;
                flex: 1;
            }

            /* ========================= MENU CENTER ==================== */
            .menu-center {
                flex: 3;
                display: flex;
                justify-content: space-evenly;
                align-items: center;
                position: relative;

            }

            .menu-center-hover {
                color: black;
                font-family: sans-serif;
                text-decoration: none;
                font-weight: bolder;
                font-size: 15px;
            }

            .menu-center-hover:hover {
                color: red;
            }

            .menu_center1,
            .menu_center2,
            .menu_center3,
            .menu_center4 {
                display: none;
                position: absolute;
                border: 1px solid none;
                border-radius: 10px;
                background: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                top: 50px;
            }

            .menu_center1 {
                width: 220px;
                left: 175px;
            }

            .menu_center2 {
                width: 200px;
                left: 290px;
            }

            .menu_center3 {
                width: 190px;
                left: 425px;
            }
            
            .menu_center4 {
                width: 200px;
                left: 646px;
            }

            .menu_center1 ul,
            .menu_center2 ul,
            .menu_center3 ul,
            .menu_center4 ul {
                padding: 0px;
            }

            .menu_center1 ul li,
            .menu_center2 ul li,
            .menu_center3 ul li,
            .menu_center4 ul li {
                margin: 16px 10px;
                list-style: none;
            }

            .menu_center1 ul li:hover,
            .menu_center2 ul li:hover,
            .menu_center3 ul li:hover,
            .menu_center4 ul li:hover {
                font-weight: bolder;
            }

            .menu_center1 ul li a:hover,
            .menu_center2 ul li a:hover,
            .menu_center3 ul li a:hover,
            .menu_center4 ul li a:hover {
                color: red;
            }

            .menu_center1 a,
            .menu_center2 a,
            .menu_center3 a,
            .menu_center4 a{
                text-decoration: none;
                color: black;
            }

            .menu_center1.open-block1,
            .menu_center2.open-block2,
            .menu_center3.open-block3,
            .menu_center4.open-block4{
                display: block;
            }




            /* =============== MENU RIGHT ========================*/
            .menu-right {
                display: flex;
                justify-content: end;
                align-items: center;
                flex: 1;
                position: relative;
            }

            .menu-right-hover {
                display: flex;
                justify-content: end;
                align-items: center;
                text-decoration: none;
                border: 1px solid rgba(0, 0, 0, 0.5);
                background-color: #FAFAFA;
                padding: 1px 2px;
                border-radius: 20px;
                margin-right: 30px;
            }

            .menu-right-hover img {
                width: 30px;
                height: 30px;
                border-radius: 50%;
                overflow: hidden;
            }

            .menu-right-hover p {
                margin: 0px;
                color: black;
                font-family: sans-serif;
                font-size: 12px;
                font-weight: bold;
            }

            .menu_click {
                display: none;
                position: absolute;
                width: 200px;
                border: 1px solid none;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                top: 60px;
                margin-right: 30px;
                background: white;

            }

            .menu_click ul {
                padding: 0px;
                background: white;
            }

            .menu_click ul li {
                margin: 16px 10px;
                list-style: none;
                background: white;
            }

            .menu_click ul li:hover {
                font-weight: bolder;
            }

            .menu_click ul li a:hover {
                color: red;
            }

            .menu_click a {
                text-decoration: none;
                color: black;
            }

            .menu_click.open-block {
                display: block;
            }
        </style>

    </head>

    <body>
        <div class="menu">
            <!-- ==================== MENU LEFT =========================== -->
            <div class="menu-left">
                <img src="image/logo.png" alt="">
            </div>

            <!-- ==================== MENU CENTER =========================== -->
            <div class="menu-center">
                <a class="menu-center-hover" href="home.jsp">Trang chủ</a>

                <a class="menu-center-hover" href="javacript:void(0)" onclick="toDo1()">Việc làm</a>
                <div class="menu_center1">
                    <ul>
                        <!--                        <li><a href="job?choice_job=findjob">
                                                        <img src="image/magnifying-glass.png">&nbsp;&nbsp; Tìm việc làm</a></li>-->
                        <li><a href="job?choice=find_job">
                                <img src="image/magnifying-glass.png">&nbsp;&nbsp; Tìm việc làm</a></li>
                        <li><a href="applyjob">
                                <img src="image/loupe.png">&nbsp;&nbsp; Việc làm đã ứng tuyển</a></li>
                        <li><a href="jobsave">
                                <img src="image/data-storage.png">&nbsp;&nbsp; Việc làm đã lưu</a></li>
                        <li><a href="acc_signup_em.jsp">
                                <img src="image/new.png">&nbsp;&nbsp; Việc làm mới</a></li>
                        <li><a href="acc_signup_em.jsp">
                                <img src="image/consultant.png">&nbsp;&nbsp; Việc làm IT</a></li>
                    </ul>
                </div>

                <a class="menu-center-hover" href="javacript:void(0)" onclick="toDo2()">Hồ sơ & CV</a>
                <div class="menu_center2">
                    <ul>
                        <li><a href="f7_editprofile.jsp">
                                <img src="image/profile.png">&nbsp;&nbsp;Hồ sơ</a></li>

                        <li><a href="acc_signup_em.jsp">
                                <img src="image/approved.png">&nbsp;&nbsp;Sơ yếu lí lịch (CV)</a></li>
                    </ul>
                </div>


                <a class="menu-center-hover" href="javacript:void(0)" onclick="toDo3()">Công ty</a>
                <div class="menu_center3">
                    <ul>
                        <li><a href="employer">
                                <img src="image/employee.png">&nbsp;&nbsp;Danh sách công ty</a></li>

                        <li><a href="acc_signup_em.jsp">
                                <img src="image/manager.png">&nbsp;&nbsp;Top các công ty</a></li>
                    </ul>
                </div>

                <a class="menu-center-hover" href="home.jsp">Hỏi đáp</a>
                
                <c:if test="${sessionScope.account.role == 0}">
                    <a class="menu-center-hover" href="javacript:void(0)" onclick="toDo4()">TUYỂN DỤNG</a>
                    <div class="menu_center4">
                        <ul>
                            <li><a href="createjob">
                                    <img src="image/employee.png">&nbsp;&nbsp;Đăng tin tuyển dụng</a></li>

                            <li><a href="statistic">
                                    <img src="image/manager.png">&nbsp;&nbsp;Thống kê</a></li>
                        </ul>
                    </div>
                </c:if>


            </div>

            <!-- ==================== MENU RIGHT =========================== -->
            <div class="menu-right">
                <a class="menu-right-hover" href="javacript:void(0)" onclick="toDo()">
                    <img src="${sessionScope.account.image}" alt="">
                    &nbsp;&nbsp;
                    <p>${sessionScope.account.name}&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </a>
                <div class="menu_click">
                    <ul>
                        <li><a href="f7_editprofile.jsp">
                                <img src="image/user-infor.png">&nbsp;&nbsp; Thông tin cá nhân</a></li>
                        <li><a href="account?choice=change_pass">
                                <img src="image/reset-password.png">&nbsp;&nbsp; Đổi mật khẩu</a></li>
                        <li><a href="#" onclick="doDisable('${sessionScope.account.email}')">
                                <img src="image/delete-user.png">&nbsp;&nbsp; Xóa tài khoản</a></li>
                        <li>
                            <a href="account?choice=logout">
                                <img src="image/logout.png">&nbsp;&nbsp; Đăng xuất</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <script>
            function doDisable(email) {
                if (confirm("Bạn có chắc chắn muốn xóa tài khoản không?")) {
                    window.location = "account?choice=disable&email=" + email;
                }
            }


            const menu_click1 = document.querySelector('.menu_center1');
            let status1 = false;
            function open1() {
                menu_click1.classList.add('open-block1');
            }
            function remove1() {
                menu_click1.classList.remove('open-block1');
            }
            function toDo1() {
                if (status1)
                    remove1();
                else
                    open1();
                status1 = !status1;
            }

            const menu_click2 = document.querySelector('.menu_center2');
            let status2 = false;
            function open2() {
                menu_click2.classList.add('open-block2');
            }
            function remove2() {
                menu_click2.classList.remove('open-block2');
            }
            function toDo2() {
                if (status2)
                    remove2();
                else
                    open2();
                status2 = !status2;
            }

            const menu_click3 = document.querySelector('.menu_center3');
            let status3 = false;
            function open3() {
                menu_click3.classList.add('open-block3');
            }
            function remove3() {
                menu_click3.classList.remove('open-block3');
            }
            function toDo3() {
                if (status3)
                    remove3();
                else
                    open3();
                status3 = !status3;
            }

            const menu_click4 = document.querySelector('.menu_center4');
            let status4 = false;
            function open4() {
                menu_click4.classList.add('open-block4');
            }
            function remove4() {
                menu_click4.classList.remove('open-block4');
            }
            function toDo4() {
                if (status4)
                    remove4();
                else
                    open4();
                status4 = !status4;
            }


            const menu_click = document.querySelector('.menu_click');
            let status = false;
            function open() {
                menu_click.classList.add('open-block');
            }
            function remove() {
                menu_click.classList.remove('open-block');
            }
            function toDo() {
                if (status)
                    remove();
                else
                    open();
                status = !status;
            }

        </script>
    </body>

</html>
