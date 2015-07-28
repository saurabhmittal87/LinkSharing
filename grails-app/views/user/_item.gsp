<g:each in="${items}" var="item">
    <div class="row">
        <div class="col-md-2">
            <img src="${resource(dir:"images", file: "${item.topic.user.gender}"+".png") }" width="100px" height="100px" />
        </div>
        <div class="col-md-10" >
            <p style="display: inline;">${item.topic.user.firstName}</p>
            <p style="display: inline;">@${item.topic.user.username}</p>
            <p style="display: inline;">${(Integer)(System.currentTimeMillis() - item.lastUpdated.getTime())/(1000*60)} mins</p>
            <p style="display: inline; float: right"><a href="#">${item.topic.name}</a> </p>
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
                    <a href="#" style="float: right">View Post</a>
                </div>
                <!--col-md-12-->
            </div>
        </div>
    </div>
    <hr id="divider">
</g:each>