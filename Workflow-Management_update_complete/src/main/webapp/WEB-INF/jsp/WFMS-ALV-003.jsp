<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

	<c:choose>
		<c:when test="${sessionScope.sesUser.role.roleName=='Admin'}">
			<jsp:include page="WFMS-ASB-001.jsp" />
		</c:when>
		<c:when test="${sessionScope.sesUser.role.roleName=='Staff'}">
			<jsp:include page="WFMS-SSB-001.jsp" />
		</c:when>
		<c:when
			test="${sessionScope.sesUser.role.roleName=='Project Manager'}">
			<jsp:include page="WFMS-PSB-001.jsp" />
		</c:when>
		<c:when
			test="${sessionScope.sesUser.role.roleName=='Head of Department'}">
			<jsp:include page="WFMS-PSB-001.jsp" />
		</c:when>
		<c:when test="${sessionScope.sesUser.role.roleName=='HR'}">
			<jsp:include page="WFMS-HSB-001.jsp" />
		</c:when>
	</c:choose>

	<div class="wrapper">
		<div class="content-wrapper">
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Apply Leave</h1>
						</div>
					</div>
				</div>
			</div>
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<form:form class="apply-form" action="sendBackAddLeaveForm"
									method="post" modelAttribute="leaveForm">
									<div class="card-body">
										<div class="form-group">
											<label for="exampleInputLeave1">Leave Type</label>
											<div class="col-lg-6 col-md-12 pl-0">
												<form:input path="leaveForm" type="hidden" value="${leaveForm.leaveForm}"/>
												<form:select path="leaveType" items="${leaveList}"
													itemValue="leaveTypeId" itemLabel="leaveType"
													class="form-control" id="exampleInputLeave1" required="required">
													<form:option value="">Select</form:option>
													<form:options items="${leaveList}" itemValue="leaveTypeId"
														itemLabel="leaveType" />

												</form:select>
											</div>
										</div>
										<div class="form-group">
											<label for="exampleInputLeave1">Full or Half</label>
											<div class="col-lg-6 col-md-12 pl-0">
												<div class="form-check  form-check-inline">
													<form:radiobutton path="fullOrHalf"
														class="form-check-input" id="exampleCheck2" value="1"
														checked="checked"></form:radiobutton>
													<label class="form-check-label" for="exampleCheck2">Full</label>
												</div>
												<div class="form-check  form-check-inline">
													<form:radiobutton path="fullOrHalf"
														class="form-check-input" id="exampleCheck2" value="0.5"></form:radiobutton>
													<label class="form-check-label" for="exampleCheck2">Half</label>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label>Date Range:</label>
											<div class="input-group col-lg-6 col-md-12 pl-0">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="far fa-calendar-alt"></i>
													</span>
												</div>
												<form:input type="text"
													class="form-control float-right date-range"
													path="dateRange" autocomplete="off"></form:input>
											</div>
										</div>
										<div class="form-group">

											<label>Assign To:</label>
											<div class="col-lg-6 col-md-12 pl-0">
												<form:select path="assignTo" items="${userList}"
													itemValue="userId" itemLabel="name" class="form-control"
													id="exampleInputLeave1" required="required">
													<form:option value="NONE">Select</form:option>
													<form:options items="${userList}" itemValue="userId"
														itemLabel="name" />
												</form:select>
											</div>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Reason</label>
											<div class="col-lg-6 col-md-12 pl-0">
												<form:textarea class="form-control" path="reason"></form:textarea>
											</div>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Submit To:</label>
											<div class="col-lg-6 col-md-12 pl-0">
												<form:select class="form-control" path="submitTo"
													items="${submitToUser}" itemValue="userId" itemLabel="name" required="required">
													<form:option value="">Select</form:option>
													<form:options items="${submitToUser}" itemValue="userId"
														itemLabel="name" />

												</form:select>
											</div>
										</div>
									</div>
									<div class="card-footer">
										<!-- <a href="WFMS-ADH-002.jsp" class="btn btn-default"
											style="margin-left: 370px;">Cancel</a> -->
										<button type="submit" class="btn btn-primary" style="margin-left: 450px;">Apply</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</section>
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
	<script type="text/javascript">
		$('input[name="dateRange"]').on(
				'apply.daterangepicker',
				function(ev, picker) {
					$(this).val(
							picker.startDate.format('MM/DD/YYYY') + ' - '
									+ picker.endDate.format('MM/DD/YYYY'));
				});

		$('input[name="dateRange"]').on('cancel.daterangepicker',
				function(ev, picker) {
					$(this).val('');
				});
	</script>
</body>
</html>