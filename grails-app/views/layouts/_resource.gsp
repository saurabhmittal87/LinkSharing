<%@ page import="global.MyEnum" %>
<div class="resourcetab">
<g:each in="${resourceList}" var="theResource">
    <div class="col-md-12" style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: lightgray; margin-top: 10px;">
        <div class="col-md-2">
            <img class="userImage" src="${resource(dir:"images", file: theResource.user.username + theResource.user.fileExtention) }" width="65px" height="65px" about="${theResource.user.gender}"/>
        </div>
        <div class="col-md-10">
            <div class="row">
                <p style="display: inline">${theResource.user.firstName}</p>
                <p style="display: inline">@${theResource.user.username}</p>
                <p style="display: inline">15 mins</p>
            </div>
            <div class="row">
                <p>${theResource.description}</p>
            </div>
            <div class="row">
                <a href="#"><i class="fa fa-facebook-square"></i></a>
                <a href="#"><i class="fa fa-google-plus-square"></i></a>
                <a href="#"><i class="fa fa-twitter-square"></i></a>
                <g:link style="float: right; margin-left: 10px;" controller="resource" action="resource" params="${[id: theResource.id]}">View Post</g:link>

                <g:if test="${session.user}">
                    <g:if test="${theResource.isRead}">
                        <g:remoteLink controller="resource" action="manageReadingStatus" params="${[theAction:"${global.MyEnum.ReadingResourceAction.Delete}", userId: session.user.id, resourceId: theResource.id]}" style="float: right; margin-left: 10px;" onComplete="alert('Resource marked as unread'); location.reload(true)">Mark As Unread</g:remoteLink>
                    </g:if>
                    <g:else>
                        <g:remoteLink controller="resource" action="manageReadingStatus" params="${[theAction:"${MyEnum.ReadingResourceAction.Add}", userId: session.user.id, resourceId: theResource.id]}" style="float: right; margin-left: 10px;" onComplete="alert('Resource marked as read'); location.reload(true)">Mark As Read</g:remoteLink>
                    </g:else>
                </g:if>
                <g:if test="${theResource.urlPath}">
                    <a href="${theResource.urlPath}" style="float: right; margin-left: 10px;" target="_blank">View Full Site</a>
                </g:if>
                <g:else>
                    <a href="${resource(dir:"file", file: theResource.file) }" style="float: right; margin-left: 10px;"  target="_blank">Download</a>
                </g:else>


            </div>
        </div>
    </div>
</g:each>
<div class="paginateButtons">
    <util:remotePaginate controller="resource" action="getResourcesByUser" total="${resourceCount}" update="resourcetab" max="${global.GlobalContent.mainItemLimit}" next="Next" prev="Previous" />
</div>