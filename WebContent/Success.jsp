<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

</head>
<body style="text-align: center">

<%
	//String msg=request.getAttribute("page").toString();
	String msg=request.getAttribute("msg").toString();
	
%>
<div style ="margin-top:50px">

<img src="something-wrong.jpg" alt="something-wrong"><br>
<h4 style="color:blue"><%=msg %><br></h4>

<input type="submit" class="btn btn-outline-primary mb-3" onclick="window.location='Home.jsp'" name ="action"  value="Try Again" style="margin-top:10px">
</div>

</body>
</html>