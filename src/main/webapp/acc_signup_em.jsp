<%-- 
    Document   : sign-up-employer
    Created on : Oct 30, 2023, 12:59:21 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng kí tài khoản Nhà tuyển dụng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>


    <link rel="stylesheet" href="style_acc_signup.css">

</head>

<body>
    <div class="row">
        <div class="col-7 left">
            <form action="account" class="left-block">
                <p class="left-block-title">Đăng kí tài khoản Nhà tuyển dụng</p>
                <br>

            <!-- ====================== TAI KHOAN ======================== -->
                <h5 style="height: 25px">Tài khoản</h5>
                Email<span class="left-block_warning"> *</span><br>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <img src="image/email.png" alt="">
                        </span>
                    </div>
                    <input type="email" name="emailEmployer" value="${param.emailEmployer}"
                        class="form-control" placeholder="Nhập email" required>
                </div>
                <p class="error">${requestScope.emailEmErr}</p>

                Mật khẩu<span class="left-block_warning"> *</span><br>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <img src="image/password.png" alt="">
                        </span>
                    </div>
                    <input type="password" name="password" required
                        class="form-control" placeholder="Nhập mật khẩu">
                </div>
                <p class="error"></p>

                Nhập lại mật khẩu<span class="left-block_warning"> *</span><br>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <img src="image/password.png" alt="">
                        </span>
                    </div>
                    <input type="password" name="passwordAgain" required
                        class="form-control" placeholder="Nhập lại mật khẩu">
                </div>
                <p class="error">${requestScope.passwordAgainEmErr}</p><br><br>

                
            <!-- ============== THONG TIN CO BAN =============================-->
                <h5 style="height: 25px">Thông tin nhà tuyển dụng</h5>
                Tên công ty<span class="left-block_warning"> *</span><br>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <img src="image/office-building.png" alt="">
                        </span>
                    </div>
                    <input type="text" name="nameEm" value="${param.nameEm}"
                           class="form-control" placeholder="Nhập tên công ty" required>
                </div><br>

                Số điện thoại<span class="left-block_warning"> *</span><br>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <img src="image/phone.png" alt="">
                        </span>
                    </div>
                    <input type="tel" name="phoneEm" value="${param.phoneEm}"
                        class="form-control" placeholder="Nhập số điện thoại">
                </div>
                <p class="error">${requestScope.phoneEmErr}</p>

                Năm thành lập<span class="left-block_warning"> *</span><br>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <img src="image/calendar.png" alt="">
                        </span>
                    </div>
                    <input type="number" name="foundyear" value="${param.foundyear}"
                        class="form-control" placeholder="Nhập năm thành lập">
                </div>
                <p class="error"></p>

                Số lượng thành viên<span class="left-block_warning"> *</span><br>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <img src="image/crowd.png" alt="">
                        </span>
                    </div>
                    <input type="number" name="numberOfEm" value="${param.numberOfEm}"
                        class="form-control" placeholder="Nhập số lượng thành viên">
                </div>
                <p class="error"></p>
                    

                <div class="left-block-confirm">
                    <input type="checkbox" id="confirm" required>
                    <label for="confirm">
                        &nbsp Tôi đã đọc và đồng ý với 
                        <a href="extra_rule.jsp" class="left-block-confirm_accept">Điều khoản dịch vụ</a> 
                        và 
                        <a href="extra_security.jsp" class="left-block-confirm_accept">Chính sách bảo mật</a> 
                        của 
                        <a href="home.jsp" class="left-block-confirm_accept">JobsVN</a>
                    </label>
                </div>

                <button type="submit" class="form-control left-block-submit" 
                    name="choice" value="signup_em">Đăng kí</button>

                <p class="left-block-signup">Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a></p>
            </form>

        </div>

        <div class="col-5 right">
            <img src="image/building.png" style="width: 70%;" alt="">
        </div>

    </div>


</body>

</html>

