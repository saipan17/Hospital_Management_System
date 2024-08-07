<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
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
<title>All Patient Details Page</title>
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
            <p class="fs-3 text-center">Patient Details</p>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Full Name</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Age</th>
                        <th scope="col">Appoint Date</th>
                        <th scope="col">Email</th>
                        <th scope="col">Mob no</th>
                        <th scope="col">Disease</th>
                        <th scope ="col">Doctor Name</th>
                        <th scope ="col">Address</th>
                        <th scope ="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                      AppointmentDao ap = new AppointmentDao(DbConn.getConn());
                    
                      DoctorDao dao = new DoctorDao(DbConn.getConn());
                    
                      List<Appointment> list = ap.patientList();
                      
                      for(Appointment d : list){
                    	  
                    	  Doctor doct = dao.getDoctorById(d.getDoctorId());
                    	    
                    %>  
                    <tr>
                        <td><%= d.getFullName() %></td>
                        <td><%= d.getGender()%></td>
                        <td><%= d.getAge()%></td>
                        <td><%= d.getAppoinDate()%></td>   
                        <td><%= d.getEmail() %></td>
                        <td><%= d.getPhNo()%></td>
                        <td><%= d.getDiseases()%>
                        <td><%= doct.getFullName()%></td>
                        <td><%= d.getAddress()%></td>
                        <td><%= d.getStatus()%></td>
                           
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
