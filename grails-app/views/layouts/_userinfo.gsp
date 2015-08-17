    <div class="row">
        <div class="col-md-4">
            <g:if test="${user.username + user.fileExtention}">
                <g:link controller="user" action="profile"><img src="${resource(dir:"images", file: user.username + user.fileExtention) }" width="100px" height="100px" /></g:link>
            </g:if>
            <g:else>
                <img src="${resource(dir:"images", file: user.gender.toString() + ".png") }" width="100px" height="100px" />
            </g:else>

        </div>
        <div class="col-md-8">
            <p>${user.firstName}<br>@${user.username}</p>
            <div class="row">
                <div class="col-md-6">
                    <p>Subscriptions<br>${user.totalSubscriptions}</p>
                </div>
                <div class="col-md-6">
                    <p>Topics<br>${user.totalTopics}</p>
                </div>
            </div>

        </div>
    </div>
    <!--row-->