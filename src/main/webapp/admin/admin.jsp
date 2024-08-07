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
<title>Admin Main page</title>
<style type = "text/css">
.paint-card {

     box-shadow : 0 0 10px 0 rgba(0 , 0, 0, 0.3);

}
</style>

</head>
<body>
<%@ include file = "navbar.jsp" %>

   <c:if test ="${empty adminObj}">
   <c:redirect url="../admin_login.jsp"/>
   </c:if>
   
<h5 class = "text-center fs-3">Admin Dashboard</h5>

                          <c : if test = "${not empty SpecObj }">
						  <p class = "text-center text-success fs-3">${SpecObj}</p>
						  <c:remove var = "SpecObj" scope = "session"/>			   
						 </c : if>  
						 
						 <c : if test = "${not empty errorMess }">
						   <p class = "text-center text-success fs-3">${errorMess}</p>
						   <c:remove var = "errorMess" scope = "session"/>			   
						 </c : if>
						 
    <%

    DoctorDao dao = new DoctorDao(DbConn.getConn());

    %>						 						 
						 
<div class="row">
  <div class="col-md-4">
    <div class="card paint-card">
      <div class="card-body text-center text-success">
        <i class="fas fa-user-md fa-3x"></i><br/>
        <p class="fs-4 text-center">
          Doctor<br/><%= dao.doctorCount()%>
        </p>
      </div>
    </div>
  </div>
  
  <div class="col-md-4">
    <div class="card paint-card">
      <div class="card-body text-center text-success">
        <i class="fas fa-user-circle fa-3x"></i><br/>
        <p class="fs-4 text-center">
          User<br/><%= dao.userCount()%>
        </p>
      </div>
    </div>
  </div>
  
  <div class="col-md-4">
    <div class="card paint-card">
      <div class="card-body text-center text-success">
        <i class="far fa-calendar-check fa-3x"></i><br/>
        <p class="fs-4 text-center">
          Total Appoitment<br/><%=dao.appointmentCount()%>
        </p>
      </div>
    </div>
  </div>
  
  <div class="col-md-4 mt-2">
    <div class="card paint-card" data-bs-toggle = "model"
     data-bs-target = "#exampleModal" data-toggle="modal" data-target="#exampleModal">
      <div class="card-body text-center text-success">
        <i class="far fa-calendar-check fa-3x"></i><br/>
        <p class="fs-4 text-center">
          Specialist<br/><%=dao.specialistCount()%>
        </p>
      </div>
    </div>
  </div> 
  </div>
  

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form action = "../adminSpecialist" method = "post">
       
       <div class = "form-group">
          <label>Enter Specialist Name </label>
          <input type = "text" name = "specName" class = "form-control">
          
       </div>
       
       <div class = "text-center mt-3">
            <button type = "submit" class = "btn btn-primary">Add</button>
       </div>
       
      <div>
           
      </div> 
       
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>