<g:each in="${items}" var="item">
    <div class="row">
        <div class="col-md-2">
            <g:if test="${item.topic.user.username + item.topic.user.fileExtention}">
                <g:link style="float: right" controller="user" action="index" params="${[id: item.topic.user.id]}"><img src="${resource(dir:"images", file: item.topic.user.username + item.topic.user.fileExtention) }" width="50px" height="50px" /></g:link>
            </g:if>
            <g:else>
                <img src="${resource(dir:"images", file: "${item.topic.user.gender}"+".png" ) }" width="50px" height="50px" />
            </g:else>
        </div>
        <div class="col-md-10" >
            <p style="display: inline;">${item.topic.user.firstName}</p>
            <p style="display: inline;">@${item.topic.user.username}</p>
            <p style="display: inline;">${(Integer)(System.currentTimeMillis() - item.lastUpdated.getTime())/(1000*60)} mins</p>
            <p style="display: inline; float: right">
                <g:link controller="topic" action="topic" params="${[topicId: item.topic.id]}">${item.topic.name}</g:link><br>
                <a href="#"></a> </p>
            <div class="row">
                <div class="col-md-12" >
                    <p>${item.description}</p>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-12" >
                    <a href="#"><i class="fa fa-facebook-square"></i></a>
                    <a href="#"><i class="fa fa-google-plus-square"></i></a>
                    <a href="#"><i class="fa fa-twitter-square"></i></a>
                    <g:link style="float: right" controller="resource" action="index" params="${[id: item.id]}">View Post</g:link>
                </div>
                <!--col-md-12-->
            </div>
        </div>
    </div>
</g:each>