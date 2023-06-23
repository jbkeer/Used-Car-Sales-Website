<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/css/style.css" rel="stylesheet"/>
</head>
<body class="p-0 m-0">
<%@ include file="header.jsp"%>
<div class="container mt-5">
	<c:if test="${empty searchCar}">
		<div class="alert alert-danger"> No search results found for ${keyword}</div>
	</c:if>
	<div class="row mt-5">
	<c:forEach items="${searchCar}" var="c">
		<div class="container-fluid m-0 bg-white" style="min-width:350px; max-width: 400px;">
			<img class="card-img-top w-100 mt-3" src="${c.imagePath}" alt="${c.photos}">
			<div class="card-body">
				<h4 class="card-title">${c.make} ${c.name}</h4>
				<h6 class="card-text">${c.model}</h6>
				<p class="card-text"><i class="fas fa-tags"></i>&nbsp;Php ${c.price}</p>
				<a href="/car_detail?cid=${c.id}" class="btn btn-outline-primary">View Car Details</a>
			</div>
		</div>
	</c:forEach>
	</div>
</div><br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%> 
</body>
</html>