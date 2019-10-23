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

		<title>Insert title here</title>
	</head>
	<body>
		<div class="container">
		
			<div class="row">
				
				<div class="col-lg">
					<h1>Create a new idea</h1>
					<p><form:errors path="idea.*"/></p>
			
				
					
					<form:form action="/service" method="post" modelAttribute="serviceExc">
					
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
					    <form:hidden path="user" value="${user.id}"/>
					    <input class="btn btn-dark" type="submit" value="Submit"/>
					</form:form>  
					
				</div>
			</div>
		</div>
		
	</body>
</html>