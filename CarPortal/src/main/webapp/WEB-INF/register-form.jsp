<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register</title>
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
	<div class="card container-fluid col-sm-6 box p-0" 
		style="margin-top: 200px; margin-bottom: 200px;">
		<div class="card-body p-4 px-5">
		<form:form action="register" method="post" class="was-validated p-1" modelAttribute="user">
			<h2 style="color: #395B64;">Register</h2>
			<div class="row mt-3">
				<c:if test="${success_register != null}">
					<div class="alert alert-success">${success_register} Click here to 
					<a href="login"> Log In</a> </div>
				</c:if>
				<div class="mb-3 col">
					<label for="name" class="form-label">Name </label>
					<form:input type="text" class="form-control" 
						placeholder="Enter name" name="name" path="name" required="true"/>
					<div class="invalid-feedback">Please enter your name</div>	
				</div>
				<div class="mb-3 col">
					<label for="userName" class="form-label">Username </label> 
					<form:input type="text" class="form-control" id="userName"
						placeholder="Enter username" name="userName" path="userName" required="true"/>
					<div class="invalid-feedback">Please enter your username</div>
				</div>
			</div>
			<div class="row">
				<div class="mb-3 col">
					<label for="email" class="form-label">Email</label> 
					<form:input type="email" class="form-control" 
						placeholder="Enter email" name="email" path="email" required="true"/>
						<div class="invalid-feedback">Please enter your email</div>
					<label for="password" class="form-label mt-3">Password</label> 
					<form:input type="password" class="form-control" id="password"
						placeholder="Enter password" name="password" path="password" required="true"/>
						<div class="invalid-feedback">Please enter your password</div>
				</div>
			</div>
			<div class="margin-auto text-center mt-3">
			<input type="submit" value="Register" class="button p-2 px-5 small text-center"/>
			<hr>
			<div>
				<span>Already have an account? <a href="login"> Sign In</a></span>
			</div>
			</div>
		</form:form> 
		</div>
	</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="footer.jsp"%>
</body>
</html>