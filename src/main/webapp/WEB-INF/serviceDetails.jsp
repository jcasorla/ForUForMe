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
        <a class="nav-link" href="/about">Profile</a>
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

<!-- CENTER PANEL -->
	
	<div class="centerPanel w-25 mx-3" style="border:1px green dotted">
		<div class="message w-100" style="border :1px pink solid; height: 400px; width: 300px;""> 
		<form:errors class="text-danger" path="sendMessage.*"/></p>
		    
		    <form:form method="POST" action="/service/details/${servicesexc.id}" modelAttribute="sendMessage">
		    		      
		    		 <p>
		            <form:label path="address">Send Message:</form:label>
		            <form:input type="textarea" path="address"/>
		        </p>

		        <input type="submit" class="btn btn-outline-primary btn-sm mx-auto"value="Send Message"/>
		    </form:form></div> 
		<div class="mx-auto" style="width:200px;">
		<button type="button" class="btn btn-primary btn-lg mx-auto">Book Service!</button>
		</div>
	</div>
	
<!-- RIGHT PANEL -->
	<div class="rightPanel w-25 mx-3"style="border:1px green dotted">
		<div class="message w-100 overflow-auto" style="border :1px pink solid; height: 600px; width: 300px;""> Ratings and Comments</div>
	</div>
</div>
</body>
</html>