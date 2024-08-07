<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DbConn"%>
<%@page import = "com.entity.Doctor" %>
<%@page import = "com.entity.Specialist" %>
<%@page import = "java.util.List" %>
<%@page import="com.dao.SpecialistDao"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Doctors Page</title>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

<%@include file="navbar.jsp" %>

<div class="container mt-3">
    <div class="card paint-card">
        <div class="card-body">
            <p class="fs-3 text-center">Doctor Details</p>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Full Name</th>
                        <th scope="col">DOB</th>
                        <th scope="col">Qualification</th>
                        <th scope="col">Specialist</th>
                        <th scope="col">Email</th>
                        <th scope="col">Mob no</th>
                        <th scope="col">Action</th>
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
                            <a href="edit_doctor.jsp?id=<%= d.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                            <a href="delete_doctor.jsp?id=<%= d.getId()%>" class="btn btn-sm btn-danger">Delete</a>
                            
                        </td>       
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
