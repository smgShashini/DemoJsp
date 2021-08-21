<%@page import="models.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

</head>
<body style="text-align: center">


<div style="margin-top:100px">
<%

	Employee e=(Employee)request.getAttribute("emp");  // Catch attribute send by view servlet
	if(e.getId()==0 || e==null){

%>

<h4> Record not found ! </h4>
<img src="not-found.png" alt="not-found"><br>


<%} else {
	int id=e.getId();
	String fname=e.getFirstName();
	String lname=e.getLastName();
	%>
	<div style="color:blue;height:150px">
	
	Employee id :<%=id%><br>
	Employee First Name :<%=fname%><br>
	Employee Last Name :<%=lname%><br>
	</div>
	
	
	<%} %>

<input type="submit" class="btn btn-outline-primary " onclick="window.location='Home.jsp'" name ="action"  value="Back to home">




</div>






</body>
</html>