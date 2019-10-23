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
        <a class="nav-link" href="/about">About Us</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/index">Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/index">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/logout">Logout</a>
      </li>
    </ul>
  </div>
  </nav>
   <div class="jumbotron">
   <h1>Search by Service testing if works</h1>
<%--  <c:when test="${serviceexc.service.contains(service) == true}"> --%>
	    <c:forEach items="${servicesexc}" var="service">
	    <div class="card border-primary mb-3" style="max-width: 20rem;">
		  <div class="card-header">Services available</div>
		  <div class="card-body">
		    <h4 class="card-title">{service.address}</h4>
		    <p class="card-text">{service.description}</p>
		  </div>
		</div>
		 </c:forEach>
	<%-- 	</c:when> --%>
  </div>

</body>
</html>