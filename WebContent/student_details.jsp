<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "student_details.css">
<script src="https://use.fontawesome.com/89c5ec223f.js"></script>
<meta charset="ISO-8859-1">
<title>OPJU</title>
</head>
<body>
		<h1 class = "stext">Student details</h1><hr>
		<table id = "table">
			<tr>
				<th>Roll number</th>
				<th>Name</th>
				<th>Age</th>
				<th>Email</th>
				<th>course</th>
				<th>branch</th>
				<th>Task</th>
			</tr>
			<%
				String driver = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/sis";
				String user = "root";
				String db_password = "497557";
				
				String query = "select roll_no, firstname, lastname, age, gender, email, course_name, branch_name from students as s, courses as c, branch as b where s.course_id = c.course_id and s.branch_id = b.branch_id";
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
							<td><%= rs.getString(6) %></td>
							<td><%= rs.getString(7) %></td>
							<td><%= rs.getString(8) %></td>
							<td>
								<a class = "view" href="#"><i class="fa fa-eye" aria-hidden="true"></i></a>
								<a class = "edit" href="edit.jsp?e=<%= rs.getString(1) %>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
								<a class = "del" href="delete.jsp?d=<%= rs.getString(1) %>"><i class="fa fa-trash" aria-hidden="true"></i></a>
							</td>
						</tr>
					<%
					}
				}catch(Exception e){
					out.println("database connection error...");
				}
			%>
		</table>
</body>
</html>