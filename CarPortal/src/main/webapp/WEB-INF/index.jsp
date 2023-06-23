<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en"> 
<head>
<meta charset="UTF-8">
<title>ABC Cars | Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/css/style.css" rel="stylesheet"/>
</head>
<body style="margin: 0; height: 100%;">
<%@ include file="header.jsp"%> 
<div class="container-fluid">
    <div class="row">
    	<div class="row bg-white rounded mx-auto px-0">
    	<div class="col-lg-4 d-flex align-items-center justify-content-center">
          <h1 class="display-3 text-dark d-block my-auto mx-auto p-2">FIND<br> YOUR OWN<br> DREAM CAR</h1>
    	</div>
    	<div class="col-lg-8 d-block my-auto m-0 p-0">
			<img src="/images/herobanner.png" class="img-fluid"/>
		</div>
		</div>
		<div class="row mx-auto bg-dark p-5 rounded-top">
			<p class="fs-4 text-white text-center">
	      		Browse our inventory online to find your dream car!</p>
			  <p class="lead text-deco-none mx-auto text-center">
			  <a href="#cars" role="button" class="btn btn-outline-success p-2 px-5 small mx-auto text-center" 
				style="text-decoration: none;">Browse all Cars</a></p>
		</div>
		<sec:authorize access="hasRole('Users')">
		<div class="row mx-auto bg-dark pb-5 pt-1 rounded-bottom mb-5">
			<p class="mx-auto text-center">
			or<br>
			<a type="button"
				class="btn btn-outline-warning p-2 px-5 small text-center mx-auto" 
				data-bs-toggle="modal" data-bs-target="#exampleModal"> Sell a Car
			</a></p>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" 
			aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
		<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">
			<i class="fa fa-car"></i> Sell a Car</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" 
			aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<c:if test="${success_post != null}">
				<div class="alert alert-success">${success_post}</div>
			</c:if>
			
		<!-- Car Post Form -->
		<form:form action="car_post" method="post" class="was-validated"
			modelAttribute="car" enctype="multipart/form-data">
			<div class="mb-3 mt-3">
				<label for="name" class="d-flex form-label">Name</label>
				<form:input type="text" class="form-control" placeholder="Enter car name" 
					name="name" path="name" required="true"/>
			</div>
			<div class="mb-3">
				<label for="model" class="d-flex form-label">Car Model</label>
				<form:input type="text" class="form-control" placeholder="Enter car model" 
					name="model" path="model" required="true"/>
			</div>
			<div class="mb-3">
				<label for="price" class="d-flex form-label">Price (Php):</label>
				<form:input type="text" class="form-control" id="price" placeholder="Enter car price" 
					name="price" path="price" required="true"/>
			</div>
			<div class="mb-3">
				<label for="make" class="d-flex form-label">Make Year</label>
				<form:input type="text" class="form-control" placeholder="Enter make year" 
					name="make" path="make" required="true"/>
			</div>
			<div class="mb-3">
				<label for="registration" class="d-flex form-label"> Registration Date</label>
				<form:input type="text" class="form-control" id="registration" 
					placeholder="Enter registration date" name="registration" 
					path="registration" required="true"/>
			</div>
			<div class="mb-3">
				<label class="d-flex form-label">Photo</label> 
				<input type="file" class="form-control" name="fileImage" id="photo"
					accept="image/png, image/jpeg" required="true"/>
				<div class="invalid-feedback">Please upload photo</div>
			</div>
			<div class="holder" style="height: 300px; width: 300px; margin: auto;">
			<img id="imgPreview" src="#" alt="image preview" style="width: inherit;"/>
			</div>
			<div class="mx-auto text-center">
			<button type="submit" class="button p-2 px-3 small text-center">Post</button>
			</div>
		</form:form>
		<script>
        $(document).ready(() => {
            $("#photo").change(function () {
                const file = this.files[0];
                if (file) {
                    let reader = new FileReader();
                    reader.onload = function (event) {
                        $("#imgPreview")
                          .attr("src", event.target.result);
                    };
                    reader.readAsDataURL(file);
                }
            });
        });
        </script>
		</div>
		</div>
		</div>
		</div>
		</sec:authorize>
    </div>
    <div class="row mx-auto mt-5">
    	<h1 id="cars" class="h5-display mx-auto text-center"> Featured Cars </h1>
    </div>
    <div class="mt-5 container">
    	<div class="row">
    	<c:forEach items="${cars}" var="c">
			<c:set var="id" value="${c.id}"></c:set>    
			<c:if test="${success_post == null}">
				<c:if test="${c.sellStatus != 'sold'}">
					<div class="container-fluid m-0 bg-white" style="min-width:350px; max-width: 400px;">
						<img class="card-img-top w-100 mt-3" src="${c.imagePath}"
								alt="${c.photos}">
						<div class="card-body">
							<h4 class="card-title">${c.name}</h4>
							<p class="card-text">
								<i class="fas fa-tags"></i>&nbsp;Php ${c.price}
							</p>
							<a href="/car_detail?cid=${c.id}" 
								class="btn btn-outline-primary mx-auto text-center">
								View Car Details</a>
						</div>
					</div>
				</c:if> 
			</c:if>		
    	</c:forEach>
    	</div>
    </div>
</div> 
<%@ include file="footer.jsp"%>
</body>
</html>
