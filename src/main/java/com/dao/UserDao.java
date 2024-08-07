package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.User;

public class UserDao {
	
	private Connection conn;
	
	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	boolean f = false;
	
	public boolean register(User u) {
		
		try {
			
			String sql = "insert into user(fullName , email , password) values(?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1,u.getFullName());
			ps.setString(2,u.getEmail());
			ps.setString(3,u.getPassword());
			
			int res = ps.executeUpdate();
			
			if(res == 1) {
				
				f = true;
			}
			
		}catch(Exception e) {
			
			System.out.println(e);
		}
		
		return f;
	}
	
	public User loginDetails(String em , String paw) {
		
		User u = null;		
		String sql = "Select *from User where email = ? and password = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, em);
			ps.setString(2, paw);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
			  u = new User();
			  
			  u.setId(rs.getInt(1));
			  u.setFullName(rs.getString(2));
			  u.setEmail(rs.getString(3));
			  u.setPassword(rs.getString(4));
			  
			}
		} 
		
		catch (SQLException e) {
			e.printStackTrace();
		}
			
		return u;
	}
	
public boolean checkOldPsw(int user_id , String oldPsw) {
	
	    boolean f = false;
		
		try {
			
			String sql = "select *from user where id = ? and password = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
		    ps.setInt(1, user_id);
		    ps.setString(2, oldPsw);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				f = true;
			}
			
		}catch(Exception e) {
			
			System.out.println(e);
		}
		
		return f;
	}


    public boolean changePsw(int user_id , String newPsw) {

    boolean f = false;
	
	try {
		
		String sql = "update user set password = ? where id = ?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, newPsw);
		ps.setInt(2, user_id);
	     		
  		int i = ps.executeUpdate();
  		
  		if(i==1) {
  			
  			f = true;
  		}
		
		
	}catch(Exception e) {
		
		System.out.println(e);
	}
	
	return f;
}



	
	
	
}
