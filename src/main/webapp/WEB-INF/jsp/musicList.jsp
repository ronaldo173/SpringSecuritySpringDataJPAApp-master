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



	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-body">

				<h2>All music</h2>
				<a href="#" class="button green small">Favorite</a> <a
					class="button green small" href="<spring:url value='/loadMusic' />">here</a>

			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="container">
					<h2>Table</h2>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Firstname</th>
									<th>Lastname</th>
									<th>Age</th>
									<th>City</th>
									<th>Country</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Anna</td>
									<td>Pitt</td>
									<td>35</td>
									<td>New York</td>
									<td>USA</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<ul>
			<c:forEach var="listValue" items="${listMusic}">
				<li>${listValue}, ${listValue.content}, <audio>
						<source src="${listValue.content}" type='audio/mpeg; codecs="mp3"'>
					</audio></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>
