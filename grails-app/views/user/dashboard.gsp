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
            <div class="menuicons"  style="float:right; margin: 40px 20px 0 0;">
                <span title="Create Topic" data-toggle="modal" data-target="#create_topic" class="glyphicon glyphicon-comment" aria-hidden="true" style="font-size: 20px; display: inline; margin-left: 10px;"></span>
                <span title="Send Invitation" data-toggle="modal" data-target="#send_invitation" class="glyphicon glyphicon-envelope" aria-hidden="true" style="font-size: 20px; display: inline; margin-left: 10px;"></span>
                <span title="Create Link Resource" data-toggle="modal" data-target="#create_link_resource" class="glyphicon glyphicon-paperclip" aria-hidden="true" style="font-size: 20px; display: inline; margin-left: 10px;"></span>
                <span title="Create Document Resource" data-toggle="modal" data-target="#create_document_resource" class="glyphicon glyphicon-plus-sign" aria-hidden="true" style="font-size: 20px; display: inline; margin-left: 10px;"></span>

                <div class="dropdown" style=" display: inline; margin-left: 30px;">
                    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Hi Saurabh
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="profile">Profile</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Users</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Topics</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Posts</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Logout</a></li>
                    </ul>
                </div>
            </div>

            <!-- Create Topic Modal-->
            <g:render template="/layouts/createtopicmodal"></g:render>

            <!-- Send Invitation Modal-->
            <div class="modal fade" id="send_invitation" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">Create Topic</div>
                            <div class="panel-body">
                                <p>sssssssssssssssssssss</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Create Link Resource Modal-->
            <g:render template="/layouts/createlinkresource"></g:render>

            <!-- Create Document Resource Modal-->
            <div class="modal fade" id="create_document_resource" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">Create Topic</div>
                            <div class="panel-body">
                                <p>sssssssssssssssssssss</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!--col-md-12-->
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