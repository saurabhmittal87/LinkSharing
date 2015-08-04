<g:each in="${resourceList}" var="theResource">
    <div class="col-md-2">
        <g:if test="${theResource.user.username + theResource.user.fileExtention}">
            <img src="${resource(dir:"images", file: theResource.user.username + theResource.user.fileExtention) }" width="50px" height="50px" />
        </g:if>
        <g:else>
            <img src="${resource(dir:"images", file: "${theResource.user.gender}"+".png") }" width="50px" height="50px" />
        </g:else>
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
            <g:link style="float: right; margin-left: 10px;" controller="resource" action="index" params="${[id: theResource.id]}">View Post</g:link>
            <a href="#" style="float: right; margin-left: 10px;">Mark As Read</a>
            <g:if test="${theResource.urlPath}">
                <a href="${theResource.urlPath}" style="float: right; margin-left: 10px;" target="_blank">View Full Site</a>
            </g:if>
            <g:else>
                <a href="${resource(dir:"file", file: "AME to DLI.pdf") }" style="float: right; margin-left: 10px;"  target="_blank">Download</a>
            </g:else>


        </div>
    </div>
</g:each>
