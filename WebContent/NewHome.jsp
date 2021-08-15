<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

</head>

<body style="text-align: center">
	<div class="pl-6">
	
	</div>
	<div class="row">
    	<div class="col-6 col-md-4">
    		
    		
    			<form action="create" method="post">
    			<h4> Register Employee</h4>
    			<div class="row mb-3">
				    <label for="inputId" class="col-sm-2 col-form-label">Id</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="id" placeholder="Enter  id">
				    </div>
                </div>
				<div class="row mb-3">
				    <label for="inputName" class="col-sm-2 col-form-label">Name</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="firstName" placeholder="Enter first name">
				    </div>
                </div>
                <div class="row mb-3">
				    <label for="inputAuthor" class="col-sm-2 col-form-label">Surname</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="lastName" placeholder="Enter last name">
				    </div>
                </div>
                	
			    
			  	<input type="reset" class="btn btn-outline-primary" value="Cancel">
			    <input type="submit" class="btn btn-outline-primary" name ="action"  value="Register">
                
    		
    		</form>
    		
    		<div style="margin-top:30px;margin-left:10px" >
    		<form action="updateName" method="post">
    			<h4> Update Last name</h4>
    			<div class="row mb-3">
				    <label for="inputId" class="col-sm-2 col-form-label">Id</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="id" placeholder="Enter  id">
				    </div>
                </div>
				<div class="row mb-3">
				    <label for="inputName" class="col-sm-2 col-form-label">Surname</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="newLastName" placeholder="Enter new last name">
				    </div>
                </div>
                
			  	
			    <input type="submit" class="btn btn-outline-primary" name ="action"  value="Update">
                
    		
    		</form>
    		
    		
    		</div>
    		
    		
    		<div style="margin-top:30px;margin-left:50px" >
    		<h4> Search Employee</h4>
    		<form class="row g-2" action="view" method="get">
			  
			  <div class="col-auto">
			    
			    <input type="text" class="form-control ml-6" name="id" placeholder="Employee id">
			  </div>
			  <div class="col-auto">
			    <input type="submit" class="btn btn-outline-primary mb-3" name ="action"  value="Search">
			  </div>
			</form>
    		
    		</div>
    		
    		
       
        
        </div>
        
    	<div class="col-md-8" style="margin-top:80px">
    		
			<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost:3306/xyzcompany" user="root"
				password="24091@MySql" />
		
			<sql:query var="listUsers" dataSource="${database}">
		        SELECT * FROM employee;
		    </sql:query>
		    <table table class="table table-hover">

				<tr>
					<th>ID</th>
					<th>First name</th>
					<th>Last name</th>
					<th>Action</th>

				</tr>
				<c:forEach var="user" items="${listUsers.rows}">
					<tr>

						<td><c:out value="${user.id}" /></td>
						<td><c:out value="${user.first_name}" /></td>
						<td><c:out value="${user.last_name}" /></td>
						<td><a href="delete?id=<c:out value='${user.id}' />">Delete</a></td>


					</tr>
				</c:forEach>
			</table>
    		<div>
    		
    			
    		</div>
    	
    	
    	</div>
	</div>
</body>
</html>