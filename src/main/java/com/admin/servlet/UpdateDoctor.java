package com.admin.servlet;

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

@WebServlet("/updatedoctor")
public class UpdateDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fullName = req.getParameter("fullName");
		String dob = req.getParameter("dob");
		String qualification = req.getParameter("qualification");
		String specialist = req.getParameter("spec");
		String email =  req.getParameter("email");
		String mobno = req.getParameter("mobno");
		String password = req.getParameter("password");
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		Doctor d = new Doctor(id , fullName, dob , qualification , specialist, email , mobno, password);
		
	    DoctorDao dao = new DoctorDao(DbConn.getConn());
	    
	    HttpSession session = req.getSession();
	    
	    if(dao.updateDoctor(d)) {
	    	
	    	session.setAttribute("sucMes", "Doctor updated succesfully");
	    	resp.sendRedirect("admin/doctor.jsp");
	    }else {
	    	
	    	session.setAttribute("errorMes", "Something went wrong");
	    	resp.sendRedirect("admin/doctor.jsp");
	    }
		
	}	  
}
