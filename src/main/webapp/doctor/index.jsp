<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DbConn"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored = "false" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>
<style type = "text/css">
.paint-card {

     box-shadow : 0 0 10px 0 rgba(0 , 0, 0, 0.3);

}
</style>
</head>
<body>
<%@include file = "navbar.jsp"%>

<c:if test = "${empty doctor}">
   <c:redirect url = "../doctor_login.jsp"></c:redirect>
   </c:if>
   
  <% 
  Doctor d  = (Doctor) session.getAttribute("doctor");
  DoctorDao dao = new DoctorDao(DbConn.getConn());
  
  %> 
   
 <div class = "container p-5">
     <div class = "row">
          <div class = "col-md-4 offset-md-2">
              <div class = "card paint-card">
                   <div class = "card-body text-center text-success">
                        <i class = "fas fa-user-md fa-3x"></i><br>
                        <p class = "fs-4 text-center">
                        Doctor <br> <%= dao.doctorCount()%>
                        </p>
                   </div>               
              </div>        
          </div>
          
 <div class = "col-md-4">
      <div class = "card paint-card">
           <div class = "card-body text-center text-success">
           <i class = "far fa-calendar-check fa-3x"></i><br>
           <p class = "fs-4 text-center">
           Total Appointment<br> <%= dao.appointmentCountByDoctorId(d.getId())%>
           </div>    
      </div>
 </div>         
     
</div>
 
 </div>  
   
   

</body>
</html>