
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu no login</title>
        
        <style>
            body {
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
            .menu_center3 {
                display: none;
                position: absolute;
                border: 1px solid none;
                border-radius: 10px;
                background: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                top: 50px;
            }

            .menu_center1 {
                width: 230px;
                left: 190px;
            }

            .menu_center2 {
                width: 200px;
                left: 315px;
            }

            .menu_center3 {
                width: 190px;
                left: 460px;
            }
            .menu_center1 ul,
            .menu_center2 ul,
            .menu_center3 ul {
                padding: 0px;
            }

            .menu_center1 ul li,
            .menu_center2 ul li,
            .menu_center3 ul li {
                margin: 16px 10px;
                list-style: none;
            }

            .menu_center1 ul li:hover,
            .menu_center2 ul li:hover,
            .menu_center3 ul li:hover {
                font-weight: bolder;
            }

            .menu_center1 ul li a:hover,
            .menu_center2 ul li a:hover,
            .menu_center3 ul li a:hover {
                color: red;
            }

            .menu_center1 a,
            .menu_center2 a,
            .menu_center3 a {
                text-decoration: none;
                color: black;
            }

            .menu_center1.open-block1,
            .menu_center2.open-block2,
            .menu_center3.open-block3 {
                display: block;
            }




            /* =============== MENU RIGHT ========================*/
            .menu-right {
                display: flex;
                justify-content: space-evenly;
                align-items: center;
                flex: 1;
                position: relative;
            }

            .menu-right-hover {
                border: 1px solid none;
                padding: 10px 20px;
                border-radius: 7px;
                background-color: #2093D5;
                color: white;
                text-decoration: none;
            }

            .menu-right-hover:hover {
                background: #02679e;
                color: white;
            }

            .menu_click {
                display: none;
                position: absolute;
                width: 230px;
                border: 1px solid none;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                top: 60px;
                background: white;
            }

            .menu_click ul{
                padding: 0px;
            }
            .menu_click ul li {
                margin: 16px 10px;
                list-style: none;
            }

            .menu_click ul li:hover {
                color: red;
                font-weight: bolder;
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
                        <li><a href="job?choice=find_job">
                                <img src="image/magnifying-glass.png">&nbsp;&nbsp; Tìm việc làm</a></li>
                        <li><a href="acc_signup_em.jsp">
                                <img src="image/loupe.png">&nbsp;&nbsp; Việc làm đã ứng tuyển</a></li>
                        <li><a href="acc_signup_em.jsp">
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
                        <li><a href="acc_signup_user.jsp">
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

                <a class="menu-center-hover" href="#">Hỏi đáp</a>
                <a class="menu-center-hover" href="#">Bài báo</a>

            </div>

            <!-- ==================== MENU RIGHT =========================== -->
            <div class="menu-right">
                <a class="menu-right-hover" href="acc_login.jsp">Đăng nhập</a>

                <a class="menu-right-hover" href="javacript:void(0)" onclick="toDo()">Đăng kí</a>
                <div class="menu_click">
                    <ul>
                        <li><a href="acc_signup_user.jsp">
                                <img src="image/employee.png">&nbsp;&nbsp; Tôi là người ứng tuyển</a></li>
                        <li><a href="acc_signup_em.jsp">
                                <img src="image/manager.png">&nbsp;&nbsp; Tôi là nhà tuyển dụng</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <script>
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