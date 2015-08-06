<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Dashboard</title>
    <meta name="layout" content="main" />

    <script>
        function updateSubscriptionTags(reference)
        {
            alert(document.getElementById(reference));
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="col-md-5">
            <div class="col-md-12">
                <div class="row">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">User Info</div>
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
                <div class="clearfix"></div>
                <div class="row">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <p style="display:inline">Subscriptions</p>
                                <p style="display:inline; float:right;
                                "><a href="#">View All</a></p>
                            </div>
                            <div class="panel-body">
                                <g:render template="/layouts/topic" model="${[postList:topicList, user:user ]}" />
                            </div>
                        </div>
                    </div>
                    <!--panel-group-->
                </div>
                <!--row-->
                <div class="clearfix"></div>
                <div class="row">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <p style="display:inline">Trending Topics</p>
                                <p style="display:inline; float:right;"><a href="#">View All</a></p>
                            </div>
                            <div class="panel-body">
                                <g:render template="/layouts/topic" collection="${trendingTopics}" var="postList" />
                            </div>
                        </div>
                    </div>
                    <!--panel-group-->
                </div>
                <!--row-->
                <div class="clearfix"></div>
            </div>
            <!--col-md-12-->
        </div>
        <!--col-md-5-->
        <div class="col-md-7">
            <div class="col-md-12">
                <div class="row">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <p style="display:inline">Inbox</p>
                                <p style="display:inline; float:right;
                                "><a href="#">View All</a></p>
                            </div>
                            <div class="panel-body">
                                <g:render template="/layouts/resource" collection="${resourceList}" var="resourceList" />
                            </div>
                        </div>
                    </div>
                    <!--panel-group-->
                </div>
                <!--row-->
            </div>
            <!--col-md-12-->
            <div class="clearfix"></div>
        </div>
        <!--col-md-7-->

    </div>
    <!--container--<
</body>
</html>