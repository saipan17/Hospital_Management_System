<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored = "false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor login</title>
<style type = "text/css">

.point-card {

     box-shadow : 0 0 10px 0 rgba(0 , 0, 0, 0.3);

}
</style>

</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card point-card">
					<div class="card-body">

						<p class="fs-4 text-center">Doctor Login</p>
						
						<c : if test = "${not empty doctor }">
						   <p class = "text-center text-success fs-3">${doctor}</p>
						   <c:remove var = "doctor" scope = "session"/>			   
						 </c : if>  
						 
						<c : if test = "${ not empty errorMes }">
						   <p class = "text-center text-success fs-3">${errorMes}</p>
						   <c:remove var = "errorMes" scope = "session"/>			   
						 </c : if>

						<form action="doctorlogin" method="post">

							<div class="mb-3">
								<lable class="form-label">Email address</lable>
								<input required name="email" type="email" class="form-control">
							</div>

							<div class="mb-3">
								<lable class="form-label">Password</lable>
								<input required name="password" type="password"
									class="form-control">
							</div>

							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>