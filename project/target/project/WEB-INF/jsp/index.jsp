<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

<title>login</title>

<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--Pulling Awesome Font -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">

</head>
<body>
	<h1 class="login-title-place">Sinu</h1>

	<form class="form-horizontal" method="POST" action="/">
		<div class="container login-margin">
			<div class="row">
				<div class="col-md-offset-5 col-md-3">
					<c:choose>
						<c:when test="${mode=='MODE_ERROR_LOGIN'}">
							<h5 class="color-message-error error-message-place">Wrong
								Username or Password</h5>
						</c:when>
					</c:choose>
					<div class="form-login">
						<h4>Welcome back</h4>
						<input type="text" id="username" name="username"
							required="required" class="form-control input-sm chat-input"
							placeholder="username" /> </br> <input type="password" id="password"
							name="password" required="required"
							class="form-control input-sm chat-input" placeholder="password" />
						</br>
						<div class="wrapper">
							<input type="submit" value="Submit" />
						</div>
					</div>

				</div>
			</div>
		</div>
	</form>
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>