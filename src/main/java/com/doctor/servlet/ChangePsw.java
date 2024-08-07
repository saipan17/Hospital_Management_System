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

@WebServlet("/changepsw")
public class ChangePsw extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NumberFormatException {
		
		int doct_id = Integer.parseInt(req.getParameter("did"));
		String oldPsw = req.getParameter("oldPsw");
		String newPsw = req.getParameter("newPsw");
		
		DoctorDao dao = new DoctorDao(DbConn.getConn());
		
		  HttpSession session = req.getSession();
		  
		  if(dao.checkOldPsw(doct_id, oldPsw)) {
			  
			  if(dao.changePsw(doct_id, newPsw)) {		  
				  session.setAttribute("sucMsg", "Password changed Successfully");
				  resp.sendRedirect("./doctor_login.jsp");
				  
			  }
			  else {
				  session.setAttribute("errorMsg" , "Something is wrong");
				  resp.sendRedirect("doctor/edit_profile.jsp");
				  
			  }
		  }
		   else{		  
			  session.setAttribute("errorMsg", "Old Password is wrong");
			  resp.sendRedirect("doctor/edit_profile.jsp");
			  
		   }
		}}
