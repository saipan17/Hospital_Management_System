package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.db.DbConn;
import com.entity.Appointment;
import com.entity.Doctor;

public class AppointmentDao {
	
	private Connection conn;
	
	public AppointmentDao(Connection conn) {
		
		super();
		this.conn = conn;
	}
	
	public boolean addAppointment(Appointment a) {
		
	boolean f = false;	
		
	String sql = "insert into appointment (user_id , fullName , gender , age, appoint_date , email , phno , diseases , doctor_id , address, status) values(?,?,?,?,?,?,?,?,?,?,?)";
			
		try {
			
	     PreparedStatement ps = conn.prepareStatement(sql);
	     
	     ps.setInt(1, a.getUseId());
	     ps.setString(2, a.getFullName());
	     ps.setString(3, a.getGender());
	     ps.setString(4, a.getAge());
	     ps.setString(5, a.getAppoinDate());
	     ps.setString(6, a.getEmail());
	     ps.setString(7, a.getPhNo());
         ps.setString(8, a.getDiseases());
         ps.setInt(9, a.getDoctorId());
         ps.setString(10, a.getAddress());
         ps.setString(11, a.getStatus());
         
         int i = ps.executeUpdate();
         
         if(i==1) {
        	 
        	 f = true;
         }
         		
		}catch(Exception e) {
			
			System.out.println(e);
		}
		
		return f;
	}
	
	
	 public List<Appointment> appointmentList(int userId){
		
	 List <Appointment> list = new ArrayList<Appointment>();
	 
	 Appointment ap = null;
	 
	 try {
		
	  String sql = "select *from appointment where user_id = ?";
	 
	  PreparedStatement ps = conn.prepareStatement(sql);
	  
	  ps.setInt(1, userId);
	  
	  ResultSet rs = ps.executeQuery();
	   
	 while(rs.next()) {
		 
		 ap = new Appointment();
		 
		 ap.setId(rs.getInt(1));
		 ap.setUseId(rs.getInt(2));
		 ap.setFullName(rs.getString(3));
		 ap.setGender(rs.getString(4));
		 ap.setAge(rs.getString(5));
		 ap.setAppoinDate(rs.getString(6));
		 ap.setEmail(rs.getString(7));
		 ap.setPhNo(rs.getString(8));
		 ap.setDiseases(rs.getString(9));
		 ap.setDoctorId(rs.getInt(10));
		 ap.setAddress(rs.getString(11));
		 ap.setStatus(rs.getString(12));
		 
		 list.add(ap);
	 }		 
	 }
	 catch(Exception e) {
		 
		 System.out.println(e);
	 }
	 
	 return list;
	}
	 
	 
	 public List<Appointment> PatientListByDoctId(int doctor_id){
			
		 List <Appointment> list = new ArrayList<Appointment>();
		 
		 Appointment ap = null;
		 
		 try {
			
		  String sql = "select *from appointment where doctor_id= ?";
		 
		  PreparedStatement ps = conn.prepareStatement(sql);
		  
		  ps.setInt(1, doctor_id);
		  
		  ResultSet rs = ps.executeQuery();
		   
		 while(rs.next()) {
			 
			 ap = new Appointment();
			 
			 ap.setId(rs.getInt(1));
			 ap.setUseId(rs.getInt(2));
			 ap.setFullName(rs.getString(3));
			 ap.setGender(rs.getString(4));
			 ap.setAge(rs.getString(5));
			 ap.setAppoinDate(rs.getString(6));
			 ap.setEmail(rs.getString(7));
			 ap.setPhNo(rs.getString(8));
			 ap.setDiseases(rs.getString(9));
			 ap.setDoctorId(rs.getInt(10));
			 ap.setAddress(rs.getString(11));
			 ap.setStatus(rs.getString(12));
			 
			 list.add(ap);
		 }		 
		 }
		 catch(Exception e) {
			 
			 System.out.println(e);
		 }
		 
		 return list;
		}
	 
	 
         public Appointment commentAppointment(int id){
					 
		 Appointment ap = null;
		 
		 try {
			
		  String sql = "select *from appointment where id = ?";
		 
		  PreparedStatement ps = conn.prepareStatement(sql);
		  
		  ps.setInt(1, id);
		  
		  ResultSet rs = ps.executeQuery();
		   
		 while(rs.next()) {
			 
			 ap = new Appointment();
			 
			 ap.setId(rs.getInt(1));
			 ap.setUseId(rs.getInt(2));
			 ap.setFullName(rs.getString(3));
			 ap.setGender(rs.getString(4));
			 ap.setAge(rs.getString(5));
			 ap.setAppoinDate(rs.getString(6));
			 ap.setEmail(rs.getString(7));
			 ap.setPhNo(rs.getString(8));
			 ap.setDiseases(rs.getString(9));
			 ap.setDoctorId(rs.getInt(10));
			 ap.setAddress(rs.getString(11));
			 ap.setStatus(rs.getString(12));	 
		 }		 
		 }
		 catch(Exception e) {
			 
			 System.out.println(e);
		 }
		 
		 return ap;
		} 
         
        public boolean updateCommentStatus(int id , int doct_id , String comm) {
        	
        	boolean f = false;
        	
        	try {
        		
        	String sql = "update appointment set status = ? where id = ? and doctor_id = ?";
        	
        	PreparedStatement ps = conn.prepareStatement(sql);
        	
        	ps.setString(1, comm);
        	ps.setInt(2, id);
        	ps.setInt(3, doct_id);
        	
        	int i = ps.executeUpdate();
        	
        	if(i==1){
        		
        		f = true;
        	}
        		
        	}
        	catch(Exception e){
        		
        		System.out.println(e);
        	}
        	
        	return f;
        }
	 
        
        public List<Appointment> patientList(){
			
   		 List <Appointment> list = new ArrayList<Appointment>();
   		 
   		 Appointment ap = null;
   		 
   		 try {
   			
   		  String sql = "select *from appointment order by id desc";
   		 
   		  PreparedStatement ps = conn.prepareStatement(sql);
   		  
   		  ResultSet rs = ps.executeQuery();
   		   
   		 while(rs.next()) {
   			 
   			 ap = new Appointment();
   			 
   			 ap.setId(rs.getInt(1));
   			 ap.setUseId(rs.getInt(2));
   			 ap.setFullName(rs.getString(3));
   			 ap.setGender(rs.getString(4));
   			 ap.setAge(rs.getString(5));
   			 ap.setAppoinDate(rs.getString(6));
   			 ap.setEmail(rs.getString(7));
   			 ap.setPhNo(rs.getString(8));
   			 ap.setDiseases(rs.getString(9));
   			 ap.setDoctorId(rs.getInt(10));
   			 ap.setAddress(rs.getString(11));
   			 ap.setStatus(rs.getString(12));
   			 
   			 list.add(ap);
   		 }		 
   		 }
   		 catch(Exception e) {
   			 
   			 System.out.println(e);
   		 }
   		 
   		 return list;
   		}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
}
