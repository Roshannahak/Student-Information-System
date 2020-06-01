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
}
