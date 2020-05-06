<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OPJU</title>
</head>
<body>
	<%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/sis";
		String user = "root";
		String password = "497557";
		
		String roll = request.getParameter("d");
		
		String query = "delete from students where roll_no = '"+roll+"' ";
		
		try{
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, password);
			
			Statement st = conn.createStatement();
			st.executeUpdate(query);
			response.sendRedirect("student_details.jsp");
			
		}catch(Exception e){
			out.println("database connection error!!");
		}
	%>
</body>
</html>