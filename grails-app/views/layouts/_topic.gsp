<%@ page import="global.MyEnum" %>
<g:each in="${topicList}" var="topic">
    <div class="row" id="topic_${topic.id}">
        <div class="col-md-12" style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: lightgray; margin-top: 10px;">
            <div class="row">
                <div class="col-md-3">
                        <img class="userImage" src="${resource(dir:"images", file: topic.user.username + topic.user.fileExtention) }" width="75px" height="75px" about="${topic.user.gender}"/>
                </div>
                <!--col-md-2-->
                <div class="col-md-9">
                    <g:link controller="topic" action="topic" params="${[topicId: topic.id]}">
                        <div id="topiclink_${topic.id}">
                            ${topic.name}
                        </div>
                    </g:link>
                    <input type="text" id="text_${topic.id}" name="topicName" value="${topic.name}" style="display: none;">

                    <input type="button" id="save_${topic.id}" value="Save" style="display: none;" onclick="updateTopic(${topic.id},getTopicName('text_${topic.id}'),null,null,'updateTopic')">
                    <input type="button" id="cancel_${topic.id}" value="Cancel" style="display: none;" onclick="updateTopicModal(${topic.id})">
                    <input type="text" id="status_${topic.id}" value="hidden" style="display: none;">
                    <div class="row">
                        <div class="col-md-5">
                            <p>${topic.user.username}<br>
                                <div id="subscribe_${topic.id}">
                                    <g:if test="${session.user && topic.user != session.user}">
                                        <g:if test="${topic.isSubscribed}">
                                            <g:link controller="user" action="subscriptionManager" params="${[topicId:topic.id, actionstatus:global.MyEnum.SubscriptionStatus.Unsubscribe]}">
                                                Unsubscribe
                                            </g:link>
                                        </g:if>
                                        <g:else>
                                            <g:link controller="user" action="subscriptionManager" params="${[topicId:topic.id, actionstatus: global.MyEnum.SubscriptionStatus.Subscribe]}">
                                                Subscribe
                                            </g:link>
                                        </g:else>
                                    </g:if>
                                </div>
                            </p>
                        </div>
                        <div class="col-md-4">
                            <p>Subscriptions<br>${topic.subscriptionCount}</p>
                        </div>
                        <div class="col-md-3">
                            <p>Posts<br>${topic.resourceCount}</p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <g:if test="${topic.isSubscribed}">
                        <div class="row">
                            <div class="col-md-12" style="padding: 2px">
                                <g:if test="${topic.user == session.user}">
                                    <g:select name="privacy" from="${global.MyEnum.Visibility}" value="${topic.visibility}" onchange="updateTopic(${topic.id},null,this.value,null,null)">
                                    </g:select>
                                </g:if>
                                <g:select name="seriousness" from="${global.MyEnum.Seriousness}" value="${topic.seriousness}" onchange="updateTopic(${topic.id},null,null,this.value,null)">
                                </g:select>

                                <span onclick="updateModal('${type}_${topic.id}')" title="Send Invitation" data-id="saurabh" data-toggle="modal" data-target="#send_invitation" class="glyphicon glyphicon-envelope" aria-hidden="true" style="font-size: 20px; float: right; margin: 0px 2px;"></span>

                                <g:if test="${topic.user == session.user}">
                                        <i class="fa fa-pencil-square-o" style="font-size: 22px; float: right; margin: 0px 2px;" onclick="updateTopicModal(${topic.id})"></i>
                                    <g:link title="Delete" controller="user" action="deleteTopic" params="${[topicid:topic.id]}">
                                        <i class="fa fa-trash" style="font-size: 20px; float: right; margin: 0px 2px;"></i>
                                    </g:link>
                                </g:if>

                                <div id="${type}_${topic.id}" style="display: none">
                                    <input type="text" name="topicId" value="${topic.id}" style="display: none"/>
                                    <label>${topic.name}</label>
                                </div>
                            </div>
                            <!--col-md-12-->
                        </div>
                        <!--row-->
                        <div class="clearfix"></div>
                    </g:if>
                </div>
                <!--col-md-10-->
            </div>
            <!--row-->

        </div>
        <!--col-md-12-->
    </div>
    <!--row-->
    <div class="clearfix"></div>
    %{--<hr>--}%
</g:each>
<div class="paginateButtons">
    <util:remotePaginate controller="topic" action="${actionname}" total="${topicCount}" update="trendingtopicdiv" max="${maxCount}" next="Next" prev="Previous" params="${[type:type, actionname:actionname,maxCount:maxCount]}"/>
</div>