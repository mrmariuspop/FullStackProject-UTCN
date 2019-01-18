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

<title>students exam</title>

<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<link href="http://localhost:8080/static/css/style.css" rel="stylesheet">
<link href="http://localhost:8080/static/css/bootstrap.min.css"
	rel="stylesheet">
<base href="/studentsExam" />

</head>
<body>
	<div style="height: 100%; overflow-y: auto;">
		<c:choose>
			<c:when test="${mode == 'MODE_MAIN_PAGE'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="professor">Back</a></li>
								<li><a href="professor/studentsExam/add_student?examid=${examid}">Add student</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center" id="tasksDiv">
					<h3>Students</h3>
					<hr>
					<div class="table-responsive">
						<table class="table table-striped table-bordered text-left">
							<thead>
								<tr>
									<th>First name</th>
									<th>Last name</th>
									<th>Group</th>
									<th>Grade</th>
									<th>Update</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="userExamDto" items="${studentsExam}">
									<tr>
										<td>${userExamDto.user.firstname}</td>
										<td>${userExamDto.user.lastname}</td>
										<td>${userExamDto.user.group}</td>
										<td>${userExamDto.grade}</td>
										<td><a href="professor/studentsExam/update_student?examid=${examid}&id=${userExamDto.id}"><span
												class="glyphicon glyphicon-pencil"></span></a></td>
										<td><a href="professor/studentsExam/delete_student?id=${userExamDto.id}"><span
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
								<li><a href="professor/studentsExam?id=${examid}">Back</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center">
					<h3>Add student</h3>
					<hr>
					<div class="table-responsive">
						<table class="table table-striped table-bordered text-left">
							<thead>
								<tr>
									<th>First name</th>
									<th>Last name</th>
									<th>Group</th>
									<th>Add</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="userDto" items="${students}">
									<tr>
										<td>${userDto.firstname}</td>
										<td>${userDto.lastname}</td>
										<td>${userDto.group}</td>
										<td><a href="professor/studentsExam/add_student_to_exam?examid=${examid}&userid=${userDto.userid}"><span
												class="	glyphicon glyphicon-plus"></span></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>
			<c:when test="${mode == 'MODE_UPDATE'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="professor/studentsExam?id=${examid}">Back</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center">
					<h3>Update student</h3>
					<hr>
					<form class="form-horizontal" method="POST"
						action="professor/studentsExam/update_student">
						<div class="form-group">
							<label class="control-label col-md-3">Id</label>
							<div class="col-md-7">
								<input type="text" readonly class="form-control" name="id"
									id="id" required="required" value="${userExamDto.id}" />

							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Fist name</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="user.firstname" id="user.firstname"
									readonly value="${userExamDto.user.firstname}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Last name</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="user.lastname" name="user.lastname"
									readonly value="${userExamDto.user.lastname}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Group</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="user.group" name="user.group"
									readonly value="${userExamDto.user.group}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Grade</label>
							<div class="col-md-7">
								<input type="number" min="1" max="10" class="form-control" id="grade" name="grade"
									value="${userExamDto.grade}" />
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

</body>
</html>