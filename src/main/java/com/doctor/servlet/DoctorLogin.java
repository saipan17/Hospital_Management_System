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

@WebServlet("/doctorlogin")
public class DoctorLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String psw = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		DoctorDao dao = new DoctorDao(DbConn.getConn());
		
		Doctor doctor = dao.login(email, psw);
				
		if(doctor != null) {
			
			session.setAttribute("doctor", doctor);
			resp.sendRedirect("doctor/index.jsp");
		}
		else{
			
			session.setAttribute("errorMes", "Invalid email or password");
			resp.sendRedirect("doctor_login.jsp");
		}
	}
 
	 
}
