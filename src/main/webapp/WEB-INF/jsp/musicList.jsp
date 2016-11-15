<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="css/app.css" />" rel="stylesheet"
	type="text/css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<title>Music all</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-header">
			<div class="well well-lg text-center">
				<h1>Music network!</h1>
			</div>
		</div>
		<div class="panel-body text-center">
			<div class="well well-lg">
				<h2>All music</h2>
				<a href="#" class="button green small">Favorite music</a> <a
					class="button green small" href="<spring:url value='/home' />">Home
					page</a>
			</div>
		</div>
		<div class="panel-body">
			<div class="well well-lg">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="container">
								<h2>All songs</h2>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>Music name</th>
												<th>Music player</th>
												<th>Play in separate window</th>
												<th>Like</th>
												<th>Comments</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="listValue" items="${listMusic}"
												varStatus="loop">
												<tr>
													<td>${loop.index+1}</td>
													<td>${listValue.name}</td>
													<td><audio controls>
															<source src="loadSong/${listValue.id}" type="audio/mpeg" />
														</audio></td>
													<td><a
														class="btn btn-default glyphicon glyphicon-music"
														href="<spring:url value='/loadSong/${listValue.id}' />"></a></td>
													<td><a
														class="btn btn-default glyphicon glyphicon-hand-up"
														href="<spring:url value='/likeSong/${listValue.id}' />"></a></td>
													<td>----comment--</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="panel-body well well-lg">
			Add song:
			<div class="panel-body">
				<form:form method="POST" action="/songSave"
					enctype="multipart/form-data">

					<div class="form-group">
						<label for="name">Song name</label> <input type="text"
							class="form-control" id="name" name="name" required
							placeholder="Song name">
					</div>
					<div class="form-group">
						Please select a file to upload : <input type="file" name=song />
						<input type="submit" value="SAVE SONG!" /> <span><form:errors
								path="file" cssClass="btn btn-primary" /> </span>
					</div>

				</form:form>
			</div>
		</div>
	</div>



</body>
</html>
