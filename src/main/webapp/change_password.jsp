<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored = "false" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-885-1">
<title>Change Password Page</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.paint-card {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  border-radius: 10px;
}

.paint-card .card-body {
  padding: 20px;
}

.paint-card .btn {
  background-color: #28a745;
  border: none;
}

.paint-card .btn:hover {
  background-color: #218838;
}

.paint-card .form-control {
  border-radius: 5px;
}

.paint-card .text-center {
  font-weight: bold;
  margin-bottom: 15px;
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp"%>

<c:if test = "${empty newUser}">
   <c:redirect url = "user_login.jsp"></c:redirect>
   </c:if>

<div class="container mt-5">
  <div class="row">
    <div class="col-md-4 offset-md-4">
      <div class="card paint-card">
        <div class="card-body">
          <p class="text-center fs-3">Change Password</p>
          
           <c : if test = "${not empty msg}">
			<p class = "text-center text-success fs-3">${msg}</p>
			<c:remove var = "msg" scope = "session"/>			   
			</c : if>  
						 
			<c : if test = "${not empty error }">
		    <p class = "text-center text-success fs-3">${error}</p>
		    <c:remove var = "error" scope = "session"/>			   
		    </c : if>  
                  
          <hr>
          <form action = "changepassword" method = "post">
           
            <div class="mb-3">
              <label for="oldPsw">Enter Old Password</label>
              <input type="password" id="oldPsw" name="oldPsw" class="form-control" required>
            </div>
            
            <div class="mb-3">
              <label for="newPsw">Enter New Password</label>
              <input type="password" id="newPsw" name="newPsw" class="form-control" required>
            </div>
                                    
            <input type = "hidden" name = "id" value = "${newUser.id}">
                                         
            <button type="submit" class="btn btn-success col-md-12">Change Password</button>  
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
