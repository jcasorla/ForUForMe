<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Individual Service Details</title>
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
<div class="container w-100 row">

<!-- LEFT PANEL -->

	<div class="leftPanel w-25 mx-3" style="border:1px green dotted">
		<div class="image1 w-100" style="border :1px pink solid; height: 200px; width: 200px;""></div>
		<div class="image2 w-100" style="border :1px pink solid; height: 200px; width: 200px;"></div>
		<div class="serviceDescription w-100" style="border :1px pink solid; height: 200px; width: 200px;"> Service Description 
		${serviceExcService.id}<br>
		${serviceExcService.address}<br>
		${serviceExcService.description}<br>
		
		</div>
	</div>

	
<!-- RIGHT PANEL -->
	<div class="rightPanel w-50 mx-3"style="border:1px green dotted">
		<div class="message w-100 overflow-auto" style="border :1px pink solid; height: 400px; width: 300px;"> 
		
		<table class="table table-striped">
  <thead>
  
    <tr>
      <th scope="col">Rating</th>
      <th scope="col">Comment</th>
      <th scope="col">Created By</th>

    </tr>
   
  </thead>
  <tbody>
  
<!--   LOOP HERE -->
<!-- ITEMS VARIABLE IS WHAT ATTRIBUTE YOU ADDED TO MODEL IN CONTROLLER -->
	<c:forEach items="${allRatings}" var="r">
    <tr>
      <th scope="row"> 
      		<c:out value ="${r.rating}"/> 
      </th>
      <td><c:out value ="${r.comment}"/></td>
      <td><c:out value ="${r.author}"/></td>
    </tr>
    </c:forEach>

  </tbody>
</table>
</div>		
		
		
		
		
		<form:errors class="text-danger" path="sendMessage.*"/></p>
		    
		    <form:form method="POST" action="/service/details/${servicesexc.id}/addrating" modelAttribute="addRating">
		    		      
		    		 <p>
		            <form:label path="comment">Leave a Rating!</form:label>
		            <form:textarea rows="5"  path="comment"/>
		            
		            <form:select path="rating">
		            	<form:option value="1"/>
		            	<form:option value="2"/>
		            	<form:option value="3"/>
		            	<form:option value="4"/>
		            	<form:option value="5"/>

		            </form:select>
		        </p>

		        <input type="submit" class="btn btn-outline-primary btn-sm mx-auto"value="Add Rating"/>
		    </form:form>
	</div>
</div>
</body>
</html>