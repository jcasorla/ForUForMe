<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>ForUforMe</title>
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
        <a class="nav-link" href="/dashboard"> Dashboard <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/about">About Us</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/register">Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/register">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/logout">Logout</a>
      </li>
    </ul>
  </div>
</nav>
<div class="jumbotron">
	<div class="row">
	<div class="card-group">
	     <div class="card border-primary lg-3" style="max-width: 30rem;">
			  <div class="card-header">Register</div>
			  <div class="card-body">
			    <h4 class="card-title"></h4>
			    <p class="card-text">
				    <p><form:errors path="user.*"/></p>
				    <form:form method="POST" action="/registration" modelAttribute="user">
				    <p>
			            <form:label path="userName">Username:</form:label>
			            <form:input type="text" path="userName"/>
			       </p>
			    	<p>
			            <form:label path="firstName">First Name:</form:label>
			            <form:input type="text" path="firstName"/>
			       </p>
			       
			       <p>
			           <form:label path="lastName">Last Name:</form:label>
			           <form:input type="text" path="lastName"/>
			       </p>
			       
			       <p>
			           <form:label path="email">Email:</form:label>
			           <form:input type="email" path="email"/>
			       </p>
		       <%--  <p>
			            <form:label path="address">Location:</form:label>
			            <form:input type="text" path="address"/>
			        </p> --%>
			        
			       <%--  <form:select path="state">
	        			<form:option value="AZ" label = "AZ" />
					 	<form:option value="CA" label = "CA" />
						<form:option value="NY" label = "NY" />
					    <form:option value="NV" label = "NV" />
					    <form:option value="IL" label = "IL" />
						<form:option value="HI" label = "HI" />							  
					</form:select> --%>
       
       
			      
			            <form:label path="password">Password:</form:label>
			            <form:password path="password"/>
			        </p>
			        <p>
			            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
			            <form:password path="passwordConfirmation"/>
			        </p>
				        <input type="submit" class="btn btn-outline-primary" value="Register"/>
				    	</form:form>
			    	</p>
			  </div>
			</div>
	</div>
	
	<div class ="col-lg">
	<div class="card-group">
		 <p><c:out value="${error}" /></p>
			<div class="card border-primary lg-3" style="max-width: 30rem;">
			  <div class="card-header">Login</div>
			  <div class="card-body">
			    <h4 class="card-title"></h4>
			    <p class="card-text">
			    	<p><form:errors path="user.*"/></p>
		    
			    <form method="post" action="/login">
			        <p>
			            <label type="text" for="email">Email</label>
			            <input type="text" id="email" name="email"/>
			        </p>
			        <p>
			            <label for="password">Password</label>
			            <input type="password" id="password" name="password"/>
			        </p>
			        <input type="submit" class="btn btn-outline-primary" value="Login"/>
			    </form> 
				</p>
			  </div>
	</div>
	    
	</div>
	</div>
	</div>
</div>
</body>
</html>