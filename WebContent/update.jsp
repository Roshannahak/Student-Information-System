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
	
	String uroll = request.getParameter("roll");
	String upass = request.getParameter("pass");
	String ufirst = request.getParameter("first");
	String ulast = request.getParameter("last");
	String ugen = request.getParameter("gender");
	String uage = request.getParameter("age");
	String udob = request.getParameter("dob");
	String uemail = request.getParameter("email");
	String uphone = request.getParameter("phone");
	String ustate = request.getParameter("state");
	String ucity = request.getParameter("city");
	String uloc_a = request.getParameter("local_a");
	String ucourse = request.getParameter("course");
	String ubranch = request.getParameter("branch");
	
	String update_query = "update students set password = ?, firstname = ?, lastname = ?, gender = ?, age = ?, phone_no = ?, email = ?, date_of_birth = ?, local_address = ?, city_name = ?, state_name = ?, course_id = ?, branch_id = ? where roll_no = '"+uroll+"' ";
	
	try{
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, password);
		
		PreparedStatement pt = conn.prepareStatement(update_query);
		
		pt.setString(1, upass);
		pt.setString(2, ufirst);
		pt.setString(3, ulast);
		pt.setString(4, ugen);
		pt.setString(5, uage);
		pt.setString(8, udob);
		pt.setString(7, uemail);
		pt.setString(6, uphone);
		pt.setString(11, ustate);
		pt.setString(10, ucity);
		pt.setString(9, uloc_a);
		pt.setString(12, ucourse);
		pt.setString(13, ubranch);
		
		pt.executeUpdate();
		
		response.sendRedirect("student_details.jsp");
		
	}catch(Exception e){
		out.println("database connection error!!");
	}
%>
</body>
</html>