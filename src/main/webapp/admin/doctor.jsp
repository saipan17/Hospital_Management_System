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

   <div class = "col-md-4">
   <div class = "card paint-card">
   <div class = "card-body">
   <p class = "fs-3 text-center">Add Doctor</p>
 
 <form action = "../addoctor" method = "post">
 <div class = "mb-3">
 <label class = "form-label">Full Name</label><input type = "text"
 required name = "fullName" class = "form-control">
 </div>
 
 <div class = "mb-3">
 <lable class = "form-label">DOB</lable><input type = "text"
 required name = "dob" class = "form-control">
 </div>
 
 <div class = "mb-3">
 <lable class = "form-label">Qualification</lable><input type = "text"
 required name = "qualification" class = "form-control">
 </div>
 
 <div class = "mb-3">
 <lable class = "form-label">Specialist</lable>
 <select name = "spec" required class = "form-control">
 <option>--select--</option>
 
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
 required name = "email" class = "form-control">
 </div>
 
 <div class = "mb-3">
 <lable class = "form-label">Mobile No</lable><input type = "text"
 required name = "mobno" class = "form-control">
 </div>
 
 <div class = "mb-3">
 <lable class = "form-label">Password</lable><input type = "password"
 required name = "password" class = "form-control">
 </div>
 
 <button type = "submit" class = "btn btn-primary">Submit</button>
 
 </form>
   
   </div>
   </div>
   </div>
   
   <div class = "col-md-8">
        <div class = "card paint-card">
        <div class = "card-body">
        <p class = "fs-3 text-center">Doctor Details</p>
        <table class = "table">
        <thead>
        <tr>
        <th scope = "col">Full Name</th>
        <th scope = "col">DOB</th>
        <th scope = "col">Qualification</th>
        <th scope = "col">Specialist</th>
        <th scope = "col">Email</th>
        <th scope = "col">Mob no</th>
        <th scope = "col">Action</th>
        </tr>      
        </thead>
       <tbody>
                        <%
                            DoctorDao dao = new DoctorDao(DbConn.getConn());
                            List<Doctor> list1 = dao.doctorlist();
                            for (Doctor d : list1) {
                        %>  
                        <tr>
                            <td><%= d.getFullName() %></td>
                            <td><%= d.getDob() %></td>
                            <td><%= d.getQualification() %></td>
                            <td><%= d.getSpecialist() %></td>   
                            <td><%= d.getEmail() %></td>
                            <td><%= d.getMobno() %></td>
                            <td>
                                <a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                                <a href="delete_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-danger">Delete</a>
                                
                            </td>       
                        </tr>
                        <% } %>
                    </tbody>
                </table>
        </div>
        </div>
   
   </div>
</div>
</div>
</body>
</html>