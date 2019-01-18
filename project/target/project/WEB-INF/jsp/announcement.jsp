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

<title>announcement</title>

<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<link href="http://localhost:8080/static/css/style.css" rel="stylesheet">
<link href="http://localhost:8080/static/css/bootstrap.min.css"
	rel="stylesheet">
<base href="/announcement" />

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
								<li><a href="professor/announcement/add_announcement">Add announcement</a></li>
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
									<th>Update</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="announcementDto" items="${announcements}">
									<tr>
										<td>${announcementDto.announcementId}</td>
										<td>${announcementDto.title}</td>
										<td>${announcementDto.description}</td>
										<td><a href="professor/announcement/update_announcement?id=${announcementDto.announcementId}"><span
												class="glyphicon glyphicon-pencil"></span></a></td>
										<td><a href="professor/announcement/delete_announcement?id=${announcementDto.announcementId}"><span
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
								<li><a href="professor/announcement">Back</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center">
					<h3>Add announcement</h3>
					<hr>
					<form class="form-horizontal" method="POST"
						action="professor/announcement/add_announcement">
						<div class="form-group">
							<label class="control-label col-md-3">Title</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="title" id="title"
									required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Description</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="description" name="description"
									required="required" />
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
								<li><a href="professor/announcement">Back</a></li>
								<li><a href="logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container text-center">
					<h3>Update announcement</h3>
					<hr>
					<form class="form-horizontal" method="POST"
						action="professor/announcement/update_announcement">
						<div class="form-group">
							<label class="control-label col-md-3">Id</label>
							<div class="col-md-7">
								<input type="text" readonly class="form-control" name="announcementId"
									id="announcementId" required="required" value="${announcementDto.announcementId}" />

							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Title</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="title" id="title"
									 required="required" value="${announcementDto.title}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Description</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="description" name="description"
									required="required" value="${announcementDto.description}" />
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