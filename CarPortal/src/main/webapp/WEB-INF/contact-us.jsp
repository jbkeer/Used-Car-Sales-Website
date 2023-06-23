<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/css/style.css" rel="stylesheet"/>
</head>
<body class="p-0 m-0">
<%@ include file="header.jsp"%>
<div class="container py-5 h-75">
	<div class="row">
	<div class="col-lg-4 d-block">
		<br><br><br>
		<h1 class="display-4 text-center mt-5">Contact ABC Car</h1>
		<p class="lead text-muted mb-0 text-center">
		Do you have any questions? Please do not hesitate to contact us directly.
		Our team will come back to you within a matter of hours to help you.</p>
    </div>
	<div class="col-lg-8 mx-auto mt-3 embed-responsive embed-responsive-4by3">
		<iframe
			class="embed-responsive-item container-fluid mx-auto" style="padding-bottom: 20.25%;"
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3925.0214424380756!2d123.91167657158076!3d10.340168927641235!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33a998e133925eeb%3A0xfeda037a6ba9d730!2sUniversity%20of%20Cebu%20-%20Banilad%20Campus!5e0!3m2!1sen!2sph!4v1683106151228!5m2!1sen!2sph" 
			width="800" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	</div>
    </div>
    <div class="row text-center mx-auto">
        <div class="col-4">
        	<i class="fas fa-map-marker-alt fa-2x bg-color"></i>
            <p>6000 Gov. M. Cuenco Ave,<br> Cebu City, 6000 Cebu, Philippines</p>
        </div>
        <div class="col-4">
        	<i class="fas fa-phone mt-4 fa-2x bg-color"></i>
            <p>231 - 6331 <br> 09123456789</p>
        </div>
        <div class="col-4">
        	<i class="fas fa-envelope mt-4 fa-2x bg-color"></i>
            <p>Connect at <br> @abccar.com</p>
        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>