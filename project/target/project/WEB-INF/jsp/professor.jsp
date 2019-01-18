<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

<title>professor</title>

<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<link href="http://localhost:8080/static/css/style.css" rel="stylesheet">
<link href="http://localhost:8080/static/css/bootstrap.min.css"
	rel="stylesheet">
<base href="/professor" />

</head>
<body>
	<div style="height: 100%; overflow-y: auto;">
		<c:choose>
			<c:when test="${mode == 'MODE_MAIN_PAGE'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="professor/announcement">Announcements</a></li>
								<li><a href="professor/add_exam">Add exam</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center" id="tasksDiv">
					<h3>Exams</h3>
					<hr>
					<div class="table-responsive">
						<table class="table table-striped table-bordered text-left">
							<thead>
								<tr>
									<th>Id</th>
									<th>Title</th>
									<th>Room</th>
									<th>Date</th>
									<th>Students</th>
									<th>Update</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="examDto" items="${exams}">
									<tr>
										<td>${examDto.examId}</td>
										<td>${examDto.title}</td>
										<td>${examDto.room}</td>
										<td>${examDto.date}</td>
										<td><a
											href="professor/studentsExam?id=${examDto.examId}"><span
												class="glyphicon glyphicon-user"></span></a></td>
										<td><a href="professor/update_exam?id=${examDto.examId}"><span
												class="glyphicon glyphicon-pencil"></span></a></td>
										<td><a href="professor/delete_exam?id=${examDto.examId}"><span
												class="glyphicon glyphicon-trash"></span></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>
			<c:when test="${mode == 'MODE_ADD'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="">Back</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center">
					<h3>Add exam</h3>
					<hr>
					<form class="form-horizontal" method="POST"
						action="professor/add_exam">
						<div class="form-group">
							<label class="control-label col-md-3">Title</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="title" id="title"
									required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Room</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="room" name="room"
									required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Date</label>
							<div class="col-md-7">
								<input type="date" class="form-control" id="examDate"
									name="examDate" required="required"
									value="<fmt:formatDate value="${examDto.date}" pattern="yyyy-MM-dd"/>" />
								<span id="dateErr" class=color-message-error></span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Time</label>
							<div class="col-md-7">
								<input type="time" class="form-control" id="examTime"
									name="examTime" required="required"
									value="<fmt:formatDate value="${examDto.time}" pattern="HH:mm"/>" />
								<span id="timeErr" class=color-message-error></span>
							</div>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary" id="add" value="Add" />
						</div>
						<div class="form-group"></div>
					</form>
				</div>
			</c:when>
			<c:when test="${mode == 'MODE_UPDATE'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="">Back</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center">
					<h3>Update exam</h3>
					<hr>
					<form class="form-horizontal" method="POST"
						action="professor/update_exam">
						<div class="form-group">
							<label class="control-label col-md-3">Id</label>
							<div class="col-md-7">
								<input type="text" readonly class="form-control" name="examId"
									id="examId" required="required" value="${examDto.examId}" />

							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Title</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="title" id="title"
									readonly required="required" value="${examDto.title}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Room</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="room" name="room"
									required="required" value="${examDto.room}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Date</label>
							<div class="col-md-7">
								<input type="date" class="form-control" id="examDate" name="examDate"
									required="required"
									value="<fmt:formatDate value="${examDto.date}" pattern="yyyy-MM-dd"/>" />
							<span id="dateErrUpdate" class=color-message-error></span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Time</label>
							<div class="col-md-7">
								<input type="time" class="form-control" id="examTime" name="examTime"
									required="required"
									value="<fmt:formatDate value="${examDto.time}" pattern="HH:mm"/>" />
								<span id="timeErrUpdate" class=color-message-error></span>
							</div>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary" id="update" value="Update" />
						</div>
						<div class="form-group"></div>
					</form>
				</div>
			</c:when>


		</c:choose>
	</div>
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<script>
		$('#add').on('click', function(e) {
			if (!date_check(document.getElementById('examDate').valueAsDate)) {
				$('#dateErr').html("Invalid Date");
				e.preventDefault();
			} else {
				$('#dateErr').html("");
			}
			if (!time_check($("#examTime").val())) {
				$('#timeErr').html("Invalid time");
				e.preventDefault();
			} else {
				$('#timeErr').html("");
			}

		});
		$('#update').on('click', function(e) {
			if (!date_check(document.getElementById('examDate').valueAsDate)) {
				$('#dateErrUpdate').html("Invalid Date");
				e.preventDefault();
			} else {
				$('#dateErrUpdate').html("");
			}
			if (!time_check($("#examTime").val())) {
				$('#timeErrUpdate').html("Invalid time");
				e.preventDefault();
			} else {
				$('#timeErrUpdate').html("");
			}

		});

		function date_check(value) {

			var current = new Date();

			if (value.getFullYear() > 2019) {
				return false;
			}
			if (value.getFullYear() < current.getFullYear()) {
				return false;
			} else if (value.getFullYear() == current.getFullYear()) {
				if (value.getMonth() < current.getMonth()) {
					return false;
				} else if (value.getMonth() == current.getMonth()) {
					if (value.getDate() < current.getDate()) {
						return false;
					}
				}
			}

			return true;

		}
		function time_check() {

			var date = document.getElementById("examDate").value, time = document
					.getElementById("examTime").value

			var myDate = new Date(date + " " + time)
			var h = myDate.getHours()

			if (h >= 20) {
				return false;
			} else if (h < 8) {
				return false;
			}

			return true;
		}
	</script>
</body>
</html>