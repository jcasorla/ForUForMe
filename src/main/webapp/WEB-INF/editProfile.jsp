<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
   <div class="jumbotron">
   
   <div class="card border-primary mb-3" style="max-width: 20rem;">
	  <div class="card-header">${user.firstName}</div>
	  <div class="card-body">
	    <h4 class="card-title">My profile:</h4>
	    <p class="card-text">
	    <p class = "error"><form:errors path="user.*"/></p>
		<form:form action="/about/${user.id}/edit" method="post" modelAttribute="user">
		<input type = 'hidden' name='_method' value='put'>
     	<p>
            <form:label path="description">About Myself:</form:label>
            <form:errors path="description"/>
            <form:input type="text" path="description"/>
        </p>  
        <p>
        <form:label path="profilePic">Add Picture URL:</form:label>
            <form:errors path="profilePic"/>
            <form:input type="text" path="profilePic"/>
        </p>
    	<input type="submit" class="btn btn-outline-primary"  value="Update"/>
    <%-- 	<a href="/ideas/${idea.id}/delete" class="btn btn-outline-danger">Delete</a> --%>
    
		</form:form>
	    </p>
	  </div>
	  
	</div>
   </div>
</body>
</html>