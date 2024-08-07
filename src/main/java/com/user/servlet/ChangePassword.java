package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DbConn;

@WebServlet("/changepassword")
public class ChangePassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NumberFormatException {
		
	  int userid = Integer.parseInt(req.getParameter("id"));
	  String oldPsw = req.getParameter("oldPsw");
	  String newPsw = req.getParameter("newPsw");
	  
	  UserDao dao = new UserDao(DbConn.getConn());
	  
	  HttpSession session = req.getSession();
	  
	  if(dao.checkOldPsw(userid, oldPsw)) {
		  
		  if(dao.changePsw(userid, newPsw)) {
			  
			  session.setAttribute("msg", "Password change Succefully");
			  resp.sendRedirect("user_login.jsp");
			  
		  }
		  else {
			  session.setAttribute("error" , "Something is wrong");
			  resp.sendRedirect("change_password.jsp");
			  
		  }
	  }
	   else{
		  
		  session.setAttribute("error", "Old Password is wrong");
		  resp.sendRedirect("change_password.jsp");
		  
	   }
	}}