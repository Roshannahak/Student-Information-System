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
//database config
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/sis";
String user = "root";
String spassword = "497557";

//get student detail parameter
String rollno = request.getParameter("inroll");
String password = request.getParameter("inpass");
String first = request.getParameter("infirst");
String last = request.getParameter("inlast");
String age = request.getParameter("inage");
String phone = request.getParameter("inphone");
String email = request.getParameter("inemail");

//insertion query
String query = "insert into students values(?,?,?,?,?,?,?)";

try{
	//connect to database
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, spassword);
	PreparedStatement ps = conn.prepareStatement(query);
	
	ps.setString(1, rollno);
	ps.setString(2, password);
	ps.setString(3, first);
	ps.setString(4, last);
	ps.setString(5, age);
	ps.setString(7, phone);
	ps.setString(6, email);
	
	int x = ps.executeUpdate();
	
	if(x>0){
		out.println("submition successfull...");
	}
	else{
		out.println("error! student data not submited");
	}
}
catch(Exception e){
	out.println("database connection error..."+e);
}
%>
</body>
</html>