<%@page import="com.db.DbConn"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Doctor </title>
</head>
<body>

<%

int doct_id = Integer.parseInt(request.getParameter("id"));

DoctorDao dao = new DoctorDao(DbConn.getConn());

boolean res = dao.deleteDoctor(doct_id);

HttpSession http = request.getSession();

if(res){
	
	http.setAttribute("sucMes", "Deleted Sucessfully");
	response.sendRedirect("edit_doctor.jsp");
}else{
	
	http.setAttribute("errorMes", "Something went wrong");
	response.sendRedirect("edit_doctor.jsp");
}

%>

</body>
</html>