<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update</title>
</head>
<body>
	<%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/sis";
		String user = "root";
		String password = "497557";
		
		String roll = request.getParameter("r");
		String phone = request.getParameter("phonein");
		String email = request.getParameter("emailin");
		String local = request.getParameter("local_a");
		
		String query = "update students set phone_no = ?, email = ?, local_address = ? where roll_no = "+roll+" ";
		
		try{
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, password);
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, phone);
			ps.setString(2, email);
			ps.setString(3, local);
			ps.executeUpdate();
			
			
		}catch(Exception e){
			out.println("database connection error..."+e);
		}
	%>
</body>
</html>