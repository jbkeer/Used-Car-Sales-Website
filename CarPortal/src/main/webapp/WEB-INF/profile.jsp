<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en"> 
<head>
<meta charset="UTF-8">
<title>Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" 
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/css/style.css" rel="stylesheet" />
<script src="/js/script.js"></script>
</head>
<style>
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
</style>
<body class="p-0 m-0">
<%@ include file="header.jsp"%>
<c:forEach items="${user}" var="u">
		<c:set var="id" value="${u.id}"></c:set>
		<c:set var="name" value="${u.name}"></c:set>
		<c:set var="uname" value="${u.userName}"></c:set>
		<c:set var="email" value="${u.email}"></c:set>
		<c:set var="mobile" value="${u.mobile}"></c:set>
		<c:set var="address" value="${u.address}"></c:set>
</c:forEach>
<div class="container">
    <div class="main-body">
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="/images/avatar.jpg" 
                    	alt="Admin" class="rounded-circle" width="150">
                    <div class="mt-4 mb-4">
                      <h4>${name}</h4>
                      <p class="text-muted font-size-sm">${address}</p>
                      <button class="btn btn-dark">Follow</button>
                      <button class="btn btn-outline-dark">Message</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Full Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      ${name}
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      ${email}
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Username</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      ${uname}
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Mobile</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      ${mobile}
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Address</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      ${address}
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-12">
                      <a class="btn btn-outline-dark px-4" data-bs-toggle="modal" 
                      	data-bs-target="#exampleModal">
                      <i class="fas fa-edit fa-sm"></i> Edit</a>
                    </div>
                  </div>
	              <div class="modal fade" id="exampleModal" tabindex="-1" 
	              	aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title text-center" id="exampleModalLabel">
							<i class="fas fa-edit fa-sm"></i> Edit Profile</h5>
							<button type="button" 
								class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							</button>
						</div>
						<div class="modal-body">
						<form:form action="update" method="post" class="was-validated" 
							modelAttribute="user">
							<div class="mb-3 mt-3">
								<label for="name" class="form-label">Name</label>
								<input type="text" class="form-control" placeholder="Enter name" 
										name="name" path="name" value="${name}" required="required"/>
								<div class="invalid-feedback">Please enter name</div>
							</div>
							<div class="mb-3">
								<label for="userName" class="form-label">Username</label>
								<input type="text" class="form-control" id="userName" 
										placeholder="Enter username" name="userName" path="userName"
										value="${uname}" required="required"/>
								<div class="invalid-feedback">Please enter username</div>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email</label>
								<input type="email" class="form-control" placeholder="Enter username"
										name="email" path="email" value="${email}" required="required"/>
								<div class="invalid-feedback">Please enter email</div>
							</div>
							<div class="mb-3">
								<label for="mobile" class="form-label">Mobile</label>
								<input type="text" class="form-control" id="mobile" 
										placeholder="Enter mobile"
										name="mobile" path="mobile" value="${mobile}"
										required="required"/>
								<div class="invalid-feedback">Please enter mobile number</div>
							</div>
							<div class="mb-3">
								<label for="address" class="form-label">Address</label>
								<input type="text" class="form-control" id="address" 
										placeholder="Enter address" name="address" path="address"
										value="${address}" required="required"/>
								<div class="invalid-feedback">Please enter address</div>
							</div>
							<div class="mx-auto text-center mt-5">
								<button type="submit" class="button p-2 px-4 small mx-auto">Save Changes
								</button>
							</div>
						</form:form>
						</div>
 -->					</div>
					</div>
				  </div>
                </div>
              </div>
			</div>
			<div class="row p-3">
			<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button class="nav-link active text-dark fw-bold" id="nav-home-tab" data-bs-toggle="tab" 
					data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" 
					aria-selected="true">Posted Cars</button>
				<button class="nav-link text-dark fw-bold" id="nav-profile-tab" data-bs-toggle="tab"
					data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile"
					aria-selected="false">Booking </button>
			</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab">
				<c:if test="${not empty cars}">
				<div class="container p-0">
				<div class="row">
				<div class="col-12 table-responsive">
				<table class="table table-bordered table-striped table-hover">
				<thead class="bg-dark text-white">
					<tr>
						<th scope="col">Post</th>
						<th scope="col">Car</th>
						<th scope="col">Post Date</th>
						<th scope="col">Action</th>
						<th scope="col">Current Bid (Php)</th>
						<th scope="col">Bidder Name</th>
						<th scope="col">Sale status</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${cars}" var="c" varStatus="status">
					<tr>
						<th scope="row">${status.count}</th>
						<td>${c.name}</td>
						<td>${c.postDate}</td>
						<td>
							<a type="button" class="btn btn-light" href="/car_detail?cid=${c.id}">
							<i class="fa fa-car"></i></a>
							<a type="button" class="btn btn-danger" href="/deletecar?cid=${c.id}">
							<i class="far fa-trash-alt"></i></a> 
						</td>
						<c:forEach items="${c.biddings}" var="b" begin="0" end="0">
							<c:set var="bidPrice" value="${b.bidderPrice}"></c:set>
							<c:if test="${bidPrice > 0}">
								<td>${b.bidderPrice}</td>
								<td>${b.bidderName}</td>
							</c:if>
							<td>${c.sellStatus}</td>
						</c:forEach>
					</tr>
				</c:forEach>
				</tbody>
				</table>
				</div>
				</div>
				</div>
				</c:if>
			</div>
			<div class="tab-pane fade" id="nav-profile" role="tabpanel" 
				aria-labelledby="nav-profile-tab">
				<c:if test="${not empty cars}">
				<div class="container p-0">
				<div class="row">
				<div class="col-12 table-responsive">
				<table class="table table-hover table-bordered table-striped">
				<thead class="bg-dark text-white">
					<tr>
						<th scope="col">#</th>
						<th scope="col">Car</th>
						<th scope="col">Book Date</th>
						<th scope="col">Booked By</th>
						<th scope="col">Book Status</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${cars}" var="c" varStatus="status">
					<c:forEach items="${c.biddings}" var="b">
						<c:set var="bookDate" value="${b.bookDate}"></c:set>
						<c:if test="${bookDate != null}">
							<tr>
								<th scope="row">${status.count}</th>
								<td>${c.name}</td>
								<td>${b.bookDate}</td>
								<td>${b.bidderName}</td>
								<td>${b.bookStatus}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
				</tbody>
				</table>
				</div>
				</div>
				</div>
				</c:if>
				<c:if test="${empty cars}">
				<div class="container p-0">
				<div class="row">
				<div class="col-12 table-responsive">
				<table class="table table-hover table-bordered table-striped">
				<thead class="bg-dark text-white">
					<tr>
						<th scope="col">#</th>
						<th scope="col">Book Date</th>
						<th scope="col">Car</th>
						<th scope="col">Book Status</th>
						<th scope="col">View Car</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${bids}" var="b" varStatus="status">
					<c:set var="bookDate" value="${b.bookDate}"></c:set>
					<c:if test="${bookDate != null}">
						<tr>
							<th scope="row">${status.count}</th>
							<td>${b.bookDate}</td>
							<td>${b.car.name}</td>
							<td>${b.bookStatus}</td>
							<td>
								<a type="button"
									class="btn btn-light" href="/car_detail?cid=${b.car.id}">
								<i class="far fa-car"></i></a>
							</td>
						</tr>
					</c:if>
				</c:forEach>
				</tbody>
				</table>
				</div>
				</div>
				</div>
				</c:if>
			</div>
			</div>
		</div>
        </div>
        </div>
    </div><br><br><br><br><br><br>
 <%@ include file="footer.jsp"%>
</body>
</html>