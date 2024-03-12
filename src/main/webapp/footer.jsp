<%-- 
    Document   : footer
    Created on : Oct 28, 2023, 10:39:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer Example</title>
    <style>
        footer {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-color: #F5F5F5;
            text-align: center;
            bottom: 0;
            width: 100%;
            padding-top: 20px;
            font-size: 13px;
        }

        .request {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .request a,
        .request p {
            text-decoration: none;
            color: black;
            margin: 15px 20px;
            font-weight: bolder;
        }
        footer p{
            margin: 5px;
        }

        footer p:last-child {
            opacity: 80%;
            font-size: 12px;
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <footer>
        <div class="request">
            <a href="extra_rule.jsp">ĐIỀU KHOẢN DỊCH VỤ</a>
            <p>|</p>
            <a href="extra_security.jsp">CHÍNH SÁCH BẢO MẬT</a>
        </div>

        <img src="image/logo.png" alt="">

        <p>Địa chỉ: Tòa nhà Capital Place, số 29 đường Liễu Giai, Phường Ngọc Khánh, Quận Ba Đình, Thành phố
            Hà Nội, Việt Nam. </p>
        <p>Mã số doanh nghiệp: 0106773786 do Sở Kế hoạch & Đầu tư TP Hà Nội cấp lần đầu ngày 10/02/2015</p>
        <p>Quản Lý Nội Dung: Nguyễn Đức Trí - Điện thoại liên hệ: 024 73081221 (ext 4678)</p>
        <p>Số điện thoại liên hệ: 0387689907</p>
        <p>Email: jobsvn@gmail.com</p>

        <p>&copy; 2023 - Bản quyền thuộc về JobsVn</p>
    </footer>
</body>

</html>