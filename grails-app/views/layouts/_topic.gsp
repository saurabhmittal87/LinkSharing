<%@ page import="global.MyEnum" %>
<g:each in="${topicList}" var="post">
    <div class="row" id="post_${post.id}">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-2">
                    <g:if test="${post.user.username + post.user.fileExtention}">
                        <img src="${resource(dir:"images", file: post.user.username + post.user.fileExtention) }" width="50px" height="50px" />
                    </g:if>
                    <g:else>
                        <img src="${resource(dir:"images", file: "${post.user.gender}"+".png") }" width="50px" height="50px" />
                    </g:else>
                </div>
                <!--col-md-2-->
                <div class="col-md-10">
                    <g:link controller="topic" action="topic" params="${[topicId: post.id]}">${post.name}</g:link>
                    <div class="row">
                        <div class="col-md-5">
                            <p>${post.user.username}<br>
                                <div id="subscribe_${post.id}">
                                    <g:if test="${post.isSubscribed}">
                                        <g:link controller="user" action="subscriptionManager" params="${[topicId:post.id, actionstatus:global.MyEnum.SubscriptionStatus.Unsubscribe]}">
                                                Unsubscribe
                                        </g:link>
                                    </g:if>
                                    <g:else>
                                        <g:link controller="user" action="subscriptionManager" params="${[topicId:post.id, actionstatus: global.MyEnum.SubscriptionStatus.Subscribe]}">
                                            Subscribe
                                        </g:link>
                                    </g:else>
                                </div>
                            </p>
                        </div>
                        <div class="col-md-4">
                            <p>Subscriptions<br>${post.subscriptionCount}</p>
                        </div>
                        <div class="col-md-3">
                            <p>Posts<br>${post.resourceCount}</p>
                        </div>
                    </div>
                </div>
                <!--col-md-10-->
            </div>
            <!--row-->
            <g:if test="${post.isSubscribed}">
                <div class="row">
                    <div class="col-md-12" style="padding: 2px">
                        <g:if test="${post.user == session.user}">
                            <g:select name="privacy" from="${global.MyEnum.Visibility}" value="${post.visibility}" onchange="updateTopic(${post.id},'${post.name}',this.value,null)">
                            </g:select>
                        </g:if>
                        <g:select name="seriousness" from="${global.MyEnum.Seriousness}" value="${post.seriousness}" onchange="updateTopic(${post.id},'${post.name}',null,this.value)">
                        </g:select>

                        <span onclick="updateModal('${type}_${post.id}')" title="Send Invitation" data-id="saurabh" data-toggle="modal" data-target="#send_invitation" class="glyphicon glyphicon-envelope" aria-hidden="true" style="font-size: 20px; float: right; margin: 0px 2px;"></span>

                        <g:if test="${post.user == session.user}">
                            <g:link title="Edit" controller="topic" action="topic" params="${[id: post.id]}">
                                <i class="fa fa-pencil-square-o" style="font-size: 22px; float: right; margin: 0px 2px;"></i>
                            </g:link>
                            <g:link title="Delete" controller="user" action="deleteTopic" params="${[topicid:post.id]}">
                                <i class="fa fa-trash" style="font-size: 20px; float: right; margin: 0px 2px;"></i>
                            </g:link>
                        </g:if>
                    </div>
                    <!--col-md-12-->
                </div>
                <!--row-->
                <div class="clearfix"></div>
            </g:if>
            <div id="${type}_${post.id}" style="display: none">
                <input type="text" name="topicId" value="${post.id}" style="display: none"/>
                <label>${post.name}</label>
            </div>
        </div>
        <!--col-md-12-->
    </div>
    <!--row-->
    <div class="clearfix"></div>

</g:each>
<div class="paginateButtons">
    <util:remotePaginate controller="topic" action="trendingTopicsList" total="${topicCount}" update="trendingtopicdiv" max="${global.GlobalContent.sideBarItemLimit}" next="Next" prev="Previous" params="${[type:type]}"/>
</div>