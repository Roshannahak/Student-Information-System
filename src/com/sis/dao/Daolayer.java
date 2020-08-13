package com.sis.dao;

import java.sql.*;

public class Daolayer {
	
	PreparedStatement pt = null;
	Statement st = null;
	ResultSet rs = null;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/sis";
	private String user = "root";
	private String password = "497557";
	
	String query = null;
	
	//load driver and connection 
	protected Connection getconnection() {
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//Admin
	public Boolean admincheck(String id, String pass) {
		
		query = "select * from admin where admin_id = ? and password = ?";
		
		try {Connection conn = getconnection();
			pt = conn.prepareStatement(query);
			pt.setString(1, id);
			pt.setString(2, pass);
			rs = pt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			System.out.println("error...."+ e);
		}
		return false;
	}
	
	//Student
	public Boolean studentcheck(String id, String pass) {
		
		query = "select * from students where roll_no = ? and password = ?";
		
		try {Connection conn = getconnection();
			pt = conn.prepareStatement(query);
			pt.setString(1, id);
			pt.setString(2, pass);
			rs = pt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			System.out.println("error..."+ e);
		}
		
		return false;
	}
	
	//Add student
	public Boolean newstudent(String roll, String pass, String first, String last, String gender, String age, String dob, String email, String phone, String state, String city, String local, String course, String branch) {
		
		query = "select * from students where roll_no = ?";
		
		try {Connection conn = getconnection();
			pt = conn.prepareStatement(query);
			pt.setString(1, roll);
			rs = pt.executeQuery();
			
			//student roll number not exist
			if(!rs.next()) {
				
				String insert_query = "insert into students values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				//insert new student information
				pt = conn.prepareStatement(insert_query);
				pt.setString(1, roll);
				pt.setString(2, pass);
				pt.setString(3, first);
				pt.setString(4, last);
				pt.setString(5, gender);
				pt.setString(6, age);
				pt.setString(7, phone);
				pt.setString(8, email);
				pt.setString(9, dob);
				pt.setString(10, local);
				pt.setString(11, city);
				pt.setString(12, state);
				pt.setString(13, course);
				pt.setString(14, branch);
				
				int x = pt.executeUpdate();
				if(x>0){
					return true;
				}
				
			}
		}catch(Exception e) {
			System.out.println("error..."+ e);
		}
		return false;
	}
	
	//access total number of students
	public int total() {
		
		String tquery = "select count(*) from students";
		try {Connection conn = getconnection();
			st = conn.createStatement();
			rs = st.executeQuery(tquery);
			if(rs.next()) {
				int a = rs.getInt(1);
				return a;
			}
		}catch(Exception e) {
			System.out.println("error..."+ e);
		}
		return 0;
	}
	
	//access total number of boys
	public int totalboys() {
			
		String bquery = "select count(*) from students where gender = 'male'";
		try {Connection conn = getconnection();
			st = conn.createStatement();
			rs = st.executeQuery(bquery);
			if(rs.next()) {
				int a = rs.getInt(1);
				return a;
			}
		}catch(Exception e) {
			System.out.println("error..."+ e);
		}
		return 0;
	}
	
	//access total number of girls
		public int totalgirls() {
				
			String gquery = "select count(*) from students where gender = 'female'";
			try {Connection conn = getconnection();
				st = conn.createStatement();
				rs = st.executeQuery(gquery);
				if(rs.next()) {
					int a = rs.getInt(1);
					return a;
				}
			}catch(Exception e) {
				System.out.println("error..."+ e);
			}
			return 0;
		}
}
