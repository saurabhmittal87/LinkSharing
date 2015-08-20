<%--
  Created by IntelliJ IDEA.
  User: saurabh
  Date: 20/8/15
  Time: 4:00 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Forgot Password</title>
    <meta name="layout" content="main" />
</head>
<body>
    <div class="container">
        <div class="row">
            <g:if test="${message}">
                <p>${message}</p>
                <p>Click <g:link controller="user" action="login">here</g:link> to go back to login page</p>

            </g:if>
            <g:else>
                <g:form controller="user" action="forgotPassword" method="post">
                    <label>Enter Your Email</label>
                    <input type="text" name="email">
                    <input class="save" type="submit" value="Submit" />
                </g:form>
            </g:else>
        </div>
    </div>
</body>
</html>