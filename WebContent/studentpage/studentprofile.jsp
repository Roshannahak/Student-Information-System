<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="studentprofile.css">
<title>Profile</title>
</head>
<body>
	<%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/sis";
		String user = "root";
		String password = "497557";
		
		String roll = request.getParameter("r");
	
		String query = "select firstname, lastname, roll_no, password, gender, age, phone_no, email, date_of_birth, local_address, city_name, state_name, course_name, branch_name from students, branch, courses where roll_no = '"+roll+"' and students.course_id = courses.course_id and students.branch_id = branch.branch_id "; 
		
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, password);
		%>
	<h2 class="Htext">Profile</h2><hr>
	<div class="main">
		<form action="profile_update.jsp?r=<%= roll %>" method="POST">
		<%
		st = conn.createStatement();
		rs = st.executeQuery(query);
		while(rs.next()){
		%>
			<div class="div2">
				<h4>Name:</h4>
				<input type="text" value = "<%= rs.getString("firstname") %> <%= rs.getString("lastname") %>" readonly="readonly">
			</div>
			<div class="div1">
				<h4>Roll Number:</h4>
				<input type="text" value = "<%= rs.getString("roll_no") %>" readonly="readonly">
				<h4>Password:</h4>
				<input type="password" value = "<%= rs.getString("password") %>" readonly="readonly">
			</div>
			<div class="div3">
				<h4>Gender:</h4>
				<input type="text" value = "<%= rs.getString("gender") %>" readonly="readonly">
				<h4>Age:</h4>
				<input type="Number" class="agein" value = "<%= rs.getString("age") %>" readonly="readonly">
			</div>
			<div class="div4">
				<h4>Date Of Birth:</h4>
				<input type="text" value = "<%= rs.getString("date_of_birth") %>" readonly="readonly">
				<h4>Phone no:</h4>
				<input type="Number" class="phonein" name="phonein" value = "<%= rs.getString("phone_no") %>">
			</div>
			<div class="div5">
				<h4>Email:</h4>
				<input type="text" name="emailin" value = "<%= rs.getString("email") %>">
			</div>
			<div class="div6">
				<h4>Address:</h4>
				<textarea rows = "3" name = "local_a"><%= rs.getString("local_address") %></textarea>
			</div>
			<div class="div7">
				<h4>City:</h4>
				<input type="text" value = "<%= rs.getString("city_name") %>" readonly="readonly">
				<h4>State:</h4>
				<input type="text" class="statein" value = "<%= rs.getString("state_name") %>" readonly="readonly">
			</div>
			<div class="div8">
				<h4>Course:</h4>
				<input type="text" value = "<%= rs.getString("course_name") %>" readonly="readonly">
			</div>
			<div class="div9">
				<h4>Branch:</h4>
				<input type="text" value = "<%= rs.getString("branch_name") %>" readonly="readonly">
			</div>
			<%
			}
			%>
			<button class = "btn" type = "submit">Update</button>
		</form>
	</div>
</body>
</html>