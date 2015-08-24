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
<!-- Create Topic Modal-->


    <div class="container">
    <g:render template="/layouts/resourcemodal" model="[type: myResource.urlPath?'createLinkResource':'createDocumentResource']"></g:render>
        <div class="col-md-7">
            <div class="col-md-12">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-body" style="padding: 0px 15px;">
                            <div class="row">
                                <div class="col-md-3">
                                    <img class="userImage" src="${resource(dir:"images", file: myResource.user.username + myResource.user.fileExtention) }" width="75px" height="75px" about="${myResource.user.gender}"/>
                                </div>
                                <div class="col-md-5">
                                    <p>${myResource.topic.user.firstName}<br>
                                        @${myResource.topic.user.username}</p>
                                </div>
                                <div class="col-md-4">
                                    <g:link controller="topic" action="topic" params="${[topicId: myResource.topic.id]}">${myResource.topic.name}</g:link><br>
                                    ${myResource.topic.user.dateCreated}<br>
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
                                        <g:if test="${session.user == myResource.user}">
                                            <g:link style="margin-left: 5px;" controller="resource" action="deleteResource" params="${[resourceId: myResource.id]}">Delete</g:link>
                                            <a href="#" style="margin-left: 5px;"><span data-toggle="modal" data-target="#edit_resource" aria-hidden="true">Edit</span></a>
                                        </g:if>
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
                        <div class="panel-body" style="padding: 0px 15px;">
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
    <script>
        function updateResourcePanel(){

        }
    </script>
</body>
</html>