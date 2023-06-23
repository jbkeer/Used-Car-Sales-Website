<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en"> 
<head>
<meta charset="UTF-8">
<title>Car Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/css/style.css" rel="stylesheet" />
</head>
<body class="p-0 m-0">
<%@ include file="header.jsp"%> 
	<c:forEach items="${car}" var="c">
		<c:set var="id" value="${c.id}"></c:set>
		<c:set var="name" value="${c.name}"></c:set>
		<c:set var="image" value="${c.imagePath}"></c:set>
		<c:set var="make" value="${c.make}"></c:set>
		<c:set var="model" value="${c.model}"></c:set>
		<c:set var="registration" value="${c.registration}"></c:set>
		<c:set var="price" value="${c.price}"></c:set>
		<c:set var="sellStatus" value="${c.sellStatus}"></c:set>
	</c:forEach>
	<div class="container mb-5 mt-5" style="margin-top: 200px; margin-bottom: 200px;">
	<div class="card mb-5 mt-5">
	<div class="row g-0">
		<div class="col-md-6 border-end d-flex align-items-center justify-content-center">
		<div class="d-flex flex-column justify-content-center">
			<div class="main_image">
				<img src="${image}" width="100%">
			</div>
		</div>
		</div>
		<div class="col-md-6">
			<div class="p-3 right-side">
			<div class="d-flex justify-content-between align-items-center">
				<h3>${name}</h3>
			</div>
			<div class="my-3 mx-5 content">
			<div class="d-flex">
				<div style="width: 300px;">
					<span class="fw-bold">Condition</span>
					<p style="font-size: 16px;">
						<i class="fas fa-car"></i> Used Car
					</p>
				</div>
				<div>
					<span class="fw-bold">Manufacture Year</span>
					<p style="font-size: 16px;">
						<i class="fas fa-calendar"></i> ${make}
					</p>
				</div>
			</div>
			<div class="d-flex">
			<div style="width: 300px;">
				<span class="fw-bold">Model</span>
				<p style="font-size: 16px;">
					<i class="fas fa-tag"></i> ${model}
				</p>
			</div>
			<div>
				<span class="fw-bold">Registration Date</span>
				<p style="font-size: 16px;">
					<i class="fas fa-calendar"></i> ${registration}
				</p>
			</div>
			</div>
			</div>
			<c:if test="${sellStatus == 'sold'}">
				<h3>Car Sold!</h3>
			</c:if>
						
			<c:if test="${sellStatus != 'sold'}">
			<div>
				<span class="fw-bold">Current Price</span>
				<h3>Php ${price}</h3>
			</div>
	 		<div class="mt-4">
				<span class="fw-bold">Current Bid</span>
				<c:if test="${empty highest}">
					<h3>Php 0</h3>
				</c:if>
				<c:if test="${not empty highest}">
					<h3>Php ${highest}</h3>
				</c:if>
			</div>
			<div class="buttons d-flex flex-row mt-5 gap-3">
				<button type="button" class="btn btn-outline-dark"
					data-bs-toggle="modal" data-bs-target="#exampleModal1"
					style="width: 500px;">Book for Test Drive</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal1" tabindex="-1"
					aria-labelledby="exampleModal1Label" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModal1Label">
								<i class="fa fa-car"></i>Book for Test Drive</h5>
							<button type="button" class="btn-close"
								data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
						
						<!-- Book Form -->
						<form:form action="book" method="post" class="was-validated"
							modelAttribute="booking">
							<div class="mb-3 mt-3">
								<label for="bookDate" class="form-label">Booking Date:</label>
								<input type="date" class="form-control" name="bookDate" required="true"/>
								<div class="invalid-feedback">Please enter the date</div>
							</div>
							<input type="hidden" name="cid" value="${id}">
							<div class="mx-auto text-center">
							<button type="submit" 
								class="button p-2 px-3" style="width: auto;">Book on this Date
							</button>
							</div>
						</form:form>
						</div>
						<div class="modal-footer">
						</div>
						</div>
					</div>
				</div>
				
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-dark" data-bs-toggle="modal"
					data-bs-target="#exampleModal">Bid</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
					<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">
							<i class="fa fa-money"></i>Car Bidding</h5>
						<button type="button" 
							class="btn-close" data-bs-dismiss="modal" aria-label="Close">
						</button>
					</div>
					<div class="modal-body">
					<form:form action="bid" method="post" class="was-validated"
						modelAttribute="bidding">
						<div class="mb-3 mt-3">
							<label for="name" class="form-label">Bid Price (Php):</label>
							<input type="text" class="form-control" placeholder="Enter bidding price" 
								name="bidderPrice" required="true"/>
							<div class="invalid-feedback">Please enter a bidding price</div>
						</div>
						<div class="mx-auto text-center">
						<input type="hidden" name="cid" value="${id}">
						<button type="submit" class="button p-2 px-3">Bid at this price</button>
						</div>
					</form:form>
					</div>
					<div class="modal-footer">
					</div>
					</div>
					</div>
				</div>
			</div>
			</c:if>
			</div>
		</div>
	</div>
	</div>
	<c:if test="${not empty bid}">
	<div class="row">
		<h3 style="margin-bottom: 20px;">Bidding and Booking Status</h3>
		<div class="col-12">
		<table class="table table-bordered">
		<thead>
		<tr>
			<th scope="col">Name</th>
			<th scope="col">Bidding Date</th>
			<th scope="col">Bidding Price (RM)</th>
			<th scope="col">Test Drive Book Date</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${bid}" var="b">
		<tr>
			<td>${b.bidderName}</td>
			<td>${b.bidDate}</td>
			<td>${b.bidderPrice}</td>
			<td>${b.bookDate}</td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
		</div>
	</div>
	</c:if>
	</div>
<%@ include file="footer.jsp"%>
</body>
</html>
