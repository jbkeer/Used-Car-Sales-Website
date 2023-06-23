<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en"> 
<head>
<meta charset="UTF-8">
<title>Admin | Users</title>
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
	<h3 class="text-center mt-5 display-6">Registered Users</h3>	
	<div class="row mb-5">
		<div class="col-12 mb-5 table-responsive p-0">
			<table class="table table-hover table-bordered table-striped">
				<thead class="bg-dark text-white">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Name</th>
					<th scope="col">Username</th>
					<th scope="col">Email</th>
					<th scope="col">Role</th>
					<th scope="col">Actions</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${user}" var="u" varStatus="status">
				<tr>
					<th scope="row">${status.count}</th>
					<td>${u.name}</td>
					<td>${u.userName}</td>
					<td>${u.email}</td>
					<c:forEach items="${u.roles}" var="r">
					<td>${r.name}
						<button type="button" class="btn" data-bs-toggle="modal"
							data-bs-target="#exampleModal1${status.index}">
							<i class="fas fa-edit fa-sm"></i>
						</button>
						<div class="modal fade" id="exampleModal1${status.index}" tabindex="-1" 
							aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
							<div class="modal-dialog">
							<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModal1Label">Assign a Role</h5>
								<button type="button"
									class="btn-close" data-bs-dismiss="modal" aria-label="Close">
								</button>
							</div>
							<div class="modal-body">
							<form:form action="/assign_role?uid=${u.id}" method="post"
								class="was-validated" modelAttribute="user">
								<div class="mb-3 mt-3">
									<label for="name" class="form-label">Role:</label>
									<input type="text" class="form-control" placeholder="Enter role" 
										name="name" value="${r.name}" required="required" />
									<div class="invalid-feedback">Please assign a role</div>
								</div>
								<button type="submit" 
									class="button p-2 px-3 d-block mx-auto">Assign
								</button>
							</form:form>
							</div>
							</div>
							</div>
						</div>
					</td>
					</c:forEach>
					<td>
						<a type="button" class="btn btn-primary" href="/view?uid=${u.id}">
						<i class="far fa-user"></i></a>
						<button type="button" class="btn btn-warning" data-bs-toggle="modal"
							data-bs-target="#exampleModal${status.index}">
							<i class="fas fa-edit"></i>
						</button>
						<div class="modal fade" id="exampleModal${status.index}" tabindex="-1" 
							aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
							<div class="modal-dialog">
							<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">
									<i class="fas fa-edit fa-sm"></i> Edit User</h5>
								<button type="button" 
									class="btn-close" data-bs-dismiss="modal" aria-label="Close">
								</button>
							</div>
							<div class="modal-body">
							<form:form action="/edit?uid=${u.id}" method="post"
								class="was-validated" modelAttribute="user">
								<div class="mb-3 mt-3">
									<label for="name" class="form-label">Name</label>
									<input type="text" class="form-control" placeholder="Enter name"
										name="name" value="${u.name}" required="required"/>
									<div class="invalid-feedback">Please enter name</div>
								</div>
								<div class="mb-3">
									<label for="userName" class="form-label">Username</label>
									<input type="text" class="form-control" id="userName"
										placeholder="Enter username" name="userName"
										value="${u.userName}" required="required"/>
									<div class="invalid-feedback">Please enter username</div>
								</div>
								<div class="mb-3">
									<label for="email" class="form-label">Email</label>
									<input type="email" class="form-control" placeholder="Enter email"
										name="email" value="${u.email}" required="required"/>
									<div class="invalid-feedback">Please enter email</div>
								</div>
								<div class="mb-3">
									<label for="mobile" class="form-label">Mobile Number</label>
									<input type="text" class="form-control" id="mobile"
										placeholder="Enter mobile" name="mobile"
										value="${u.mobile}" required="required"/>
									<div class="invalid-feedback">Please enter mobile number.</div>
								</div>
								<div class="mb-3">
									<label for="address" class="form-label">Address</label>
									<input type="text" class="form-control" id="address"
										placeholder="Enter address" name="address"
										value="${u.address}" required="required"/>
									<div class="invalid-feedback">Please enter address</div>
								</div>
								<button type="submit" class="button p-2 px-3">Edit</button>
							</form:form>
							</div>
							<div class="modal-footer">
							</div>
							</div>
							</div>
						</div> 
						<a type="button" class="btn btn-danger" href="/delete?uid=${u.id}">
						<i class="far fa-trash-alt"></i></a>
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>	
	</div>
</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>
</body>
</html>
