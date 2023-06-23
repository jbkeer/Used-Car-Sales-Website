<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sign In</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet"/>
</head>
<style>
.box {
  box-shadow: 3px 3px 10px 5px rgba(0, 0, 0, 0.5);
}
.button {
	border: 2px solid #395B64;
	border-radius: 5px;
	transition-duration: 0.2s;
	text-decoration: none;
	color: white;
	background-color: #395B64;
}
.button:hover {
	background-color: white;
	border: 2px solid #395B64;
	color: #395B64;
}
.button:active {
	background-color: #395B64;
	color: white;
}
.margin-auto {
	margin: auto;
}
</style>
<body class="p-0 m-0">
<%@ include file="header.jsp"%> 
<div class="container-fluid h-100">
	<c:if test="${success_login != null}">
		<div class="alert alert-success">
			${success_login} Click here to navigate to <a href="home"> Home</a>
		</div>
	</c:if>
	<c:if test="${success_logout != null}">
		<div class="alert_success">
		<c:redirect url="login"></c:redirect>
		</div>
	</c:if>
	<div class="card container-fluid col-sm-6 box p-0"
		style="margin-top: 200px; margin-bottom: 200px;">
	   	<div class="card-body p-5">
	   		<c:if test="${error_string != null}">
				<div class="alert alert-danger">
					${error_string}
				</div>
			</c:if> 
			<c:if test="${(success_logout == null) && (success_login == null)}">
				<c:url var="post_url" value="/login"/>
				<form action="${post_url}" method="post" class="was-validated">
					<h2 style="color: #395B64;">Login</h2>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="mb-3 mt-5">
						<label for="username" class="form-label">Username</label> 
							<input type="text" class="form-control" id="userName" 
								placeholder="Enter username" name="username" value="" required>
							<div class="invalid-feedback">Please enter you username</div>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> 
							<input type="password" class="form-control" id="password"
								placeholder="Enter password" name="password" value="" required>
						<div class="invalid-feedback">Please enter your password</div>
					</div>
					<div class="margin-auto text-center mt-3">
					<input type="submit" name="Login" value="Sign In" class="button p-2 px-5 small text-center">
					</input>
					<hr>
					<div><span>Don't have an account? <a href="register_user">Register</a></span></div>
					</div>
				</form>					
			</c:if>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="footer.jsp"%>
</body>
</html>




