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
import com.entity.User;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fullName = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User user = new User(fullName , email , password);
		
		UserDao u = new UserDao(DbConn.getConn());
		
		HttpSession session = req.getSession();
		
		boolean res = u.register(user);
			
		if(res) {
			
			session.setAttribute("sucMes", "Saved Succesfully");
			resp.sendRedirect("signup.jsp");		
		}
		else {
			
			session.setAttribute("errorMes", "Not Saved Succesfully");
			resp.sendRedirect("signup.jsp");
		}
		
	}
}
