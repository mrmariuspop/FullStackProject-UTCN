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

<title>student</title>

<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<link href="http://localhost:8080/static/css/style.css" rel="stylesheet">
<link href="http://localhost:8080/static/css/bootstrap.min.css"
	rel="stylesheet">
<base href="/student" />

</head>
<body>
	<div style="height: 100%; overflow-y: auto;">
		<c:choose>
			<c:when test="${mode == 'MODE_MAIN_PAGE'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="student/announcements?id=${id}">Announcements</a></li>
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
									<th>Title</th>
									<th>Room</th>
									<th>Date</th>
									<th>Grade</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="userExamDto" items="${exams}">
									<tr>
										<td>${userExamDto.exam.title}</td>
										<td>${userExamDto.exam.room}</td>
										<td>${userExamDto.exam.date}</td>
										<td>${userExamDto.grade}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>
			<c:when test="${mode == 'MODE_ANNOUNCEMENT'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="student?id= ${id}">Back</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center" id="tasksDiv">
					<h3>Announcements</h3>
					<hr>
					<div class="table-responsive">
						<table class="table table-striped table-bordered text-left">
							<thead>
								<tr>
									<th>Id</th>
									<th>Title</th>
									<th>Description</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="announcementDto" items="${announcements}">
									<tr>
										<td>${announcementDto.announcementId}</td>
										<td>${announcementDto.title}</td>
										<td>${announcementDto.description}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>
		</c:choose>
	</div>
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>

</body>
</html>