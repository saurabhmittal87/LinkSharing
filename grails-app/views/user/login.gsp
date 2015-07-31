<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">--}%
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
	<g:javascript src="bootstrap.min.js"></g:javascript>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!--webfonts-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text.css'/>
	<!--//webfonts-->
</head>
<body>
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
							<g:render template="/layouts/item" collection="${recentShares}" var="items" />
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
							<g:render template="/layouts/item" collection="${topPosts}" var="items" />
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
										<input type="text" name="firstname" placeholder="First Name" required/>
										<input type="text" name="lastname" placeholder="Last Name" required/>
										<select name="gender">
											<option value="Male">Male</option>
											<option value="Female">Female</option>
										</select>
										<input type="text" name="email" placeholder="Email" required/>
										<input type="text" name="username" placeholder="Username" required/>
										<input type="password" name="password" placeholder="Password" required/>
										<input type="password" name="cpassword" placeholder="Confirm Password" required/>
										<input type="file" name="image"/>
										<input class="save" type="submit" value="Register" style="margin-left: 50px;" />
											<g:if test="${flash.error}">
												<div class="alert alert-error" style="display: block">${flash.error}</div>
											</g:if>
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