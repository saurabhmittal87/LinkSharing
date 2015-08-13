<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login Or Register</title>
    <meta name="layout" content="main" />
</head>
<body>
<div class="container">
    <div class="col-md-12">
        <g:if test="${invitationStatus}">
            <p style="text-align: center">You have a pending invitation for the topic. Choose between
            <g:link controller="invitation" action="accepted" params="${[email:session.user.email,topicId: topicList.get(0).id]}" base="http://localhost:8080/LinkSharing">Approve</g:link>
            and
                <g:link controller="invitation" action="rejected" params="${[email:session.user.email,topicId: topicList.get(0).id]}" base="http://localhost:8080/LinkSharing">Reject.</g:link>
            </p>
        </g:if>
    </div>
    <div class="clearfix"></div>
    <div class="col-md-5">
        <div class="col-md-12">
            <div class="row">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">Topic</div>
                        <div class="panel-body">
                            <g:if test="${topicList}">
                                <g:each in="${topicList}" var="topic">
                                    <g:render template="/layouts/topic" collection="${topic}" var="topic" />
                                </g:each>
                            </g:if>

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
                                <g:each in="${userList}" var="theUser">
                                    <g:render template="/layouts/userinfo" model="${[user: theUser]}" />
                                </g:each>
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