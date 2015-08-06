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
                <p>Saurabh Mittal 1have invited you to view the topic MYTOPIC. Choose any of the following actions</p>
            </div>
            <div class="row">
                <g:link controller="invitation" action="accepted" params="${[email:email,topicId: topicId]}" base="http://localhost:8080/LinkSharing"><button type="button" class="btn btn-success">Accept</button></g:link>

                <g:link controller="topic" action="topic" params="${[id: topicId]}"><button type="button" class="btn btn-info">View Topic</button></g:link>
                <button type="button" class="btn btn-danger">Reject</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>