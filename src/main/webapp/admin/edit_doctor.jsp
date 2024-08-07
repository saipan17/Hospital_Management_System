<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DbConn"%>
<%@page import = "com.entity.Doctor" %>
<%@page import = "com.entity.Specialist" %>
<%@page import = "java.util.List" %>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor page</title>
<style type = "text/css">
.paint-card {
                 
      box-shadow : 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>

</head>
<body>
<%@include file = "navbar.jsp" %>

<div class = "container-fluid p-3">
<div class = "row">

   <div class = "col-md-4 offset-md-4">
   <div class = "card paint-card">
   <div class = "card-body">
   <p class = "fs-3 text-center">Add Doctor</p>
   
   <%   
       int id = Integer.parseInt(request.getParameter("id"));            
       DoctorDao dao = new DoctorDao(DbConn.getConn());
       Doctor d = dao.getDoctorById(id);
       
 %>
 <form action = "../updatedoctor" method = "post">
 <div class = "mb-3">
 <label class = "form-label">Full Name</label><input type = "text"
 required name = "fullName" class = "form-control" value = <%=d.getFullName()%>>
 </div>
 
 <div class = "mb-3">
 <lable class = "form-label">DOB</lable><input type = "text"
 required name = "dob" class = "form-control" value = <%=d.getDob()%>>
 </div>
 
 <div class = "mb-3">
 <lable class = "form-label">Qualification</lable><input type = "text"
 required name = "qualification" class = "form-control" value = <%=d.getQualification()%>>
 </div>
 
 <div class = "mb-3">
 <lable class = "form-label">Specialist</lable>
 <select name = "spec" required class = "form-control">
 <option><%=d.getSpecialist()%></option>
 
 <% SpecialistDao special = new SpecialistDao(DbConn.getConn());
      
   List <Specialist> list = special.getAlllist();
   
   for(Specialist s : list){%>
	   
	   <option><%=s.getSpec_name()%></option>
	   <%
       }
     %>
 
 </select>
 </div>
 
 <div class = "mb-3">
 <lable class = "form-label">Email</lable><input type = "email"
 required name = "email" class = "form-control" value = <%=d.getEmail()%>>
 </div>
 
 <div class = "mb-3">
 <lable class = "form-label">Mobile No</lable><input type = "text"
 required name = "mobno" class = "form-control" value = <%=d.getMobno()%>>
 </div>
 
 <div class = "mb-3">
 <lable class = "form-label">Password</lable><input type = "text"
 required name = "password" class = "form-control" value = <%=d.getPassword()%>>
 </div>
 
<input type="hidden" name="id" value="<%= d.getId() %>">
<button type="submit" class="btn btn-primary col-md-12">Update</button>

 </form> 
   </div>
 </div>
</div>
</div>
</div>
</body>
</html>