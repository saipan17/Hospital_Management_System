package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DbConn;
import com.entity.Doctor;

@WebServlet("/editprofile")
public class EditProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fullName = req.getParameter("fullName");
		String dob = req.getParameter("dob");
		String qualification = req.getParameter("qualification");
		String specialist = req.getParameter("spec");
		String email =  req.getParameter("email");
		String mobno = req.getParameter("mobno");
		
		int id = Integer.parseInt(req.getParameter("uid"));
		
		Doctor d = new Doctor(id , fullName, dob , qualification , specialist, email , mobno, "");
		
	    DoctorDao dao = new DoctorDao(DbConn.getConn());
	    
	    HttpSession session = req.getSession();
	    
	    if(dao.editDoctor(d)){
	    	
	    	session.setAttribute("doctor", "Doctor updated succesfully");
	    	resp.sendRedirect("doctor/index.jsp");
	    }
	    else {
	    	
	    	session.setAttribute("errorMes", "Something went wrong");
	    	resp.sendRedirect("doctor/edit_profile.jsp");
	    }
		
	}	  
}
	    

