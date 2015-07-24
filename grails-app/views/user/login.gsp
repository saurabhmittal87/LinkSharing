
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!--webfonts-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text.css'/>
	<!--//webfonts-->
</head>
<body>
<div class="main">
	<div class="header" >
		<h1>Login or Create a Free Account!</h1>
	</div>

		<ul class="left-form">
			<h2>New Account:</h2>
			<li>
				<input type="text"   placeholder="Username" required/>
				<a href="#" class="icon ticker"> </a>
				<div class="clear"> </div>
			</li>
			<li>
				<input type="text"   placeholder="Email" required/>
				<a href="#" class="icon ticker"> </a>
				<div class="clear"> </div>
			</li>
			<li>
				<input type="password"   placeholder="password" required/>
				<a href="#" class="icon into"> </a>
				<div class="clear"> </div>
			</li>
			<li>
				<input type="password"   placeholder="password" required/>
				<a href="#" class="icon into"> </a>
				<div class="clear"> </div>
			</li>
			<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Please inform me of upcoming  w3layouts, Promotions and news</label>
			<input type="submit" onclick="myFunction()" value="Create Account">
			<div class="clear"> </div>
		</ul>
		<ul class="right-form">
			<g:form action="authenticatelogin" method="post" >
			<h3>Login:</h3>
			<div>
				<li><input type="text"  placeholder="Username" required/></li>
				<li> <input type="password"  placeholder="Password" required/></li>
				<h4>I forgot my Password!</h4>
				<input class="save" type="submit" value="Login" />
			</div>
				<div class="clear"> </div>
			</g:form>

			<g:form action="authenticatesignup" method="post" enctype="multipart/form-data">
				<h3>Register:</h3>
				<div>
					<li><input type="text" name="firstname" placeholder="First Name" required/></li>
					<li><input type="text" name="lastname" placeholder="Last Name" required/></li>
					<li><input type="text" name="email" placeholder="Email" required/></li>
					<li><input type="text" name="username" placeholder="Username" required/></li>
					<li><input type="password" name="password" placeholder="Password" required/></li>
					<li><input type="password" name="cpassword" placeholder="Confirm Password" required/></li>
					<li><input type="file" name="image"/></li>
					<li><input class="save" type="submit" value="Register" />
					<g:if test="${flash.error}">
						<div class="alert alert-error" style="display: block">${flash.error}</div>
					</g:if>
				</div>
				<div class="clear"> </div>
			</g:form>
		</ul>

</div>



</body>
</html>