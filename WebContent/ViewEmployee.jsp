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
	if(e.getId()==0){

%>
<h3> Record not found ! </h3>


<%} else {
	int id=e.getId();
	String fname=e.getFirstName();
	String lname=e.getLastName();
	%>
	
	Employee id :<%=id%><br>
	Employee Name :<%=fname%><br>
	Employee Name :<%=lname%><br>
	
	<%} %>

<input type="submit" class="btn btn-outline-primary mb-2" onclick="window.location='NewHome.jsp'" name ="action"  value="ok">




</div>






</body>
</html>