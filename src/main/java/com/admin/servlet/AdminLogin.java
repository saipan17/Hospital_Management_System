package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String email = req.getParameter("email");
		
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		try {
			
			if("saipan@gmail.com".equals(email) && "12345".equals(password)) {
				
				session.setAttribute("adminObj", new User());
				resp.sendRedirect("admin/admin.jsp");
			}
			
			else {
				
				session.setAttribute("errorMes", "Invalid email or password");
				resp.sendRedirect("admin_login.jsp");
			}
			
			
		}catch(Exception e ) {
			
			System.out.println(e);
		}
		
	}	
}
