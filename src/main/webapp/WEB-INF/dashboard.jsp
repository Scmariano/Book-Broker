<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Dashboard</title>
</head>
<body>

	<div class="container-fluid">
		<div class="container mx-auto mt-4">
			<header class="row justify-content-between align-items-center">
				<div class="col-5 text-start">
					<h4>Hello, ${user.name}. Welcome to..</h4>
					<h1>The Book broker!</h1>
				</div>
				<div class="col-5 text-end">
					<a href="/logout" class="nav-link">Logout</a>
					<a href="/books/new" class="nav-link">+Add to My Shelf</a>
				</div>
			</header>
		</div>
		<div class="row mx-auto mt-3">
			<h4>Available Books to Borrow</h4>
			<table class="table table-striped table-bordered caption-top">
				<thead class="table-info">
					<tr class="align-middle">
						<th>ID</th>
						<th>Title</th>
						<th>Author Name</th>
						<th>Owner</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${books}">
						<tr>
							<td><c:out value="${book.id}"/></td>
							<td><a href="/books/${book.id}" class="nav-link"><c:out value="${book.title}" /></a></td>
							<td><c:out value="${book.author}" /></td>
							<td><c:out value="${book.user.getName()}" /></td>
							<td class="text-space-between">
								<c:if test="${book.user == user}"><a href="/books/${book.id}/edit" class="nav-link">Edit</a></c:if>
								<c:if test="${book.user == user }"><a href="/books/${book.id}/delete" class="nav-link">Delete</a></c:if>
								<c:if test="${book.user != user }"><a href="/bookmarket/${book.id}" class="nav-link">Borrow</a> </c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table >
			<h4>Books I'm borrowing..</h4>
			<table class="table table-striped table-bordered caption-top">
				<thead class="table-info">
					<tr class="align-middle">
						<th>ID</th>
						<th>Title</th>
						<th>Author Name</th>
						<th>Owner</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${myBooks}">
						<tr>
							<td><c:out value="${book.id}"/></td>
							<td><a href="/books/${book.id}" class="nav-link"><c:out value="${book.title}" /></a></td>
							<td><c:out value="${book.author}" /></td>
							<td><c:out value="${book.user.getName()}" /></td>
							<td><a href="/bookmarket/${book.id}/return"  class="nav-link">Return</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
	

</body>
</html>