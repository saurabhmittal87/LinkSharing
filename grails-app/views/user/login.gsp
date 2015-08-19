<!DOCTYPE html>
<html>
<head>
	<title>Login Or Register</title>
	<meta name="layout" content="main" />
</head>
<body>
<div class="container">
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
									<option value="volvo">Today</option>
									<option value="saab">1 Week</option>
									<option value="mercedes">1 Month</option>
									<option value="audi">1 Year</option>
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
						<div class="panel-heading">Login</div>
						<div class="panel-body" style="padding: 0px 15px;">
							<div class="row">
								<div class="col-md-12">
									<g:form action="authenticatelogin" method="post" >
										<input type="text" name="username" placeholder="Username" required/>
										<input type="password" name="password" placeholder="Password" required/>
										<h6><a href="#">I forgot my Password!</a></h6>
										<input class="save" type="submit" value="Login" style="margin-left: 50px;"/>
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