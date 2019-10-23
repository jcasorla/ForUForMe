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
	<!-- <div class="imgOne">
	</div> -->
	<form class="form-inline my-2 my-lg-0" action="/search" method="post">
	     <input type="hidden" name="formLocation" value="location">
	     	      	     <input type="hidden" name="location" value="location">
	     
	      <input class="form-control mr-sm-2" type="text" name="service" placeholder="By location">
	      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
	    </form>
	    
	    <br>
	    
	 <form class="form-inline my-2 my-lg-0" action="/search" method="post">
	      <input class="form-control mr-sm-2" type="text" name="location" placeholder="By service">
      	      	     <input type="hidden" name="service" value="service">
	      	     <input type="hidden" name="formLocation" value="service">
	      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
	  

	   
</div>

</body>
</html>