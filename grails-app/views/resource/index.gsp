<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login Or Register</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-stars.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'fontawesome-stars.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
    <g:javascript src="jquery.barrating.min.js"></g:javascript>
    %{--<g:javascript src="jquery.js"></g:javascript>--}%
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
                                    <g:link controller="topic" action="topic" params="${[topicId: myResource.topic.id]}">${myResource.topic.name}</g:link><br>
                                    ${myResource.topic.user.dateCreated}<br>

                                    <div class="stars stars-example-bootstrap">

                                        <div class="br-wrapper br-theme-bootstrap-stars"><select id="example-bootstrap" name="rating" style="display: none;">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>

                                            <div class="br-widget">
                                                <a href="#" data-rating-value="1" data-rating-text="1" class="br-selected br-current"><span></span></a>
                                                <a href="#" data-rating-value="2" data-rating-text="2" class=""><span></span></a>
                                                <a href="#" data-rating-value="3" data-rating-text="3" class=""><span></span></a>
                                                <a href="#" data-rating-value="4" data-rating-text="4" class=""><span></span></a>
                                                <a href="#" data-rating-value="5" data-rating-text="5" class=""><span></span></a>
                                            </div>
                                        </div>
                                    </div>
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
                                        <g:link style="margin-left: 5px;" controller="resource" action="deleteResource" params="${[resourceId: myResource.id]}">Delete</g:link>
                                        <a href="#" style="margin-left: 5px;">Edit</a>
                                        <g:if test="${myResource.urlPath}">
                                            <a href="${myResource.urlPath}" style="margin-left: 5px;" target="_blank">View Full Site</a>
                                        </g:if>
                                        <g:else>
                                            <a href="${resource(dir:"file", file: myResource.file) }" style="margin-left: 5px;"  target="_blank">Download</a>
                                        </g:else>
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
                            <div id="trendingtopicdiv">
                                <g:render template="/layouts/topic" model="${[topicList:trendingTopics, type:'null',topicCount: topicCount,actionname:'trendingTopicsList',maxCount:global.GlobalContent.sideBarItemLimit]}" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--container-->

</body>
</html>