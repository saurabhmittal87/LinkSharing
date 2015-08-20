<%--
  Created by IntelliJ IDEA.
  User: saurabh
  Date: 20/8/15
  Time: 5:18 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Resources Page</title>
    <meta name="layout" content="main" />
</head>

<body>
    <div class="container" style="margin-top: 20px;">
        <div class="row">
            <div class="col-md-12">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <p style="display:inline">Inbox</p>
                            </div>
                            <div class="panel-body" style="padding: 0px 15px;">
                                <div id="resourcetab">
                                    <g:render template="/layouts/resource" model="${[resourceList: resourceList,resourceCount:resourceCount]}" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--panel-group-->
            </div>
            <!--col-md-12-->

        </div>
    </div>
</body>
</html>