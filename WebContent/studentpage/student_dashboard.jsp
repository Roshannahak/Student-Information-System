<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="studentdash.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<title>Dashboard</title>
</head>
<body>
	<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/sis";
	String user = "root";
	String password = "497557";
	
	String roll = request.getParameter("r");
	
	String query = "select firstname, lastname from students where roll_no = '"+roll+"' ";
	try{
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(query);
	while(rs.next()){
	%>
	<div class="wrapper">
		<!-- slider -->
		<div class="sidebar">
			<h2><%= rs.getString("firstname") %> <%= rs.getString("lastname") %></h2>
			<ul>
				<li><a href="#">Home</a></li>
				<li><a class = "pro" href="javascript:void(0);" onclick="profile();">Profile</a></li>
				<li><a href="#">Change Password</a></li>
				<li><a href="../index.jsp">Logout</a></li>
			</ul>
		</div>
	<%
	}
	}catch(Exception e){
		out.println("database error...");
	}
	%>
		<div class="main_content">
			
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$('.pro').click(function(){
				$('.main_content').load('/Student_information_system/studentpage/studentprofile.jsp', {"r": <%= roll %>});
			});
		});
	</script>
</body>
</html>