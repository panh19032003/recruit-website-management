<%-- 
    Document   : Home_nologin
    Created on : Oct 30, 2023, 8:16:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <style>


        </style>
    </head>
    <body>
        <div>
            <div>
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
            </div>

            <div style="overflow: hidden">
                <img src="image/banner1.png" class="" style="margin-top: 90px; background: #1bae4c;"/>
            </div>

        </div>


        <div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
