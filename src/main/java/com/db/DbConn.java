package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConn {
	
	private static Connection con;
	
	public static Connection getConn() {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db" , "root", "12345");
			
			
		}catch(Exception e) {
			
			System.out.println(e);
		}
		
		return con;
	}
}
