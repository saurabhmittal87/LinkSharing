<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login Or Register</title>
    <meta name="layout" content="main" />
</head>
<body>
    <div class="container">
        <div class="col-md-7">
            <div class="col-md-12">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <g:if test="${myResource.topic.user.username + myResource.topic.user.fileExtention}">
                                        <img src="${resource(dir:"images", file: myResource.topic.user.username + myResource.topic.user.fileExtention) }" width="100px" height="100px" />
                                    </g:if>
                                    <g:else>
                                        <img src="${resource(dir:"images", file: "${myResource.topic.user.gender}"+".png") }" width="100px" height="100px" />
                                    </g:else>
                                </div>
                                <div class="col-md-5">
                                    <p>${myResource.topic.user.firstName}<br>
                                        @${myResource.topic.user.username}</p>
                                </div>
                                <div class="col-md-4">
                                    <g:link controller="resource" action="index" params="${[id: myResource.topic.id]}">${myResource.topic.name}</g:link><br>
                                    ${myResource.topic.user.dateCreated}<br>
                                    0000000000
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    ${myResource.description}
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <a href="#"><i class="fa fa-facebook-square"></i></a>
                                    <a href="#"><i class="fa fa-google-plus-square"></i></a>
                                    <a href="#"><i class="fa fa-twitter-square"></i></a>
                                </div>
                                <div class="col-md-9">
                                    <h5 style="float: right;">
                                        <a href="#">Delete</a>
                                        <a href="#" style="margin-left: 5px;">Edit</a>
                                        <a href="#" style="margin-left: 5px;">Download</a>
                                        <a href="#" style="margin-left: 5px;">View Full Site</a>
                                    </h5>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <!--col-md-12-->
        </div>
        <!--col-md-8-->
        <div class="col-md-5">
            <div class="col-md-12">
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
            </div>
        </div>
    </div>
    <!--container-->
</body>
</html>