<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Know Your Neighborhood</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>
<style>
.button2 {
	border: 2px solid #395B64;
	border-radius: 5px;
	transition-duration: 0.2s;
	text-decoration: none;
	color: white;
	background-color: #395B64;
}
.button2:hover {
	background-color: #A5C9CA;
	border: 2px solid #395B64;
	color: #395B64;
}
.button2:active {
	background-color: #A5C9CA;
	color: white;
}
</style>
<body>
	<div class="container-fluid h-100 text-center" style="position: absolute; z-index: 1;">
	    <div class="row h-50" style="background-color: #A5C9CA;">
	    	<div class="col-12">
	    	</div> 
	    </div>
	    <div class="row h-50" style="background-color: #395B64;">
	    	<div class="col-12">
			</div>
	    </div> 
	</div>  
	<div class="jumbotron text-center" style="position: absolute; z-index: 2; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<div class="text-center">
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 24 24" style="fill: #395B64;transform: ;msFilter:;">
			<path d="M11 7h2v7h-2zm0 8h2v2h-2z"></path>
			<path d="m21.707 7.293-5-5A.996.996 0 0 0 16 2H8a.996.996 0 0 0-.707.293l-5 5A.996.996 0 0 0 2 8v8c0 .266.105.52.293.707l5 5A.996.996 0 0 0 8 22h8c.266 0 
			.52-.105.707-.293l5-5A.996.996 0 0 0 22 16V8a.996.996 0 0 0-.293-.707zM20 15.586 15.586 20H8.414L4 15.586V8.414L8.414 4h7.172L20 8.414v7.172z"></path></svg>
		</div>
		<h2 class="display-4">Sorry, you don't have permission to access this page.</h2> <br> <br>
		<form action='http://localhost:8083/home'>
			<div class="margin-auto text-center">
			<input type='submit' type="button" class="button2 p-2 px-5 small text-deco-none text-center" value='Back to home' />
			</div>
		</form>
	</div>
</body>
</html>
