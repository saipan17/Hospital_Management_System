package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DbConn;
import com.entity.Appointment;

@WebServlet("/userappointment")
public class UserAppointment extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int userid = Integer.parseInt(req.getParameter("userid"));	
		String fullName = req.getParameter("fullName");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appoint_date = req.getParameter("appoint_date");
		
		String email = req.getParameter("email");
		
		String phno = req.getParameter("phoneno");
		
		String diseases = req.getParameter("dises");
		
		int doctor_id = Integer.parseInt(req.getParameter("doctor_id"));
		
		String address = req.getParameter("address");
	   
	    Appointment ap = new Appointment(userid, fullName , gender , age , appoint_date , email , phno , diseases , doctor_id , address, "Pending");
	   
	    AppointmentDao dao = new AppointmentDao(DbConn.getConn());	
	    
	    boolean res = dao.addAppointment(ap);
	    
	    HttpSession session = req.getSession();
	    
	    if(res) {
	    	
	    	session.setAttribute("sucMes", "User take appointment succesfully");
	    	resp.sendRedirect("view_appointment.jsp");
	    }
	    else {
	    	
	    	session.setAttribute("errorMes", "Something is wrong");
	    	resp.sendRedirect("");
	    }
	   	
	}	
}
