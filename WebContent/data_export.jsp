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
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "attachment; filename=StudentDetails.xls");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/sis";
	String user = "root";
	String password = "497557";
	
	String query = "select roll_no, firstname, lastname, gender, age, phone_no, email, date_of_birth, local_address, city_name, state_name, course_name, branch_name from students, courses, branch where students.course_id = courses.course_id and students.branch_id = branch.branch_id order by firstname";
	
	try{%>
		<table border="1">
			<tr>
				<th>Roll Number</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Gender</th>
				<th>Age</th>
				<th>Phone Number</th>
				<th>Email</th>
				<th>Date Of Birth</th>
				<th>Local Address</th>
				<th>City Name</th>
				<th>State Name</th>
				<th>Course Name</th>
				<th>Branch Name</th>
			</tr>
			<%
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, password);
			
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()){
			%>
			
			<tr>
				<td><%= rs.getString("roll_no") %></td>
				<td><%= rs.getString("firstname") %></td>
				<td><%= rs.getString("lastname") %></td>
				<td><%= rs.getString("gender") %></td>
				<td><%= rs.getString("age") %></td>
				<td><%= rs.getString("phone_no") %></td>
				<td><%= rs.getString("email") %></td>
				<td><%= rs.getString("date_of_birth") %></td>
				<td><%= rs.getString("local_address") %></td>
				<td><%= rs.getString("city_name") %></td>
				<td><%= rs.getString("state_name") %></td>
				<td><%= rs.getString("course_name") %></td>
				<td><%= rs.getString("branch_name") %></td>
			</tr>
			
			<%} %><!-- while loop end bracket -->
		</table>
	<%}catch(Exception e){
		out.println("error....");
	}
	%>
</body>
</html>