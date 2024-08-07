<%@page import="com.entity.User"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.db.DbConn"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import= "com.entity.Doctor" %>
<%@page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css">
    .paint-card {
        box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
    }
    .backImg {
        background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),
        url("Images/background.jpg");
        height: 15vh;
        width: 100%;
        background-size: cover;
        background-repeat: no-repeat;
    }
</style>
</head>
<body>
<%@ include file="component/navbar.jsp" %>

<c:if test = "${empty newUser}">
   <c:redirect url = "user_login.jsp"></c:redirect>
   </c:if>

<div class = "container-fluid backImg p-5">
    <p class = "text-center fs-2 text-white"></p>
</div>

  <div class = "container p-3">
      <div class = "row">
           <div class = "col-md-9">
           <div class = "card paint-card">
           <div class = "card-body">
             <p class = "fs-4 fw-bold text-center text-success">Appointment List</p>
             
             <table class = "table">
             <thead>
             
             <tr>
             <th scope = "col">Full Name</th>
             <th scope = "col">Gender</th>
             <th scope = "col">Age</th>
             <th scope = "col">Appoint Date</th>
             <th scope = "col">Diseases</th>
             <th scope = "col">Doctor Name</th>
             <th scope = "col">Status</th>
             </tr>
             </thead>  
             
             <tbody>
                       
             <%
             User user = (User)session.getAttribute("newUser");  
             
             AppointmentDao dao = new AppointmentDao(DbConn.getConn()); 
             
             DoctorDao doctordao = new DoctorDao(DbConn.getConn());
                       
             List <Appointment> list =  dao.appointmentList(user.getId());
                
             for(Appointment ap : list){
                 
             Doctor d  = doctordao.getDoctorById(ap.getDoctorId());
           %>        
             <tr>
                     <th><%=ap.getFullName()%></th>
                     <td><%=ap.getGender()%></td>
                     <td><%=ap.getAge()%></td>
                     <td><%=ap.getAppoinDate()%></td>            
                     <td><%=ap.getDiseases()%></td>
                     <td><%=d.getFullName()%></td>
                     <td><%
                     
                     if("Pending".equals(ap.getStatus())){
                    	 
                    %>
                    <a href = "#" class = "btn btn-sm btn-warning">Pending</a>
                      	 
                    <% }else{ %>
                    	
                    	<h5>Ok</h5>
                     <%}
                                    
                     %></td>
                     
              </tr>
            	            	 
               <%}
                       
             %>            
             </tbody>
                      
             </table>
           </div>
           
           </div>
           </div>
           
           <div class = "col-md-3 p-3">
           
           <img alt = "" src = "Images/userdoctor1.jpg">
           </div>
           
           </div>
    
  </div>

</body>
</html>
