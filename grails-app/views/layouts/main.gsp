<!DOCTYPE html>
	<head>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<g:javascript src="bootstrap.min.js"></g:javascript>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		%{--<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text.css'/>--}%


	<g:layoutHead/>
	</head>
	<body>
	<div class="container">
		<div class="col-md-12" style="background-color: white">
			<a href="/LinkSharing/user/dashboard"><img src="${resource(dir:"images", file: "logo.png") }"/></a>
			<g:if test="${session.user}">
				<div class="menuicons"  style="float:right; margin: 40px 20px 0 0;">
					<span title="Create Topic" data-toggle="modal" data-target="#create_topic" class="glyphicon glyphicon-comment" aria-hidden="true" style="font-size: 20px; display: inline; margin-left: 10px;"></span>
					<span title="Send Invitation" onclick="updateModal('header')" data-toggle="modal" data-target="#send_invitation" class="glyphicon glyphicon-envelope" aria-hidden="true" style="font-size: 20px; display: inline; margin-left: 10px;"></span>
					<span id="link" title="Create Link Resource" data-toggle="modal" data-target="#create_link_resource" class="glyphicon glyphicon-paperclip" aria-hidden="true" style="font-size: 20px; display: inline; margin-left: 10px;"></span>
					<span id="document" title="Create Document Resource" data-toggle="modal" data-target="#create_document_resource" class="glyphicon glyphicon-plus-sign" aria-hidden="true" style="font-size: 20px; display: inline; margin-left: 10px;"></span>

					<div class="dropdown" style=" display: inline; margin-left: 30px;">
						<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Hi ${session.user.firstName}
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu dropdown-menu-right" role="menu">
							<li role="presentation">
								<g:link controller="user" action="profile">
									Profile
								</g:link>
							</li>
							<g:if test="${session.user.admin}">
								<li role="presentation">
									<g:link controller="user" action="users">
										Users
									</g:link>
								</li>
								<li role="presentation">
									<g:link controller="topic" action="topics">
										Topics
									</g:link>
								</li>
							</g:if>
							<li role="presentation"><a href="#">Posts</a></li>
							<li role="presentation">
								<g:link controller="user" action="logout">
									Logout
								</g:link>
							</li>
						</ul>
					</div>
				</div>
			</g:if>
			<!-- Create Topic Modal-->
			<g:render template="/layouts/createtopicmodal"></g:render>

			<!-- Send Invitation Modal-->
			<g:render template="/layouts/topicInvitation" model="${[topicList:topicList]}"></g:render>

			%{--<!-- Send Invitation Modal-->--}%
			%{--<g:render template="/layouts/topicInvitation" model="${[topicList:topicList]}"></g:render>--}%

		<!-- Create Link Resource Modal-->
			<g:render template="/layouts/createlinkresource" model="${[topicList:topicList]}" ></g:render>

			<!-- Create Document Resource Modal-->
			<g:render template="/layouts/createdocumentresource" model="${[topicList:topicList]}" ></g:render>


		</div>
		<!--col-md-12-->
	</div>
	<!--container-->


	<g:if test="session.user">
		${linksharing.UserController.updateUserStats()}
	</g:if>

	<g:layoutBody/>

	</body>
</html>
