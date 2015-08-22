<!DOCTYPE html>
<html>
<head>
	<title>Login Or Register</title>
	<link rel="stylesheet" type="text/css" href="${resource(dir: "css", file: "style.css")}">
	<meta name="layout" content="main" />
</head>
<body>
<div class="container">
	<p style="text-align: center;">${flash.message}</p>
	<div class="col-md-9">
		<div class="col-md-12">
			<div class="row">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">Recent Shares</div>
						<div class="panel-body" style="padding: 0px 15px;">
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
									<option value="today">Today</option>
									<option value="1 week">1 Week</option>
									<option value="1 Month">1 Month</option>
									<option value="1 Year">1 Year</option>
								</select>
							</div>
						</div>
						<div class="panel-body" style="padding: 0px 15px;">
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
						<div class="panel-heading">
							<p style="display:inline">Login</p>
							<p style="display:inline; float:right;"><g:link controller="user" action="forgotPassword">Forgot Password</g:link></p>
						</div>
						<div class="panel-body" style="padding: 0px 15px;">
							<div class="row">
								<div class="col-md-12">
									<g:form action="authenticatelogin" method="post" class="form form--login" >
										<div class="form__field">
											<label class="fontawesome-user"><span class="hidden">Username</span></label>
											<input id="login__username" name="username" type="text" class="form__input" placeholder="Username" required>
										</div>
										<div class="form__field">
											<label class="fontawesome-lock"><span class="hidden">Password</span></label>
											<input id="login__password" type="password" name="password" class="form__input" placeholder="Password" required>
										</div>
										<div class="form__field">
											<input type="submit" value="Sign In">
										</div>
										<p>${flash.get("login error")}</p>
									</g:form>

								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">Register</div>
						<div class="panel-body" style="padding: 0px 15px;">
							<div class="row">
								<div class="col-md-12">
									<g:form action="authenticatesignup" method="post" class="form registration_form" enctype="multipart/form-data">
										<div class="form__field">
											<input type="text" name="firstname" placeholder="First Name" required/>
										</div>
										<div class="form__field">
											<input type="text" name="lastname" placeholder="Last Name" required/>
										</div>
										<div class="form__field">
											<select name="gender">
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</select>
										</div>
										<div class="form__field">
											<input type="email" name="email" placeholder="Email" required/>
										</div>
										<div class="form__field">
											<input type="text" name="username" placeholder="Username" required/>
										</div>
										<div class="form__field">
											<input type="password" name="password" placeholder="Password" required/>
										</div>
										<div class="form__field">
											<input type="password" name="cpassword" placeholder="Confirm Password" required/>
										</div>
										<div class="form__field">
											<input type="file" name="image"/>
										</div>
										<div class="form__field">
											<input type="submit" value="Register">
										</div>
										<div class="form__field">
											<g:if test="${flash.error}">
												<div class="alert alert-error" style="display: block">${flash.error}</div>
											</g:if>
										</div>
									</g:form>

								</div>
								<!--col-md-12-->
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