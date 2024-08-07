package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.*;

public class SpecialistDao{
	
	public Connection conn;

	public SpecialistDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addSpecilist(String spec_name) {
		
		boolean f = false;
		
		String sql = "insert into Specialist(spec_name) values(?)";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, spec_name);
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				
				f = true;
			}
		}
		catch(Exception e) {
			
			System.out.println(e);
		}
		
		return f;
	}	
	
	public List<Specialist> getAlllist(){
	
	    List <Specialist> doctorlist = new ArrayList<Specialist>();
	    
	    Specialist s = null;
	   
	    try {
	    	 String sql = "Select *from Specialist";
		        
	    	 PreparedStatement ps = conn.prepareStatement(sql);
	    	 
	         ResultSet rs = ps.executeQuery();
	         
	         while(rs.next()) {
	        
	        	 s = new Specialist();
	        	 
	        	 s.setId(rs.getInt(1));
	        	 s.setSpec_name(rs.getString(2));
	        	 
	        	 doctorlist.add(s);        	 
	         }
	    }    
	    catch(Exception e) {
	    	
	    	System.out.println(e);
	    }
		
	   return doctorlist; 
	}
}
