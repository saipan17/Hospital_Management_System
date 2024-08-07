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

@WebServlet("/userLogin")
public class userLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		UserDao u  = new UserDao(DbConn.getConn());
		
		User user = u.loginDetails(email, password);
		
		if(user != null) {
			
			session.setAttribute("newUser", user);
			resp.sendRedirect("index.jsp");
		}
		else {
			
			session.setAttribute("errorMes", "Invalid  email or password");
			resp.sendRedirect("user_login.jsp");
		}
	}

	 
}
