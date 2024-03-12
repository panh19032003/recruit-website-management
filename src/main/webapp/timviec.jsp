
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <body>
        <%! public String methodA() {
        return methodB();
        }
        %>
        
        <%! public String methodB() {
        return "JAD Final Test";
        }
        %>
        <h2><%= methodA() %></h2>
    </body>
</html>