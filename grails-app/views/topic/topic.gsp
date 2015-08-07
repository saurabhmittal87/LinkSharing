<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login Or Register</title>
    <meta name="layout" content="main" />
</head>
<body>
<div class="container">
    <div class="clearfix"></div>
    <div class="col-md-5">
        <div class="col-md-12">
            <div class="row">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">Topic</div>
                        <div class="panel-body">
                            <g:render template="/layouts/topic" collection="${topicList}" var="postList" />
                        </div>
                    </div>
                </div>
            </div>
            <!--row-->
            <div class="clearfix"></div>
            <div class="row">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">Users</div>
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
        </div>
        <!--col-md-12-->
    </div>
    <!--col-md-4-->
    <div class="col-md-7">
        <div class="col-md-12">
            <div class="row">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">Posts</div>
                        <div class="panel-body">
                            <g:render template="/layouts/resource" collection="${resourceList}" var="resourceList" />
                        </div>
                    </div>
                </div>
            </div>
            <!--row-->
        </div>
    </div>
    <!--col-md-8-->

</div>
<!--container-->
</body>
</html>