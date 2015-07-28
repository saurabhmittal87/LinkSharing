<div class="row">
    <div class="col-md-3">
        <img src="${resource(dir:"images", file: user.gender.toString() + ".png") }" width="100px" height="100px" />
    </div>
    <div class="col-md-9">
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