<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <g:javascript src="bootstrap.min.js"></g:javascript>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--webfonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text.css'/>
    <!--//webfonts-->
</head>
<body>

    <div class="container">
        <div class="col-md-12" style="background-color: white">
            <a href="/LinkSharing/user/login"><img src="${resource(dir:"images", file: "logo.png") }"/></a>

            <div class="dropdown" style="float:right; margin:7px 10px 0px 0px">
                <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Hi Saurabh
                    <span class="caret"></span></button>
                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Profile</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Users</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Topics</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Posts</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Logout</a></li>
                </ul>
            </div>
        </div>
        <!--col-md-12-->
        <div class="clearfix"></div>
        <div class="col-md-5">
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
                                <g:render template="/layouts/topic" model="${[postList:topicList, user:user ]}" />
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
                                    <div class="col-md-6">
                                        <label>First Name*</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="firstName" placeholder="First Name" value="${user.firstName}" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Last Name*</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="lastName" placeholder="LastName" value="${user.lastName}" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>User Name*</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="username" placeholder="username" value="${user.username}" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
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
                                    <div class="col-md-6">
                                        <label>Password*</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="password" name="password" placeholder="Password" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
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