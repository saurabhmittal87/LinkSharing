<%--
  Created by IntelliJ IDEA.
  User: saurabh
  Date: 14/8/15
  Time: 11:33 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login Or Register</title>
    <meta name="layout" content="main" />
</head>
<body>
<div class="container">
    <div class="col-md-5">
        <div class="col-md-12">
            <div class="row">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">Topic</div>
                        <div class="panel-body">
                            <div id="trendingtopicdiv">
                                <g:if test="${topicList}">
                                    <g:render template="/layouts/topic" model="${[actionname: 'getTopicList',maxCount:global.GlobalContent.mainItemLimit]}" />
                                </g:if>
                            </div>
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