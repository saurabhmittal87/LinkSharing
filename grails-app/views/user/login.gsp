<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">--}%
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
	<g:javascript src="bootstrap.min.js"></g:javascript>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!--webfonts-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text.css'/>
	<!--//webfonts-->
</head>

<div class="container">
	<div class="col-md-12">
		<a href="/LinkSharing/user/login"><img src="${resource(dir:"images", file: "logo.png") }"/></a>
	</div>

	<div class="col-md-9">
		<div class="col-md-12">
			<div class="row">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">Recent Shares</div>
						<div class="panel-body">
							<g:each in="${topPosts}" var="post">
								<div class="row">
									<div class="col-md-2">
										<g:if test="${post.topic.user.gender == 'MALE'}">
											<img src="${resource(dir:"images", file: "male.png") }" width="100px" height="100px" />
										</g:if>
										<g:else>
											<img src="${resource(dir:"images", file: "female.png") }" width="100px" height="100px"/>
										</g:else>
									</div>
									<div class="col-md-10" >
										<p style="display: inline;">${post.topic.user.firstName}</p>
										<p style="display: inline;">@${post.topic.user.username}</p>
										<p style="display: inline;">${(Integer)(System.currentTimeMillis() - post.lastUpdated.getTime())/(1000*60)} mins</p>
										<p style="display: inline; float: right"><a href="#">${post.topic.name}</a> </p>
										<div class="row">
											<div class="col-md-12" >
												<p>${post.description}</p>
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
										</div>
									</div>
								</div>
							</g:each>
						</div>
					</div>
				</div>

				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">
							<p style="display: inline">Top posts</p>
							<div style="float: right">
								<select>
									<option value="volvo">Today</option>
									<option value="saab">1 Week</option>
									<option value="mercedes">1 Month</option>
									<option value="audi">1 Year</option>
								</select>
							</div>
						</div>
						<div class="panel-body">
							<g:each in="${topPosts}" var="post">
								<div class="row">
									<div class="col-md-2">
										<g:if test="${post.topic.user.gender == 'MALE'}">
											<img src="${resource(dir:"images", file: "male.png") }" width="100px" height="100px" />
										</g:if>
										<g:else>
											<img src="${resource(dir:"images", file: "female.png") }" width="100px" height="100px"/>
										</g:else>
									</div>
									<div class="col-md-10" >
										<p style="display: inline;">${post.topic.user.firstName}</p>
										<p style="display: inline;">@${post.topic.user.username}</p>
										%{--<p style="display: inline;">${post.dateCreated}</p>--}%
										<g:formatDate format="dd-MM-yyyy" date="${post.dateCreated}"/>
										<p style="display: inline; float: right"><a href="#">${post.topic.name}</a> </p>
										<div class="row">
											<div class="col-md-12" >
												<p>${post.description}</p>
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
										</div>
									</div>
								</div>
								<!--row-->
								<hr>
							</g:each>
						</div>
						<!--panel-body-->
					</div>
				</div>
				<!--panel-group-->
			</div>
			<!--row-->
		</div>
		<!--col-md-12-->
	</div>
	<!--col-md-9-->
	<div class="col-md-3">
		<div class="col-md-12">
			<div class="row">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">Login</div>
						<div class="panel-body">
							<div class="row">
								<g:form action="authenticatelogin" method="post" >
									<input type="text" name="username" placeholder="Username" required/>
									<input type="password" name="password" placeholder="Password" required/>
									<h6><a href="#">I forgot my Password!</a></h6>
									<input class="save" type="submit" value="Login" />
								</g:form>
							</div>
						</div>
					</div>
				</div>

				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">Register</div>
						<div class="panel-body">
							<div class="row">
								<g:form action="authenticatesignup" method="post" enctype="multipart/form-data">
									<div>
										<input type="text" name="firstname" placeholder="First Name" required/>
										<input type="text" name="lastname" placeholder="Last Name" required/>
										<input type="text" name="email" placeholder="Email" required/>
										<input type="text" name="username" placeholder="Username" required/>
										<input type="password" name="password" placeholder="Password" required/>
										<input type="password" name="cpassword" placeholder="Confirm Password" required/>
										<input type="file" name="image"/>
										<input class="save" type="submit" value="Register" />
											<g:if test="${flash.error}">
												<div class="alert alert-error" style="display: block">${flash.error}</div>
											</g:if>
									</div>
								</g:form>
							</div>
						</div>
					</div>
				</div>
				<!--panel-group-->
			</div>
			<!--row-->
		</div>
		<!--col-md-12>-->
	</div>
	<!--col-md-3-->
</div>
<!--container-->
</body>
</html>