<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Workflow Management System</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<jsp:include page="WFMS-ASB-001.jsp" />

	<div class="content-wrapper">
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">Add User</h1>
					</div>
				</div>
			</div>
		</div>
		<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
					<label id="message" style="color: red;" margin="left">${err}</label>
						<form:form class="register-form" action="/addUser" method="post"
							modelAttribute="user">
							<div class="card-body">
								<div class="form-group">
								  
									<label for="userId">ID</label>
									<div class="col-lg-6 col-md-12 pl-0">
										<form:input type="text" class="form-control" id="userId"
											value="${userId}" path="userId" required="required"></form:input>
									</div>
								</div>
								<div class="form-group">
									<label for="userName">Name</label>
									<div class="col-lg-6 col-md-12 pl-0">
										<form:input type="text" class="form-control" id="userName"
											placeholder="Enter name" path="userName" required="required"></form:input>
									</div>
								</div>
								<div class="form-group">
									<label for="password">Password</label>
									<div class="col-lg-6 col-md-12 pl-0">
										<form:input type="password" class="form-control" id="password"
											placeholder="Enter Password" path="password"
											required="required"></form:input>
									</div>
								</div>
								<div class="form-group">
									<label for="phoneNo">Phone No.</label>
									<div class="col-lg-6 col-md-12 pl-0">
										<form:input type="phone" class="form-control" id="phoneNo"
											placeholder="Enter Phone Number" path="phoneNumber"
											required="required"></form:input>
									</div>
								</div>
								<div class="form-group">
									<label for="email">Email</label>
									<div class="col-lg-6 col-md-12 pl-0">
										<form:input type="email" class="form-control" id="email"
											placeholder="Enter email" path="email" required="required"></form:input>
									</div>
								</div>
								<div class="form-group">
									<label for="gender">Gender</label>
									<div class="col-lg-6 col-md-12 pl-0">
										<div class="form-check  form-check-inline">
											<form:radiobutton path="gender" class="form-check-input"
												id="gender" value="Male" checked="checked"></form:radiobutton>
											<label class="form-check-label" for="gender">Male</label>
										</div>
										<div class="form-check  form-check-inline">
											<form:radiobutton path="gender" class="form-check-input"
												id="gender" value="Female"></form:radiobutton>
											<label class="form-check-label" for="gender">Female</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="address">Address</label>
									<div class="col-lg-6 col-md-12 pl-0">
										<form:textarea class="form-control" id="address"
											path="address"></form:textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="role">Role</label>
									<div class="col-lg-6 col-md-12 pl-0">
										<div class="row">
											<div class="col-2">
												<div class="form-check">
													<form:radiobutton path="role" value="R001"
														class="form-check-input" id="roleId" checked="checked"></form:radiobutton>
													<label class="form-check-label" for="roleId">Staff</label>
												</div>
											</div>
											<div class="col-2">
												<div class="form-check">
													<form:radiobutton path="role" value="R002"
														class="form-check-input" id="roleId"></form:radiobutton>
													<label class="form-check-label" for="roleId">PM</label>
												</div>
											</div>
											<div class="col-3">
												<div class="form-check">
													<form:radiobutton path="role" value="R003"
														class="form-check-input" id="roleId"></form:radiobutton>
													<label class="form-check-label" for="roleId">HOD</label>
												</div>
											</div>
											<div class="col-2">
												<div class="form-check">
													<form:radiobutton path="role" value="R004"
														class="form-check-input" id="roleId"></form:radiobutton>
													<label class="form-check-label" for="roleId">HR</label>
												</div>
											</div>
											<div class="col-2">
												<div class="form-check">
													<form:radiobutton path="role" value="R005"
														class="form-check-input" id="roleId"></form:radiobutton>
													<label class="form-check-label" for="roleId">Admin</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="exampleInputdepartment">Department</label>
									<div class="col-lg-6 col-md-12 pl-0">
										<form:select path="department" class="form-control" required="required">
											<form:option value="">Select</form:option>
											<form:options items="${departmentList}" itemLabel="departmentName"
												itemValue="departmentId" />
										</form:select>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<a href="checkStatus" class="btn btn-default"
									style="margin-left: 370px;">Cancel</a>
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		</section>
	</div>
	</div>
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Change Password</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body">
					<div class="form-group">
						<input type="text" class="form-control" id="exampleInputEmail1"
							placeholder="Current Password">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="exampleInputEmail1"
							placeholder="New Password">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="exampleInputEmail1"
							placeholder="Retype New Password">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-primary"
						data-dismiss="modal">Update Password</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<script src="plugins/jquery/jquery.min.js"></script>
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="plugins/chart.js/Chart.min.js"></script>
	<script src="plugins/sparklines/sparkline.js"></script>
	<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
	<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
	<script src="plugins/moment/moment.min.js"></script>
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<script src="plugins/summernote/summernote-bs4.min.js"></script>
	<script
		src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<script src="dist/js/adminlte.js"></script>
	<script src="dist/js/common.js"></script>
	<script src="dist/js/pages/dashboard.js"></script>
	<script src="dist/js/demo.js"></script>
</body>
</html>
