<%-- 
    Document   : f7_change_password
    Created on : Nov 6, 2023, 12:19:15 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đổi mật khẩu</title>
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
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

            .all_inter {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                gap: 10px;
            }

            .all_inter div {
                text-align: center;
                width: 150px;
                height: 150px;

            }

            .all_inter div img {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                overflow: hidden;
            }

            .all_inter p {
                font-family: sans-serif;
                font-weight: bold;
                font-size: 20px;
            }
            .all_infor{
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }
            .all_infor_table{
                font-family: sans-serif;
                width: 80%;
                border-spacing: 110px;
            }
            .button{
                width: 80%;
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 5px;
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
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.account != null}">
            <div>
                <jsp:include page="menu_logined.jsp"/>
            </div>
        </c:if>

        <br><br><br><br><br>
        <div class="container-fluid">
            <div class="all">
                <h1 class="all-title">Thay đổi mật khẩu đăng nhập</h1>
                <div class="all_inter">
                    <div>
                        <img src="${sessionScope.account.image}">
                    </div>
                    <p>${sessionScope.account.name}</p>
                </div>
                <form class="all_infor" action="account">
                    <table class="all_infor_table">
                        <tr>
                            <td>Email đăng nhập</td>
                            <td>
                                <input type="text" value="${sessionScope.account.email}" 
                                       class="form-control" disabled style="opacity: 0.8">
                            </td>
                        </tr>

                        <tr>
                            <td></td>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>Mật khẩu hiện tại</td>
                            <td>
                                <input type="password" name="old_pass" class="form-control"
                                       placeholder="Nhập mật khẩu hiện tại" required>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="error">
                                <c:if test="${oldErr != ''}">
                                    ${oldErr}<br>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>Mật khẩu mới</td>
                            <td>
                                <input type="password" name="new_pass" class="form-control" 
                                       placeholder="Nhập mật khẩu mới" required>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>Xác nhận mật khẩu mới</td>
                            <td>
                                <input type="password" name="new_pass_again" class="form-control"
                                       placeholder="Xác nhận mật khẩu mới" required>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td  class="error">${passAgainErr}</td>
                        </tr>
                    </table>
                    <br>
                    <input type="hidden" name="choice" value="change_pass"/>
                    <div class="button">
                        <input type="reset" name="new_pass_again" class="reset"
                               value="Reset">
                        <input type="submit" name="new_pass_again" class="save"
                               value="Lưu">
                    </div>
                </form>
            </div>
        </div>

        <div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
