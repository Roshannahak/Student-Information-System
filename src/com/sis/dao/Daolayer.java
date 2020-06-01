package com.sis.dao;

import java.sql.*;

public class Daolayer {
	
	Connection conn = null;
	PreparedStatement pt = null;
	Statement st = null;
	ResultSet rs = null;
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/sis";
	String user = "root";
	String password = "497557";
	
	String query = null;
	
	//Admin
	public Boolean admincheck(String id, String pass) {
		
		query = "select * from admin where admin_id = ? and password = ?";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
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
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
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
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
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
}
