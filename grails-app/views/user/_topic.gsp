<g:each in="${postList}" var="post">
<div class="row">
    <div class="col-md-2">
        <img src="${resource(dir:"images", file: "${post.user.gender}"+".png") }" width="50px" height="50px" />
    </div>
    <!--col-md-2-->
    <div class="col-md-10">
        <a href="#">${post.name}</a>
        <div class="row">
            <div class="col-md-5">
                <p>${post.user.username}<br><a href="#">Unsubscribe</a></p>
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
<div class="row">
    <div class="col-md-12" style="padding: 2px">
        <select>
            <option value="volvo">Volvo</option>
            <option value="saab">Saab</option>
            <option value="mercedes">Mercedes</option>
            <option value="audi">Audi</option>
        </select>
        <select>
            <option value="volvo">Volvo</option>
            <option value="saab">Saab</option>
            <option value="mercedes">Mercedes</option>
            <option value="audi">Audi</option>
        </select>

        <i class="fa fa-envelope" style="font-size: 22px; float: right; margin: 0px 2px;"></i>
        <i class="fa fa-pencil-square-o" style="font-size: 22px; float: right; margin: 0px 2px;"></i>
        <i class="fa fa-trash" style="font-size: 20px; float: right; margin: 0px 2px;"></i>
    </div>
    <!--col-md-12-->
</div>
<!--row-->
</g:each>