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

<div class="container-fluid backImg p-5">
    <p class="text-center fs-2 text-white"></p>
</div>

<div class="container p-3">
    <div class="row">
        <div class="col-md-6 p-5">
            <img alt="" src="Images/userdoctor1.jpg" class="img-fluid">
        </div>
        
        <div class="col-md-6">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="text-center fs-3">User Appointment</p>
                    
                    <c:if test="${not empty sucMes}">
                        <p class="text-center text-success fs-3">${sucMes}</p>
                        <c:remove var="sucMes" scope="session"/>
                    </c:if>
                    
                    <c:if test="${not empty errorMes}">
                        <p class="text-center text-danger fs-3">${errorMes}</p>
                        <c:remove var="errorMes" scope="session"/>
                    </c:if>
                    
                    <form class="row g-3" action="userappointment" method="POST">
                    
                       <input type="hidden" name="userid" value="${newUser.id}">
                        
                        <div class="col-md-6">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input required type="text" class="form-control" id="fullName" name="fullName">
                        </div>
                        
                        <div class="col-md-6">
                            <label for="gender" class="form-label">Gender</label>
                            <select class="form-control" id="gender" name="gender" required>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>
                        </div>
                        
                        <div class="col-md-6">
                            <label for="age" class="form-label">Age</label>
                            <input required type="number" class="form-control" id="age" name="age">
                        </div>
                        
                        <div class="col-md-6">
                            <label for="appoint_date" class="form-label">Appointment Date</label>
                            <input required type="date" class="form-control" id="appoint_date" name="appoint_date">
                        </div>
                        
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input required type="email" class="form-control" id="email" name="email">
                        </div>
                        
                        <div class="col-md-6">
                            <label for="phoneno" class="form-label">Phone No</label>
                            <input maxlength="10" required type="number" class="form-control" id="phoneno" name="phoneno">
                        </div>
                        
                        <div class="col-md-6">
                            <label for="deseases" class="form-label">Disease</label>
                            <input required type="text" class="form-control" id="dese" name="dises">
                        </div>
                        
                        <div class="col-md-6">
                            <label for="doct" class="form-label">Doctor</label>
                            <select required class="form-control" id="doct" name="doctor_id">
                            
                                <option value="">--Select--</option>
                                
                                <% DoctorDao d = new DoctorDao(DbConn.getConn());
                                  
                                   List <Doctor> list =   d.doctorlist();
                            		
                            	   for(Doctor doct : list){%>
                            		   
                            		   <option value = "<%=doct.getId()%>"><%=doct.getFullName()%> (<%=(doct.getSpecialist())%>)</option>
                            		   
                            	   <% }%>
                            		
                            </select>
                        </div>
                        
                        <div class="col-md-12">
                            <label>Full Address</label>
                            <textarea required rows="3" cols="" class="form-control" id="address" name="address"></textarea>
                        </div>
                       
                        <c:if test="${empty newUser}">
                            <a href="user_login.jsp" class="col-md-6 offset-md-3 mt-3 btn btn-success">Submit</a>
                        </c:if>
                        
                        <c:if test="${not empty newUser}">
                            <button class="col-md-6 offset-md-3 mt-3 btn btn-success">Submit</button>
                        </c:if>                       
                                      
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
