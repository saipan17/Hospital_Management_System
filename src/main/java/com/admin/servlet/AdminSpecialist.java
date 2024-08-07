package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DbConn;
import com.entity.User;

@WebServlet("/adminSpecialist")
public class AdminSpecialist extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String specName = req.getParameter("specName");
		
		SpecialistDao special = new SpecialistDao(DbConn.getConn());
		
		boolean res = special.addSpecilist(specName);
		
		HttpSession session = req.getSession();
		
		if(res) {
			
			session.setAttribute("SpecObj", "Specialist added");
			resp.sendRedirect("admin/admin.jsp");		 			
		}
		
		else{
			
			session.setAttribute("errorMess", "invalid login Id & password");
			resp.sendRedirect("admin_login.jsp");
		}
	}

	
	   
}
