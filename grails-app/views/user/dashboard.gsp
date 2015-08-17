<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Dashboard</title>
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

    <script type="application/javascript">
        function updateModal(newID)
        {
            if(newID == 'header')
                    document.getElementById('topicInvitation').innerHTML = document.getElementById('idselector').innerHTML
            else
                    document.getElementById('topicInvitation').innerHTML = document.getElementById(newID).innerHTML
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
                                <g:if test="${session.user}">
                                    <g:render template="/layouts/userinfo" model="user:${session.user}" />
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
                                <p style="display:inline; float:right;
                                "><a href="#">View All</a></p>
                            </div>
                            <div class="panel-body" id="">
                                    <div id="subscriptiontab">
                                        <g:render template="/layouts/topic" model="${[topicList:topicList, user:user, type:'delete',topicCount: topicList.size()]}" />
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
                            <div class="panel-body">
                                <div id="trendingtopicdiv">
                                    <g:render template="/layouts/topic" model="${[topicList:trendingTopics, user:user, type:'normal', topicCount: trendingTopics.size()]}" />
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
                                <p style="display:inline; float:right;
                                "><a href="#">View All</a></p>
                            </div>
                            <div class="panel-body">
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
<script>
    function updateTopic(topicId, topicName,visibility, seriousness)
    {
        alert("Hello")
        <g:remoteFunction controller="topic" action="updateTopic" params="'topicId=' +topicId + '&name=' + topicName + '&visibility=' + visibility + '&seriousness=' +seriousness"></g:remoteFunction>
        alert("Done")
    }
</script>

</body>

</html>