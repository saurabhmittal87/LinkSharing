<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <link href="${resource([dir: 'css', file: '404.css'])}" rel="stylesheet" type="text/css" media="all">
    <meta name="layout" content="main">
</head>
<body>
    <div class="content">
        <img src="${resource([dir: 'images', file: 'error-img.png'])}" title="error">
        <p><span><label>O</label>hh.....</span>You Requested the page that is no longer There.</p>
        <g:link controller="user" action="dashboard">Back To Home</g:link>
    </div>
</body>
</html>