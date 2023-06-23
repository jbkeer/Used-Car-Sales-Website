<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>All Cars</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/css/style.css" rel="stylesheet" />
</head>
<body class="p-0 m-0">
<%@ include file="header.jsp"%> 
<div class="container mb-5">
	<h3 class="text-center mt-5 display-6">All Posted Cars</h3>	
	<div class="row mb-5">
		<div class="col-12 mb-5 table-responsive p-0">
			<table class="table table-hover table-bordered table-striped">
				<thead class="bg-dark text-white">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Name</th>
					<th scope="col">Model</th>
					<th scope="col">Price (Php)</th>
					<th scope="col">Seller</th>
					<th scope="col" class="text-center">---- Actions ----</th>
					<th scope="col">Car Status</th>
					<th scope="col">Current Bid (Php)</th>
					<th scope="col">Booking Date</th>
					<th scope="col">Booking Status</th>
					<th scope="col">Bidder</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${cars}" var="c" varStatus="status">
				<tr>
					<th scope="row">${status.count}</th>
					<td>${c.name}</td>
					<td>${c.model}</td>
					<td>${c.price}</td>
					<td>
						<a type="button" class="btn btn-primary" href="/view?uid=${c.sellerId}"> 
						<i class="far fa-user small"></i></a>
					</td>
					<td class="text-center">
						<a type="button" class="btn btn-light" href="/car_detail?cid=${c.id}"> 
						<i class="far fa-eye small"></i></a>
						<button type="button" class="btn btn-warning" data-bs-toggle="modal"
							data-bs-target="#exampleModal${status.index}">
							<i class="fas fa-edit"></i>
						</button>
						<div class="modal fade" id="exampleModal${status.index}" tabindex="-1" 
							aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
						<div class="modal-dialog">
						<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"> Edit Car Post</h5>
							<i class="fas fa-edit fa-sm"></i>
							<button type="button" 
								class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							</button>
						</div>
						<div class="modal-body">
						<form:form action="/edit_car?cid=${c.id}" method="post"
							class="was-validated" modelAttribute="car" enctype="multipart/form-data">
							<div class="mb-3 mt-3">
								<label for="name" class="d-flex form-label">Name</label>
								<input type="text" class="form-control" placeholder="Enter car name" 
									name="name" path="name" required="true" value="${c.name}"/>
								<div class="invalid-feedback">Please enter car name</div>
							</div>
							<div class="mb-3">
								<label for="model" class="d-flex form-label">Model</label>
								<input type="text" class="form-control" placeholder="Enter model" 
									name="model" path="model" value="${c.model}" required="true"/>
								<div class="invalid-feedback">Please enter car model</div>
							</div>
							<div class="mb-3">
								<label for="price" class="d-flex form-label">Price (Php)</label>
								<input type="text" class="form-control" id="price" placeholder="Enter car price" 
									name="price" path="price" value="${c.price}" required="true"/>
								<div class="invalid-feedback">Please enter the price</div>
							</div>
							<div class="mb-3">
								<label for="make" class="d-flex form-label">Make Year</label>
								<input type="text" class="form-control" placeholder="Enter make year" 
									name="make" path="make" value="${c.make}" required="true" />
								<div class="invalid-feedback">Please enter make year</div>
							</div>
							<div class="mb-3">
								<label for="registration" class="d-flex form-label">Registration Date</label> 
								<input type="text" class="form-control" id="registration"
									placeholder="Enter registration date"
									name="registration" path="registration"
									value="${c.registration}" required="true" />
								<div class="invalid-feedback">Please enter registration date</div>
							</div>
							<input type="hidden" name="sellerId" value="${c.sellerId}" />
							<input type="hidden" name="photos" value="${c.photos}" />
							<input type="hidden" name="imagePath" value="${c.imagePath}" />

							<div class="holder" style="height: 300px; width: 300px; margin: auto;">
								<img id="imgPreview" src="${c.imagePath}"
									alt="image preview" style="width: inherit;" />
							</div>
							<button type="submit" class="button p-2 px-3">Edit</button>
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
						<div class="modal-footer">
						</div>
						</div>
						</div>
						</div> 
						<a type="button" class="btn btn-danger small" href="/delete_car?cid=${c.id}">
						<i class="far fa-trash-alt small"></i></a>
					</td>
					<td>${c.sellStatus}
					<button type="button" class="btn" data-bs-toggle="modal"
						data-bs-target="#exampleModal2${status.index}">
						<i class="fas fa-edit fa-sm"></i>
					</button>
					<div class="modal fade" id="exampleModal2${status.index}" tabindex="-1" 
						aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
						<div class="modal-dialog">
						<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModal2Label">Set Car Sale Status</h5>
							<button type="button" 
								class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							</button>
						</div>
						<div class="modal-body">
						<form:form action="/sale_status?cid=${c.id}" method="post"
							class="was-validated" modelAttribute="biddings">
							<div class="mb-3 mt-3">
								<label for="sellStatus" class="form-label">Sale Status:</label>
								<input type="text" class="form-control" placeholder="Enter sale status"
									name="sellStatus" value="${c.sellStatus}" required="true"/>
								<div class="invalid-feedback">Please fill out this field</div>
							</div>
							<div class="mx-auto d-block">
							<button type="submit" class="button p-2 px-3">Set</button>
							</div>
						</form:form>
						</div>
						</div>
						</div>
					</div>
					</td>
					<c:forEach items="${c.biddings}" var="b" begin="0" end="0">
						<td>${b.bidderPrice}</td>
						<td>${b.bookDate}</td>
						<td>${b.bookStatus}
						<button type="button" class="btn" data-bs-toggle="modal"
							data-bs-target="#exampleModal1${status.index}">
							<i class="fas fa-edit fa-sm"></i>
						</button>
						<div class="modal fade" id="exampleModal1${status.index}" tabindex="-1" 
							aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
							<div class="modal-dialog">
							<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModal1Label">Set Booking Status</h5>
								<button type="button" 
									class="btn-close" data-bs-dismiss="modal" aria-label="Close">
								</button>
							</div>
							<div class="modal-body">
							<form:form action="/booking_status?bid=${b.id}"
								method="post" class="was-validated" modelAttribute="book">
								<div class="mb-3 mt-3">
									<label for="bookStatus" class="form-label">Booking Status:</label>
									<input type="text" class="form-control"
										placeholder="Enter booking status" name="bookStatus"
										value="${b.bookStatus}" required="true"/>
									<div class="invalid-feedback">Please fill out this field</div>
								</div>
								<div class="mx-auto d-block">
								<button type="submit" class="button p-2 px-3">Set</button>
								</div>
							</form:form>
							</div>
							</div>
							</div>
						</div>
						</td>
						<td>${b.bidderName}</td>
					</c:forEach>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>	
	</div>
</div> <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>
</body>
</html>
