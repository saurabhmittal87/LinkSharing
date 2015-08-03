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