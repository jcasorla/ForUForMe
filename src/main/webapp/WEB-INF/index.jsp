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
        <a class="nav-link" href="/about/${user}">Profile</a>
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
	<!-- <div class="imgOne">
	</div> -->
	
	<div class ="row">
	
		<div class="col-md-4">
			<form class="form-inline my-2 my-lg-0" action="/search" method="post">
			     <input type="hidden" name="formLocation" value="location">
			     	      	     <input type="hidden" name="location" value="location">
			     
			      <input class="form-control mr-sm-2" type="text" name="service" placeholder="By location">
			      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		    </form>
		</div>
		<div class="col-md-4">
			 <form class="form-inline my-2 my-lg-0" action="/search" method="post">
			      <input class="form-control mr-sm-2" type="text" name="location" placeholder="By service">
		      	      	     <input type="hidden" name="service" value="service">
			      	     <input type="hidden" name="formLocation" value="service">
			      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		    </form>
		
		</div>
	
	</div>
	
	    
	    <br>
	    
	
    
    
			
	<div class="row">
		<div class="col-lg-8">
			<h2>Services</h2>
		
		</div>
		<div class="col-sm-4">
		
		</div>
	
	</div>
	
	<div class="row">
		<div class="col-lg">
			<table class="table table-striped table-dark table-hover ">
				<thead>
					<tr>
				    	<th scope="col">Service</th>
				      	<th scope="col">Host:</th>
				      	<th scope="col">State</th>
				      	<th scope="col">Action</th>
				      	
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${services}" var="service">
						<tr>
						    <td><a href="/service/details/${service.id}"><c:out value="${service.name}"/></a></td>
						    <td><c:out value="${service.user.userName}"/></td>
						    <td>${service.state}</td>
						    <td>
						    	<c:choose>
		                        <c:when test="${service.user == user}">
		                            <a href="/services/${service.id}/edit">Edit</a> | <a href="/services/${service.id}/delete">Delete</a>
		                        </c:when>
		                        <c:otherwise>
	                        	    <c:set var="attending" value="${false}"/>
								    <c:forEach items="${service.getUsers()}" var="goer">
								        <c:if test="${goer == user}">
								            <c:set var="attending" value="${true}"/>
								        </c:if>
								    </c:forEach>
								
								    <c:choose>
								    <c:when test="${attending == false}">
								        <a href="/services/${service.id}/book">book</a>
								    </c:when>
								    <c:otherwise>
								        <a href="/services/${service.id}/cancel">unbook</a>
								    </c:otherwise>
									</c:choose>
		                        	
		                        </c:otherwise>
		                        </c:choose>  
						    
						    </td>
						 </tr>
					 	</c:forEach>
					
					
				
				 </tbody>
			</table>
			<hr>
			
			<a href="/services/new" class="btn btn-dark">Create an Idea</a>
		
		</div>
		
	
	</div>
	  

	   
</div>

</body>
</html>