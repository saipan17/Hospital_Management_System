<%@page import="java.util.List"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DbConn"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored = "false" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Details</title>
<style type = "text/css">

.paint-card {

     box-shadow : 0 0 10px 0 rgba(0 , 0, 0, 0.3);

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
<%@include file = "navbar.jsp"%>

<c:if test = "${empty doctor}">
   <c:redirect url = "../doctor_login.jsp"></c:redirect>
   </c:if>
   
 <div class = "container-fulid backImg p-5">
      <p class = "text-center fs-2 text-white"></p>
  </div>
  
  <div class = "container p-3">
  <div class = "row">
   
    <div class = "col-md-6 offset-md-3">
    <div class = "card paint-card">
    <div class = "card-body">
    <p class = "text-center fs-4">Patient Comment</p>
    
    <form class = "row" action = "../updatestatus" method = "post">
    
         <%
         int id = Integer.parseInt(request.getParameter("id"));
         
         AppointmentDao ad = new AppointmentDao(DbConn.getConn());
         
         Appointment ap = ad.commentAppointment(id);
                
         %>
         
         <div class = "col-md-6">
         <label>Patient Name</label><input type = "text" readonly
         class = "form-control" value = "<%=ap.getFullName()%>">
         </div>
         
          <div class = "col-md-6">
         <label>Age</label><input type = "text" readonly
         class = "form-control"  value = "<%=ap.getAge()%>">
         </div>
         
          <div class = "col-md-6">
         <label>Mobile No</label><input type = "text" readonly
         class = "form-control"  value = "<%=ap.getPhNo()%>">
         </div>
         
          <div class = "col-md-6">
         <label>Diseases</label><input type = "text" readonly
         class = "form-control" value = "<%=ap.getDiseases()%>">
         </div>
         
         <div class = "col-md-12">
         <br><label>Comment</label>
         <textarea required name = "comm" class = "form-control" row = "3"
         cols = ""></textarea>
         </div>
         
         <input type = "hidden" name = "id" value = "<%=ap.getId()%>">
         
         <input type = "hidden" name = "did" value = "<%=ap.getDoctorId()%>">
         
         <button class = "mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
         
    </form>
    
    </div>
    </div>
    </div>
  </div>     
</div>
</body>
</html>