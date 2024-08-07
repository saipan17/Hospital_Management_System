<%@page import="com.db.DbConn"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import= "com.entity.Specialist" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored = "false" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile for Doctor</title>
<style type="text/css">
.paint-card {

     box-shadow : 0 0 10px 0 rgba(0 , 0, 0, 0.3);

}
</style>
</head>
<body>
<%@include file = "navbar.jsp" %>

<div class = "container p-4">
<div class = "row">
<div class = "col-md-4">
<div class = "card paint-card">
<p class = "text-center mt-3">Change Password</label>

<c : if test = "${not empty sucMsg }">
 <p class = "text-center text-success fs-3">${sucMsg}</p>
 <c:remove var = "sucMsg" scope = "session"/>			   
 </c : if>  
						 
<c : if test = "${ not empty errorMsg }">
 <p class = "text-center text-success fs-3">${errorMsg}</p>
 <c:remove var = "errorMsg" scope = "session"/>			   
</c : if>

<hr>
<div class = "card-body">
<form action = "../changepsw" method = "post">
<div class = "mb-3">

<c:if test = "${empty doctor}">
   <c:redirect url = "../doctor_login.jsp"></c:redirect>
   </c:if>


<lable>Enter Old Password</lable>
<input type = "password" name = "oldPsw" class = "form-control" required>
</div>

<div class = "mb-3">
<lable>Enter New Password</lable>
<input type = "password" name = "newPsw" class = "form-control" required>
</div>

<input type = "hidden" name = "did" value = "${doctor.id}">

<button class = "btn btn-success col-md-12">Change Password</button>
</form>
</div>
</div>
</div>

<div class = "col-md-8">
<div class = "card paint-card">
<p class = "text-center mt-3">Edit Profile</label>
<hr>
<div class = "card-body">
<form action = "../editprofile" method = "post">
<div class = "mb-3">
<lable class = "form-label">Full Name</lable>
<input type = "text" required name = "fullName" class = "form-control" value = "${doctor.fullName}">
</div>

<div class = "mb-3">
<lable class = "form-label">DOB</lable>
<input type = "text" required name = "dob" class = "form-control" value = "${doctor.dob}">
</div>

<div class = "mb-3">
<lable class = "form-label">Qualification</lable>
<input type = "text" required name = "qualification" class = "form-control" value = "${doctor.qualification}">
</div>

<div class = "mb-3">
<lable class = "form-label">Specialist</lable>
<select name = "spec" required class = "form-control">
<option>${doctor.specialist}</option>

<%
SpecialistDao dao = new SpecialistDao(DbConn.getConn());
List<Specialist> list = dao.getAlllist();

for(Specialist s : list){%>

<option><%=s.getSpec_name()%></option>
<%	
}
%>
</select>
</div>

<div class = "mb-3">
<lable class = "form-label">Email</lable>
<input type = "text" readonly required name = "email" class = "form-control" value = "${doctor.email}">
</div>

<div class = "mb-3">
<lable class = "form-label">Mob No</lable>
<input type = "text" required name = "mobno" class = "form-control" value = "${doctor.mobno}">
</div>

<input type = "hidden" name = "uid" value = "${doctor.id}">

<button type = "submit" class = "btn btn-primary">Submit</button>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>