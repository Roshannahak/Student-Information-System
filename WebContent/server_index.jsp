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
String apassword = "497557";

String roll_id = request.getParameter("rollid");
String login_pass = request.getParameter("inpass");

//sql querys for admin and students
String admin_query = "select * from admin where admin_id = ? and password = ?";
String student_query = "select * from students where roll_no = ? and password = ?";

try{
	//connect to mysql database
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, apassword);

	//drop down selection parameter
	int choose = Integer.parseInt(request.getParameter("select"));
	
	//for admin
	if(choose == 1){
		PreparedStatement pt = conn.prepareStatement(admin_query);
		pt.setString(1, roll_id);
		pt.setString(2, login_pass);
		ResultSet rs = pt.executeQuery();
		
		if(!rs.next()){
			//shown error massage
			out.println("please enter valid id or password! admin doesn't exists");
		}
		else{
			//redirect admin dashboard
			response.sendRedirect("admin_dashboard.jsp");
		}
	}
	//for students
	else if(choose == 2){
		PreparedStatement pt = conn.prepareStatement(student_query);
		pt.setString(1, roll_id);
		pt.setString(2, login_pass);
		ResultSet rs = pt.executeQuery();
		
		if(!rs.next()){
			//shown error massage
			out.println("please enter valid roll.no and password! student doesn't exists in database");
		}
		else{
			//redirect student dashboard
			response.sendRedirect("studentpage/student_dashboard.jsp?r="+roll_id+" ");
		}
	}
}
catch(Exception e){
	System.out.println("database connection error: "+e);
}
%>
</body>
</html>