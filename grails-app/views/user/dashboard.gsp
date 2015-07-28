<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <g:javascript src="bootstrap.min.js"></g:javascript>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--webfonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text.css'/>
    <!--//webfonts-->
</head>
<body>
    <div class="container">
        <div class="col-md-12" style="background-color: white">
            <a href="/LinkSharing/user/login"><img src="${resource(dir:"images", file: "logo.png") }"/></a>

            <div class="dropdown" style="float:right; margin:7px 10px 0px 0px">
                <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Hi Saurabh
                    <span class="caret"></span></button>
                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">HTML</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">CSS</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">JavaScript</a></li>
                    <li role="presentation" class="divider"></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">About Us</a></li>
                </ul>
            </div>
        </div>
        <!--col-md-12-->
        <div class="col-md-5">
            <div class="row">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">User Info</div>
                        <div class="panel-body">
                            <g:render template="userinfo" model="user:${user}" />
                        </div>
                    </div>
                </div>
            </div>
            <!--row-->
            <div class="clearfix"></div>
            <div class="row">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <p style="display:inline">Subscriptions</p>
                            <p style="display:inline; float:right;
                            "><a href="#">View All</a></p>
                        </div>
                        <div class="panel-body">
                            <g:render template="topic" model="${recentSubscriptions}"/>
                        </div>
                    </div>
                </div>
                <!--panel-group-->
            </div>
            <!--row-->
            <div class="clearfix"></div>
            <div class="row">
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <p style="display:inline">Trending Topics</p>
                            <p style="display:inline; float:right;
                            "><a href="#">View All</a></p>
                        </div>
                        <div class="panel-body">
                            <g:render template="topic" model="${trendingTopics}"/>
                        </div>
                    </div>
                </div>
                <!--panel-group-->
            </div>
            <!--row-->
        </div>
        <!--col-md-5-->
        <div class="col-md-7">

        </div>
        <!--col-md-7-->

    </div>
    <!--container--<
</body>
</html>