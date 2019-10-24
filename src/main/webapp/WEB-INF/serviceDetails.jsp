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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="style.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
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

	<div class="leftPanel w-25 my-2 mx-3 shadow p-1 mb-5 bg-white rounded" style="">
		<div class="image1 w-100" style="height: 200px; width: 200px;">
		<img src="https://images.pexels.com/photos/1500459/pexels-photo-1500459.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" class="img-fluid">
		</div>

		<div class="serviceDescription w-100 shadow-sm p-1 mb-5 bg-white rounded" style="; height: 200px; width: 200px;">  
		<h5>${serviceExcService.name}</h5>
		
		 <h6>My Overall Rating: <span class="badge badge-info">
			${serviceExcService.getAverageRating()}
		</span> </h6>
		${serviceExcService.serviceExcDate}<br>
		${serviceExcService.address}<br>
		${serviceExcService.description}<br>
		
		</div>
	</div>

	
<!-- RIGHT PANEL -->
	<div class="rightPanel shadow-lg bg-white rounded w-50 mx-3 my-2 px-3 py-3"style="">
		<div class="message w-100 overflow-auto shadow-sm p-3 mb-5 bg-white rounded" style="border:1px lightgray solid; border-radius:5px; height: 400px; width: 600px;"> 
		

<!-- LOOP HERE -->
	<c:forEach items="${serviceExcService.getRatings()}" var="r">
			<div class="rating w-100 " style=" ">
				<div class="profilepic" style=" height: 60px; width: 60px;">
					<img src="<c:out value ="${r.author.profilePic}"/>" style="height:50px; width:50px; border-radius:40px;">
				</div>
				
				<div class="comment w-100 " style="; height: 100px;">
				
				<h5>
					Rated: <c:out value ="${r.rating}"/> out of 5!				 	 
				 </h5> 			
				<H6>
					<c:out value ="${r.author.firstName}"/>
					
				</H6>
				<p> 
					<c:out value ="${r.comment}"/>
				</p>
				</div>	
			</div><br>
	 </c:forEach>
<!-- END OF LOOP	 -->	
			
</div>		
			
		<form:errors class="text-danger" path="sendMessage.*"/></p>
		    
		    <form:form method="POST" action="/service/details/${serviceExcService.id}/addrating" modelAttribute="addRating">
<%-- 		    		    <form:input type="text" value="${serviceExcService.id}" path="serviceExc"/> 
		    		    <form:input type="text" value="${userId}" path="author"/>  --%>
		    		 <p>
		            <form:label path="comment">Leave a Rating!</form:label>
		            <br>
		            <form:textarea rows="5" cols="40" path="comment"/>
		            <br>
		            <form:select path="rating">
		            	<form:option value="1"/> 	 
		            	<form:option value="2"/>
		            	<form:option value="3"/>
		            	<form:option value="4"/>
		            	<form:option value="5"/>

		            </form:select> Stars 
		            <img src="https://cdn2.iconfinder.com/data/icons/modifiers-add-on-1-flat/48/Mod_Add-On_1-35-512.png" style="width:25px; height:25px;">
		            <img src="https://cdn2.iconfinder.com/data/icons/modifiers-add-on-1-flat/48/Mod_Add-On_1-35-512.png" style="width:25px; height:25px;">
		            <img src="https://cdn2.iconfinder.com/data/icons/modifiers-add-on-1-flat/48/Mod_Add-On_1-35-512.png" style="width:25px; height:25px;">
		            <img src="https://cdn2.iconfinder.com/data/icons/modifiers-add-on-1-flat/48/Mod_Add-On_1-35-512.png" style="width:25px; height:25px;">
		            <img src="https://cdn2.iconfinder.com/data/icons/modifiers-add-on-1-flat/48/Mod_Add-On_1-35-512.png" style="width:25px; height:25px;">
		            
		        </p>

		        <input type="submit" class="btn btn-outline-primary btn-sm mx-auto"value="Add Rating!"/>
		    </form:form>
	</div>
</div>
</body>
</html>