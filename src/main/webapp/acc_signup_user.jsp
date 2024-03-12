<%-- 
    Document   : SigUpUsers
    Created on : Oct 28, 2023, 9:49:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng kí tài khoản</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>

        <link rel="stylesheet" href="style_acc_signup.css">
        

    </head>

    <body>
        <div class="row">
            <div class="col-7 left">
                <form action="account" class="left-block" method="get">
                    <p class="left-block-title">Đăng kí tài khoản</p>

                    Họ và tên<span class="left-block_warning"> *</span><br>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <img src="image/user.png" alt="">
                            </span>
                        </div>
                        <input type="text" name="username" value="${param.username}"
                               class="form-control" placeholder="Nhập họ tên" required>
                    </div>
                    <p class="error">${requestScope.nameUserErr}</p>

                    Email<span class="left-block_warning"> *</span><br>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <img src="image/email.png" alt="">
                            </span>
                        </div>
                        <input type="email" name="emailUser" value="${param.emailUser}"
                               class="form-control" placeholder="Nhập email" required>
                    </div>
                    <p class="error">${requestScope.emailUserErr}</p>

                    Số điện thoại<br>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <img src="image/phone.png" alt="">
                            </span>
                        </div>
                        <input type="tel" name="phone" value="${param.phone}"
                               class="form-control" placeholder="Nhập số điện thoại">
                    </div>
                    <p class="error">${requestScope.phoneErr}</p>

                    Mật khẩu<span class="left-block_warning"> *</span><br>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <img src="image/password.png" alt="">
                            </span>
                        </div>
                        <input type="password" name="password" value="${param.password}" 
                               class="form-control" placeholder="Nhập mật khẩu" required>
                    </div>
                    <p class="error"></p>

                    Nhập lại mật khẩu<span class="left-block_warning"> *</span><br>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <img src="image/password.png" alt="">
                            </span>
                        </div>
                        <input type="password" name="passwordAgain" value="${param.passwordAgain}" 
                               class="form-control" placeholder="Nhập lại mật khẩu" required>
                    </div>
                    <p class="error">${requestScope.passwordAgainErr}</p>


                    <div class="left-block-confirm">
                        <input type="checkbox" id="confirm" required>
                        <label for="confirm">
                            &nbsp Tôi đã đọc và đồng ý với 
                            <a href="extra_rule.jsp" class="left-block-confirm_accept">Điều khoản dịch vụ</a> 
                            và 
                            <a href="extra_security.jsp" class="left-block-confirm_accept">Chính sách bảo mật</a> 
                            của 
                            <a href="home.jsp" class="left-block-confirm_accept">JobVN</a>
                        </label>
                    </div>

                    <button type="submit" class="form-control left-block-submit"
                        name="choice" value="signup_user">Đăng kí</button>

                    <p class="left-block-signup">Bạn đã có tài khoản? 
                        <a href="acc_login.jsp">Đăng nhập ngay</a></p>
                </form>

            </div>

            <div class="col-5 right">
                <img src="image/sign-up.png" style="width: 70%;" alt="">
            </div>

        </div>


    </body>

</html>
