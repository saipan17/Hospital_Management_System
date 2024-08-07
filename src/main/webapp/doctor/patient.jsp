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
</style>
</head>
<body>
<%@include file = "navbar.jsp"%>

<c:if test = "${empty doctor}">
   <c:redirect url = "../doctor_login.jsp"></c:redirect>
   </c:if>
   
 <div class = "container-fluid backImg p-5">
    <p class = "text-center fs-2 text-white"></p>
</div>

  <div class = "container p-3">
  
      <div class = "row">
           <div class = "col-md-12">
           <div class = "card paint-card">
           <div class = "card-body">
             <p class = "fs-4 fw-bold text-center text-success">Patient List</p>
             
             <table class = "table">
             <thead>
             
             <tr>
             <th scope = "col">Full Name</th>
             <th scope = "col">Gender</th>
             <th scope = "col">Age</th>
             <th scope = "col">Appoint Date</th>
             <th scope = "col">Email</th>
             <th scope = "col">Mobile No</th>
             <th scope = "col">Disease</th>
             <th scope = "col">Status</th>
             <th scope = "col">Action</th>           
             </tr>
             
             </thead>  
             
             <tbody>
                       
             <%
             
             Doctor d = (Doctor) session.getAttribute("doctor");
             
             AppointmentDao dao = new AppointmentDao(DbConn.getConn());
             
             List <Appointment> list = dao.PatientListByDoctId(d.getId());
             
             for(Appointment ap : list){ %>
            
            	 <tr>
                 <th><%=ap.getFullName()%></th>
                 <td><%=ap.getGender()%></td>
                 <td><%=ap.getAge()%></td>
                 <td><%=ap.getAppoinDate()%></td>
                 <td><%=ap.getEmail()%></td>
                 <td><%=ap.getPhNo()%></td>
                 <td><%=ap.getDiseases()%></td>
                 <td><%=ap.getStatus()%></td>
                                
                 <td>
                 <%
                 if("Pending".equals(ap.getStatus())){%>
                 
                  <a href = "comment.jsp?id=<%=ap.getId()%>" class = "btn btn-success btn-sm">comment</a>
                   
                 <%} else{%>
                	 
                	 <a href = "#" class = "btn btn-success btn-sm disabled">Comment</a>
                 <%}
                 %>
                 
              </td>  
              </tr>
        	            	 
              <%
 	          	 
             }
           
             %>        
                    
             </tbody>
                     
             </table>
           </div>       
           </div>
           </div>
           </div>
    
</div>
</body>
</html>