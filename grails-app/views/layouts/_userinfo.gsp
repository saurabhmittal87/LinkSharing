    <div class="row">
        <div class="col-md-4">
            <g:if test="${user.username + user.fileExtention}">
                <img src="${resource(dir:"images", file: user.username + user.fileExtention) }" width="100px" height="100px" />
            </g:if>
            <g:else>
                <img src="${resource(dir:"images", file: user.gender.toString() + ".png") }" width="100px" height="100px" />
            </g:else>

        </div>
        <div class="col-md-8">
            <p>${user.firstName}<br>@${user.username}</p>
            <div class="row">
                <div class="col-md-6">
                    <p>Subscriptions<br>30</p>
                </div>
                <div class="col-md-6">
                    <p>Topics<br>35</p>
                </div>
            </div>

        </div>
    </div>
    <!--row-->