<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div style="text-align: center">
    <div class="container">
        <div class="col-md-12">
            <div class="row">
                <h2>Welcome To Linksharing</h2>
            </div>
            <div class="row">
                <p>${username} have invited you to view the topic ${topicName}. Choose any of the following actions</p>
            </div>
            <div class="row">
                <g:link controller="invitation" action="handleInvitation" params="${[email:email,topicId: topicId, actiontype:'accepted']}" base="${base}"><button type="button" class="btn btn-success">Accept</button></g:link>
                <g:link controller="topic" action="topic" params="${[topicId: topicId, email: email]}" base="${base}"><button type="button" class="btn btn-info">View Topic</button></g:link>
                <g:link controller="invitation" action="handleInvitation" params="${[email:email,topicId: topicId, actiontype:'rejected']}" base="${base}"><button type="button" class="btn btn-danger">Reject</button></g:link>
            </div>
        </div>
    </div>
</div>
</body>
</html>