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

<title>admin</title>

<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<link href="http://localhost:8080/static/css/style.css" rel="stylesheet">
<link href="http://localhost:8080/static/css/bootstrap.min.css"
	rel="stylesheet">
<base href="/admin" />

</head>
<body>
	<div style="height: 100%; overflow-y: auto;">
		<c:choose>
			<c:when test="${mode == 'MODE_MAIN_PAGE'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="admin/create_student">Create student</a></li>
								<li><a href="admin/professors">Professors</a></li>
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
									<th>Id</th>
									<th>Username</th>
									<th>Password</th>
									<th>First name</th>
									<th>Last name</th>
									<th>Group</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="user" items="${students}">
									<tr>
										<td>${user.userid}</td>
										<td>${user.username}</td>
										<td>${user.password}</td>
										<td>${user.firstname}</td>
										<td>${user.lastname}</td>
										<td>${user.group}</td>
										<td><a href="admin/update_student?id=${user.userid}"><span
												class="glyphicon glyphicon-pencil"></span></a></td>
										<td><a href="admin/delete_student?id=${user.userid}"><span
												class="glyphicon glyphicon-trash"></span></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>
			<c:when test="${mode == 'MODE_CREATE'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="admin">Back</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center">
					<h3>Add student</h3>
					<hr>
					<form class="form-horizontal" method="POST"
						action="/admin/create_student">
						<div class="form-group">
							<label class="control-label col-md-3">Username</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="username"
									id="username" required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Password</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="password"
									name="password" required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">First name</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="firstname"
									name="firstname" required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Last name</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="lastname"
									name="lastname" required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Group</label>
							<div class="col-md-7">
								<input type="number" min="0" step="1" class="form-control" id="group"
									name="group" required="required" />
							</div>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Add" />
						</div>
						<div class="form-group"></div>
						<c:if test="${not empty errorMessage}">
							<div class="color-message-error">
								<c:out value="${errorMessage}" />
							</div>
						</c:if>
					</form>
				</div>
			</c:when>
			<c:when test="${mode == 'MODE_UPDATE'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="admin">Back</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center">
					<h3>Update student</h3>
					<hr>

					<form class="form-horizontal" method="POST"
						action="/admin/update_student">
						<div class="form-group">
							<label class="control-label col-md-3">Id</label>
							<div class="col-md-7">
								<input type="text" readonly class="form-control" name="userid"
									id="userid" required="required" value="${userDto.userid}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Username</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="username"
									id="username" required="required" value="${userDto.username}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Password</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="password"
									name="password" required="required" value="${userDto.password}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">First name</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="firstname"
									name="firstname" required="required" value="${userDto.firstname}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Last name</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="lastname"
									name="lastname" required="required" value="${userDto.lastname}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Group</label>
							<div class="col-md-7">
								<input type="number" min="0" step="1" class="form-control" id="group"
									name="group" required="required" value="${userDto.group}" />
							</div>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Update" />
						</div>
						<div class="form-group"></div>
						<c:if test="${not empty errorMessage}">
							<div class="color-message-error">
								<c:out value="${errorMessage}" />
							</div>
						</c:if>
					</form>
				</div>
			</c:when>
			
			<c:when test="${mode == 'MODE_MAIN_PAGE_PROFESSOR'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="admin">Back</a></li>
								<li><a href="admin/professors/create_professor">Create professor</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center" id="tasksDiv">
					<h3>Professors</h3>
					<hr>
					<div class="table-responsive">
						<table class="table table-striped table-bordered text-left">
							<thead>
								<tr>
									<th>Id</th>
									<th>Username</th>
									<th>Password</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="user" items="${professors}">
									<tr>
										<td>${user.userid}</td>
										<td>${user.username}</td>
										<td>${user.password}</td>
										<td><a href="admin/professors/update_professor?id=${user.userid}"><span
												class="glyphicon glyphicon-pencil"></span></a></td>
										<td><a href="admin/professors/delete_professor?id=${user.userid}"><span
												class="glyphicon glyphicon-trash"></span></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>
			<c:when test="${mode == 'MODE_CREATE_PROFESSOR'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="admin/professors">Back</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center">
					<h3>Add professor</h3>
					<hr>
					<form class="form-horizontal" method="POST"
						action="/admin/professors/create_professor">
						<div class="form-group">
							<label class="control-label col-md-3">Username</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="username"
									id="username" required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Password</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="password"
									name="password" required="required" />
							</div>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Add" />
						</div>
						<div class="form-group"></div>
						<c:if test="${not empty errorMessage}">
							<div class="color-message-error">
								<c:out value="${errorMessage}" />
							</div>
						</c:if>
					</form>
				</div>
			</c:when>
			<c:when test="${mode == 'MODE_UPDATE_PROFESSOR'}">
				<div role="navigation">
					<div class="navbar navbar-inverse">
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li><a href="admin/professors">Back</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center">
					<h3>Update professor</h3>
					<hr>

					<form class="form-horizontal" method="POST"
						action="/admin/professors/update_professor">
						<div class="form-group">
							<label class="control-label col-md-3">Id</label>
							<div class="col-md-7">
								<input type="text" readonly class="form-control" name="userid"
									id="userid" required="required" value="${userDto.userid}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Username</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="username"
									id="username" required="required" value="${userDto.username}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Password</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="password"
									name="password" required="required" value="${userDto.password}" />
							</div>
						</div>
						
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Update" />
						</div>
						<div class="form-group"></div>
						<c:if test="${not empty errorMessage}">
							<div class="color-message-error">
								<c:out value="${errorMessage}" />
							</div>
						</c:if>
					</form>
				</div>
			</c:when>
			
		</c:choose>
	</div>
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>