<%@ page import="global.GlobalContent" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'commonstyle.css')}">
    <meta name="layout" content="main" />

    %{--<script>--}%
        %{--function updateSubscriptionTags(action, parent, current, keyword)--}%
        %{--{--}%
            %{--if(action == "delete")--}%
                %{--{--}%
                    %{--document.getElementById(parent).innerHTML =""--}%
                %{--}--}%

            %{--var key,replacement--}%
            %{--if(keyword == 'Unsubscribe')--}%
            %{--{--}%
                %{--key = 'Unsubscribe'--}%
                %{--replacement = 'Subscribe'--}%
            %{--}--}%
            %{--else if(keyword == 'Subscribe')--}%
            %{--{--}%
                %{--key = 'Subscribe'--}%
                %{--replacement = 'Unsubscribe'--}%
            %{--}--}%
            %{--var slides = document.getElementsByClassName(current)--}%
            %{--for(var i = 0; i < slides.length; i++){--}%
                %{--var test = slides[i].innerHTML--}%
                %{--var re = new RegExp(key, 'g');--}%
                %{--test = test.replace(re, replacement);--}%
                %{--slides[i].innerHTML = test--}%
            %{--}--}%
                %{--if(keyword == 'Subscribe' && action == 'normal')--}%
                %{--{--}%
                    %{--var newhtml = document.getElementById('subscriptiontab').innerHTML--}%
                    %{--newhtml = newhtml + document.getElementById(parent).innerHTML--}%
                    %{--document.getElementById('subscriptiontab').innerHTML = newhtml--}%
                %{--}--}%
        %{--}--}%
    %{--</script>--}%
</head>
<body>
    <p style="text-align: center">${flash.message}</p>
    <div class="container">
        <div class="col-md-5">
            <div class="col-md-12">
                <div class="row">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">User Info</div>
                            <div class="panel-body" style="padding: 0px 15px;">
                                <g:if test="${user}">
                                    <g:render template="/layouts/userinfo" />
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
                            <div class="panel-heading">
                                <p style="display:inline">Subscriptions</p>
                                <p style="display:inline; float:right;">
                                    <g:link controller="topic" action="topics">
                                        View All
                                    </g:link>
                                </p>
                            </div>
                            <div class="panel-body" style="padding: 0px 15px;">
                                    <div id="subscriptiontab">
                                        <g:render template="/layouts/topic" model="${[topicList:topicList, type:'delete',topicCount: topicList.size(),actionname:'null',maxCount:global.GlobalContent.sideBarItemLimit]}" />
                                    </div>
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
                            <div class="panel-heading" >
                                <p style="display:inline">Trending Topics</p>
                                <p style="display:inline; float:right;"><a href="#">View All</a></p>
                            </div>
                            <div class="panel-body" style="padding: 0px 15px;">
                                <div id="trendingtopicdiv">
                                    <g:render template="/layouts/topic" model="${[topicList:trendingTopics, user:user, type:'normal', topicCount: trendingTopics.size(),actionname:'null',maxCount:global.GlobalContent.sideBarItemLimit]}" />
                                </div>
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
                                <p style="display:inline; float:right;">
                                    <g:link controller="resource" action="posts">View All</g:link>
                                </p>
                            </div>
                            <div class="panel-body" style="padding: 0px 15px;">
                                <div id="resourcetab">
                                    <g:render template="/layouts/resource" model="${[resourceList: resourceList,resourceCount:resourceCount]}" />
                                </div>
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
    <!--container-->
    <div id="idselector"  style="display:none;">
    <g:select  name="topicId" from="${topicList}" optionValue="name" optionKey="id"  />
    </div>


<script type="application/javascript">
    function updateModal(newID)
    {
        if(newID == 'header')
            document.getElementById('topicInvitation').innerHTML = document.getElementById('idselector').innerHTML
        else
            document.getElementById('topicInvitation').innerHTML = document.getElementById(newID).innerHTML
    }


    function updateTopicModal(topicId){
        var currentStatus = document.getElementById('status_'+topicId).value
        if(currentStatus == 'hidden')
        {
            document.getElementById('text_' + topicId).style.display = 'inline'
            document.getElementById('save_' + topicId).style.display = 'inline'
            document.getElementById('cancel_' + topicId).style.display = 'inline'
            document.getElementById('topiclink_' + topicId).style.display = 'none'
            document.getElementById('status_'+topicId).value = "visible"
        }
        else if(currentStatus == 'visible')
        {
            document.getElementById('text_' + topicId).style.display = 'none'
            document.getElementById('save_' + topicId).style.display = 'none'
            document.getElementById('cancel_' + topicId).style.display = 'none'
            document.getElementById('topiclink_' + topicId).style.display = 'inline'
            document.getElementById('status_'+topicId).value = "hidden"
        }
    }

    function updateTopic(topicId, topicName,visibility, seriousness, actionType)
    {
        <g:remoteFunction controller="topic" action="updateTopic" params="'topicId=' +topicId + '&name=' + topicName + '&visibility=' + visibility + '&seriousness=' +seriousness"></g:remoteFunction>
        if(actionType == 'updateTopic')
        {
            document.getElementById('topiclink_' + topicId).innerHTML = topicName
            updateTopicModal(topicId)
        }
        alert("Topic updated")
    }

    function getTopicName(topicNameElementId){
        return document.getElementById(topicNameElementId).value
    }
</script>

</body>

</html>