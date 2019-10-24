<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page isErrorPage="true" %> 
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

		<title>Edit Service</title>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <a class="navbar-brand" href="#">ForUforMe</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarColor02">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item active">
		        <a class="nav-link" href="/index"> Dashboard <span class="sr-only">(current)</span></a>
		      </li>
		       <li class="nav-item">
		        <a class="nav-link" href="/about/${user.id}">Profile</a>
		      </li>
		       <li class="nav-item">
		        <a class="nav-link" href="/">Register</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="/">Login</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="/logout">Logout</a>
		      </li>
		    </ul>
		  </div>
		  </nav>
		<div class="container">
		
			<div class="row">
			
				<div class="col-lg">
					<h1>edit service</h1>
					<p><form:errors path="idea.*"/></p>			
				
					
					<form:form action="/services/${oneservice.id}" method="post" modelAttribute="oneservice">
						<input type="hidden" name="_method" value="put">
						<p>
					        <form:label path="name">Name</form:label>
					        
					        <form:input path="name"/>
					    </p>
						<p>
					        <form:label path="description">Description</form:label>
					        
					        <form:input path="description"/>
					    </p>
					    <p>
					        <form:label path="address">Address</form:label>
					        
					        <form:input path="address"/>
					    </p>
					     <p>
					        <form:label path="state">State</form:label>
					        
					        <form:input path="state"/>
					    </p>
					     <p>
					        <form:label path="serviceExcDate">Date</form:label>
					        
					        <form:input path="serviceExcDate"/>
					    </p>
					    <form:hidden path="user" value="${oneservice.user.id}"/>	
					    					    
					    <input class="btn btn-dark" type="submit" value="Update"/>
					</form:form>
					<a class="btn btn-dark" href="/services/${oneservice.id}/delete">Delete</a>
					
				</div>
			</div>
		</div>
		
	</body>
</html>