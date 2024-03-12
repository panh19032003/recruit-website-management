
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>

        <link rel="stylesheet" type="text/css" href="style_acc_login.css">
        <style>
            .login{
                width: 100%;
                height: 2rem;
                background-color: #EB6304;
                color: #fff;
                border: none;
                border-radius: 5px;
                
            }
        </style>
    </head>

    <body>
        <div class="row">
            <div class="col-5 left" >
                <img style="overflow-x: hidden;" src="image/log-in.png" style="width: 100%;">
            </div>

            <div class="col-7 right">
                <form action="account" class="right-block" method="post">
                    <p class="right-block-title">Đăng nhập</p>

                    Email<br>
                    <input type="text"  name="email" value="${cookie.email_coo.value}"
                           class="form-control right-block_input" placeholder="your-email@gmail.com" required>
                    <br>
                    Mật khẩu<br>
                    <input type="password"  name="password" value="${cookie.pass_coo.value}"
                           class="form-control right-block_input" placeholder="your password" required>

                    <div class="right-block-check">
                        <div class="right-block-check-remember">
                            <input type="checkbox" id="remember" name = "remember" 
                                ${(cookie.rem_coo!=null?'checked':'')} value="on">
                            <label for="remember">&nbsp Ghi nhớ đăng nhập</label>
                        </div>
                        <span class="right-block-check-forgot"><a href="">Quên mật khẩu</a></span>
                    </div>

                    <p class="error">${requestScope.error}</p>

                    <button type="submit" class="login"
                            name="choice" value="login">Đăng nhập</button>

                    <p class="right-block-or">hoặc</p>

                    <button type="submit" class="form-control right-block-submitF">
                        <img src="image/facebook.png" alt="">
                        &nbsp; Đăng nhập với facebook
                    </button>

                    <button type="submit" class="form-control right-block-submitG">
                        <img src="image/google.png" alt="">
                        &nbsp; Đăng nhập với Google
                    </button>

                    <p class="right-block-signup">Bạn chưa có tài khoản? 
                        <a href="acc_signup_user.jsp">Đăng ký ngay</a></p>
                </form>

            </div>

        </div>


    </body>

</html>