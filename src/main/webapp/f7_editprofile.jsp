    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hồ sơ</title>
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            body {
                background-color: #F5F5F5;
            }

            .container-fluid {
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 0px;
            }

            .all {
                width: 60%;
                background-color: white;
                padding: 20px;
                border: 1px solid none;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                gap: 20px;
            }

            .all-title {
                font-family: 'Baloo';
                letter-spacing: 1px;
                margin: 0px;
                width: 90%;
                padding-bottom: 7px;
                border-bottom: 1px solid rgb(216, 215, 215);

            }

            .info {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }
            .info__label--img:hover{
                cursor: pointer;
            }
            .info__label{
                width: 150px;
                height: 150px;
            }
            .info__label--img{
                width: 150px;
                height: 150px;
                border-radius: 50%;
            }
            .info__label--name{
                font-weight: bold;
                font-size: 17px;
            }

            .all_infor{
                width: 80%;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                /*background-color: black;*/
            }
            .button{
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 20px;
                padding: 0 12px;
            }
            .reset{
                flex: 2;
                width: 100%;
                height: 33px;
                background-color: rgb(12, 94, 218);
                border: none;
                border-radius: 5px;
                color: white;
            }
            .save{
                flex:3;
                height: 33px;
                width: 100%;
                background-color: rgb(47, 133, 1);
                border: none;
                border-radius: 5px;
                color: white;
            }
            .error{
                color: red;
                font-size: 15px;
                margin: 10px 2px;
            }
            h6{
                margin-bottom: 0px;
            }
            
            
            /* ========================= pop-up ============================*/
            #toast {
                position: fixed;
                top: 100px;
                right: 32px;
            }

            #toast .toast {
                max-width: 300px;
                max-height: 120px;
                display: flex;
                align-items: center;
                gap: 20px;
                background-color: #fff;
                padding: 10px 10px;
                border-radius: 2px;
                border-left: 4px solid #47d864;
                box-shadow: 0 5px 8px rgba(0, 0, 0, 0.08);
                animation: slideInLeft ease 3s, fadeOut linear 2s 3s forwards;
            }

            @keyframes slideInLeft {
                from {
                    opacity: 0;
                    transform: translateX(calc(100% + 32px));
                }

                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            @keyframes fadeOut {
                to {
                    opacity: 0;
                }
            }


            .toast__icon {
                font-size: 22px;
                color: #47d864;
            }

            .toast__body--msg {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 17px;
                color: rgb(77, 75, 75);
            }
            .hide {
                display: none;
            }
        </style>
    </head>
    <body>
        <div>
            <jsp:include page="menu_logined.jsp"/>
        </div>

        <br><br><br><br><br>
        <div class="container-fluid">
            <!--pop-up notification-->
            <div id="toast" class="${status == 'success' ? '' : 'hide'}">
                <div class="toast">
                    <div class="toast__icon">
                        <div class="fas fa-check-circle"></div>
                    </div>
                    <div class="toast__body">
                        <p class="toast__body--msg">Chỉnh sửa thông tin thành công</p>
                    </div>
                </div>
            </div>
                
            <div class="all">
                <h1 class="all-title">Hồ sơ</h1>
                <form action="acc_profile" method="post" id="uploadForm" enctype="multipart/form-data">
                    <div class="info">
                        <label class="info__label" for="move">
                            <img src="${sessionScope.account.image}" alt="Avatar" class="info__label--img"> 
                            <!--<img src="Image/Avatar/Avatar_Default.png" alt="Avatar">--> 
                        </label>
                        <p class="mb-0 mt-2 info__label--name">${sessionScope.account.name}</p> 
                    <input type="file" name="avatar" id="move" onchange="updateImage()" style="display: none" />
                    </div>
                </form>
                <form class="all_infor" action="acc_profile" method="">
                    <div class="row mb-3" style="width: 100%">
                        <div class="col-md-6">
                            <h6>Tên</h6>
                            <input type="text" name="name" class="form-control" value="${sessionScope.account.name}" required/>    
                        </div>
                        <div class="col-md-6">
                            <h6>Email</h6>
                            <input type="text" name="email" class="form-control" 
                                   disabled value="${sessionScope.account.email}" required/>    
                        </div>
                    </div>
                    <div class="row mb-3" style="width: 100%">
                        <div class="col-md-6">
                            <h6>Số điện thoại</h6>
                            <input type="text" name="phone" class="form-control"
                                   value="${sessionScope.account.phone}"/>    
                        </div>
                        <div class="col-md-6">
                            <h6>Mật khẩu</h6>
                            <input type="password" value="111111111" class="form-control" disabled/>    
                        </div>
                    </div>
                    <div class="row mb-3" style="width: 100%">
                        <div class="col-md-6">
                            <h6>Trạng thái</h6>
                            <input type="text" value="Đang hoạt động" style="color: green; font-weight: bold; background-color: #fff"
                                   class="form-control" disabled/>    
                        </div>
                        <div class="col-md-6">
                            <!--<h6>Tên</h6>-->
                        </div>
                    </div>
                    <br>
                    <input type="hidden" name="choice" value="change_pass"/>
                    <div class="button row">
                        <input type="reset" name="new_pass_again" class="reset col-md-4"
                               value="Reset">
                        <input type="submit" name="new_pass_again" class="save col-md-4"
                               value="Lưu">
                    </div>
                </form>
            </div>
        </div>

        <div>
            <jsp:include page="footer.jsp"/>
        </div>
        
        
        <script>
            function updateImage() {
                // Truy cập form và gọi phương thức submit
                const form = document.getElementById('uploadForm');
                form.submit();
            }
        </script>
    </body>
</html>
