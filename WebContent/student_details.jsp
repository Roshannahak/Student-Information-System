<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href = "studentdetails.css">
<script src="https://use.fontawesome.com/89c5ec223f.js"></script>
<meta charset="ISO-8859-1">
<title>OPJU</title>
</head>
<body>
	<div class="wrapper">
		<div class="sidebar">
			<h2>Admin</h2>
			<ul>
				<li><a href="admin_dashboard.jsp">Home</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="detail.html">Student Details</a></li>
				<li><a href="add_student.jsp">Add Student</a></li>
				<li><a href="index.jsp">Logout</a></li>
			</ul>
		</div><!-- sidebar -->
		<div class="main_content">
			<h1 class = "stext">Student details</h1><hr>
			<div class = "searchex">
				<div class = "export">
					<form action="data_export.jsp" method="POST">
						<input type="submit" class="btn" value="Export in Excel">
					</form>
				</div>
				<div class = "search">
					<form action="" method="POST">
						<input type="text" class = "searchin" name = "search" placeholder="Search here">
					</form>
				</div>
			</div>
			<div class = "main">
				<div class = "table_style">
					<table id = "table">
						<tr>
							<th>Roll number</th>
							<th>Name</th>
							<th>course</th>
							<th>branch</th>
							<th>Task</th>
						</tr>
			<%
				String driver = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/sis";
				String user = "root";
				String db_password = "497557";
				
				String query;
				
				String searchre = request.getParameter("search");
				if(searchre != null){
					query = "select roll_no, firstname, lastname, course_name, branch_name from students as s, courses as c, branch as b where s.course_id = c.course_id and s.branch_id = b.branch_id and firstname like '"+searchre+"' ";
				}else{
					query = "select roll_no, firstname, lastname, course_name, branch_name from students as s, courses as c, branch as b where s.course_id = c.course_id and s.branch_id = b.branch_id";
				}
				try{
					Class.forName(driver);
					Connection conn = DriverManager.getConnection(url, user, db_password);
					
					Statement st = conn.createStatement();
					ResultSet rs = st.executeQuery(query);
					while(rs.next()){
					%>
						<tr>
							<td><%= rs.getString(1) %></td>
							<td><%= rs.getString(2)+" "+rs.getString(3) %></td>
							<td><%= rs.getString(4) %></td>
							<td><%= rs.getString(5) %></td>
							<td>
								<div class = "crud_icon">
									<a class = "view" href="view.jsp?v=<%= rs.getString(1) %>"><i class="fa fa-eye" aria-hidden="true"></i></a>
									<a class = "edit" href="edit.jsp?e=<%= rs.getString(1) %>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
									<a class = "del" href="delete.jsp?d=<%= rs.getString(1) %>"><i class="fa fa-trash" aria-hidden="true"></i></a>
								</div>
							</td>
						</tr>
					<%
					}
				}catch(Exception e){
					out.println("database connection error...");
				}
			%>
				</table>
			</div>
			<div class = "right">
				<div class = "right_main">
					<h2 class = "rhead">Details</h2>
					<div class = "content">
						<div class = "rroll">
							<span>Roll Number:</span>  <span>${getroll}</span>
						</div>
						<div class = "rname">
							<span>Name:</span>  <span>${getfirst}</span>
						</div>
						<div class = "rgender">
							<span>Gender:</span>  <span>${getgender}</span>
						</div>
						<div class = "rage">
							<span>Age:</span>  <span>${getage}</span>
						</div>
						<div class = "rdob">
							<span>Date Of Birth:</span>  <span>${getdob}</span>
						</div>
						<div class = "remail">
							<span>Email:</span>  <span>${getemail}</span>
						</div>
						<div class = "rphone">
							<span>Phone Number:</span>  <span>${getphone}</span>
						</div>
						<div class = "rstate">
							<span>State:</span>  <span>${getstate}</span>
						</div>
						<div class = "rcity">
							<span>City:</span>  <span>${getcity}</span>
						</div>
						<div class = "rlocal">
							<span>Local Address:</span>  <span>${getlocal}</span>
						</div>
						<div class = "rcourse">
							<span>Course:</span>  <span>${getcourse}</span>
						</div>
						<div class = "rbranch">
							<span>Branch:</span>  <span>${getbranch}</span>
						</div>
					</div>
				</div>
			</div><!-- right -->
		</div><!-- main -->
		</div><!-- main_content -->
	</div><!-- wrapper -->
</body>
</html>