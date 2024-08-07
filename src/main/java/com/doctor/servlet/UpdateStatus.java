package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DbConn;

@WebServlet("/updatestatus")
public class UpdateStatus extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int id = Integer.parseInt(req.getParameter("id"));
		int did = Integer.parseInt(req.getParameter("did"));
		
	   String comment = req.getParameter("comm");
		
	   AppointmentDao ap = new AppointmentDao(DbConn.getConn());
	   
	   HttpSession session = req.getSession();
	   
	   if(ap.updateCommentStatus(id, did, comment)) {
		   
		  session.setAttribute("sucMsg", "Status Changed");
		  resp.sendRedirect("doctor/patient.jsp");
		  
	   }else {
		   	   
		   session.setAttribute("errorMsg", "Something wrong on server");
		   resp.sendRedirect("doctor/comment.jsp");
	   }

		
	}

	
}
