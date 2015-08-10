<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login Or Register</title>
    <meta name="layout" content="main" />
</head>
<body>

    <div class="container">
        <div class="col-md-5 col-md-offset-1">
            <div class="col-md-12">
                <div class="row">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <g:if test="${user}">
                                    <g:render template="/layouts/userinfo" model="user:${user}" />
                                </g:if>
                                <g:elseif test="${userList}">
                                    <g:each in="${userList}" var="user">
                                        <g:render template="/layouts/userinfo" model="user:${user}" />
                                    </g:each>
                                </g:elseif>

                            </div>
                        </div>
                    </div>
                </div>
                <!--row-->

                <div class="row">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <p>Topics</p>
                            </div>
                            <div class="panel-body">
                                <g:render template="/layouts/topic" model="${[topicList:topicList, user:user ]}" />
                            </div>
                        </div>
                    </div>
                    <!--panel-group-->
                </div>
                <!--row-->
            </div>
        </div>
        <div class="col-md-5">
            <div class="col-md-12">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">Profile</div>
                        <div class="panel-body">
                            <g:form action="authenticatelogin" method="post" >
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>First Name*</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="firstName" placeholder="First Name" value="${user.firstName}" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Last Name*</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="lastName" placeholder="LastName" value="${user.lastName}" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>User Name*</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="username" placeholder="username" value="${user.username}" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Image</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="file" name="image"/>
                                    </div>
                                </div>
                                <input class="save center-block" type="submit" value="Register" />
                            </g:form>
                        </div>
                    </div>
                </div>

                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">Change Password</div>
                        <div class="panel-body">
                            <g:form action="authenticatelogin" method="post" >
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Password*</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="password" name="password" placeholder="Password" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Last Name*</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="password" name="cpassword"  placeholder="Confirm Password" required/>
                                    </div>
                                </div>
                                <input class="save center-block" type="submit" value="Register" style="margin:auto" />
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>