<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
	<h1> Welcome ${user.firstName}!!!</h1>
	<div class="card border-primary mb-3" style="max-width: 20rem;">
	  <div class="card-header">About Me:</div>
	  <div class="card-body">
	<!--   <img src="img/profile.jpeg" class="card-img-top" alt="profile" style="width:25%"> -->
					<img src="${user.profilePic}" class="img-fluid" style="border-radius:50px;">
					
	    <h4 class="card-title">Some interesting things about myself:</h4>
	    <p class="card-text">${user.description} </p>
	    	<a href="/about/${user.id}/edit" class="btn btn-outline-primary" style="margin-top:20px">Edit</a>
  	</div>
  	</div>
  	
  	<div class="card border-primary mb-3" style="max-width: 20rem;">
		  <div class="card-header">Feedback provided</div>
		  <div class="card-body">
		  <c:forEach items="${ratings}" var="rating">
		    <h4 class="card-title">What other say about me...</h4>
		    <p class="card-text">Awesome guest! Nice and helpful.</p>
		    <p class="card-text">${rating.comment}</p>
		    </c:forEach>
	  	</div>
	</div>

	<h3> My overall rating <span class="badge badge-info">9</span> </h3>
	

		<h4>Here you have your bookings!</h4>
		
		<table class = "table table-striped">
		<thead>
		<tr>
			<th>Service</th>
			<!-- <th>Date</th>
			<th>Location</th> -->
			<th>Created by</th>
		<th>Action</th> 
		</tr>
		</thead>
	 	<tbody>	
	
		
		<table class="table table-striped table-dark table-hover ">
			<thead>
				<tr>
			    	<th scope="col">Name</th>						      	
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${user.services}" var="serv">
				<tr>
				  	<td>${serv.name}</td>
				    
				   
				 </tr>
			 	</c:forEach>
				
			
			 </tbody>
		</table>
		</tbody>
	</table>
</div>
</body>
</html>