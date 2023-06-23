<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- <div class="my-4" style="margin-bottom: 0px;"> -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
<div class="container-fluid">
<button type="button" class="navbar-toggler"
	data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
	<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarCollapse">
	<sec:authorize access="!isAuthenticated()">
		<a class="nav-item nav-link button2 p-2 px-3 small me-3" href="cars">
			<i class="fas fa-home fa-lg mb-1"></i> Home</a>
		<a href="register_user" class="nav-item nav-link button2 p-2 px-3 small me-3">
			<i class="fa fa-user-plus"></i> Register</a>
		<a href="about_us" class="nav-item nav-link button2 p-2 px-3 small me-3">
			<i class="fa fa-briefcase"></i> About Us</a> 
		<a href="contact_us" class="nav-item nav-link button2 p-2 px-3 small me-3">
			<i class="fa fa-phone-square"></i> Contact Us</a>
	<div class="ms-auto">
		<a href="login" class="nav-item nav-link button2 p-2 px-3">
			<i class="fa fa-sign-in fs-6"></i> Sign In</a>
	</div>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<sec:authorize access="hasRole('Users')">
		<a class="nav-item nav-link button2 p-2 px-3 small me-3" href="cars">
			<i class="fas fa-home fa-lg mb-1"></i> Home</a>
		<a class="nav-item nav-link button2 p-2 px-3 small me-3" href="profile">
			<i class="fa fa-user"></i> Profile</a>
		<a href="about_us" class="nav-item nav-link button2 p-2 px-3 small me-3">
			<i class="fa fa-briefcase"></i> About Us</a> 
		<a href="contact_us" class="nav-item nav-link button2 p-2 px-3 small me-3">
			<i class="fa fa-phone-square"></i> Contact Us</a>
	</sec:authorize>
	<sec:authorize access="hasRole('Administrator')">
		<a class="nav-item nav-link button2 p-2 px-3 small me-3" href="cars">
			<i class="fas fa-home fa-lg mb-1"></i> Home</a>
		<a class="nav-item nav-link button2 p-2 px-3 small me-3" href="profile">
			<i class="fa fa-user"></i> Profile</a>
		<a class="nav-item nav-link button2 p-2 px-3 small me-3" href="all_cars">
			<i class="fa fa-car"></i> Cars</a>
		<a class="nav-item nav-link button2 p-2 px-3 small me-3" href="users">
			<i class="fa fa-server"></i> Registered Users</a>
	</sec:authorize>
	<sec:authorize access="hasAnyRole('Administrator','Users')">
	<div class="navbar-nav ms-auto">
		<form action="search" method="get" style="min-width: 350px; max-width:500px;">
			<div class="input-group">
				<button type="submit" class="btn btn-outline-light">
					<i class="fa fa-search"></i></button>
				<input type="search" class="form-control" placeholder="Search for Cars" 
					aria-label="Search" name="keyword"aria-describedby="search-addon"
					data-bs-toggle="tooltip" title="Search by name, model, price, year"/>
			</div>
		</form>
	</div>
	<div class="navbar-nav ms-auto">
		<form action="logout" method="post" style="padding: 7px;">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
			<input type="submit" name="Logout" value="Logout" class="btn px-3 btn-danger"/>
		</form>
	</div>
	<script>
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		  return new bootstrap.Tooltip(tooltipTriggerEl)
		})
	</script>
	</sec:authorize>
	</sec:authorize>
</div>
</div>
</nav>