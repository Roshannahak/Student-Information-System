<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "editstyle.css">
<title>OPJU</title>
</head>
<body>
	<div class="wrapper">
		<div class="sidebar">
			<h2>Admin</h2>
			<ul>
				<li><a href="admin_dashboard.jsp">Home</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="student_details.jsp">Student Details</a></li>
				<li><a href="add_student.jsp">Add Student</a></li>
				<li><a href="index.html">Logout</a></li>
			</ul>
		</div>
		<div class="main_content">
			<div class = "addinfo"><h1>Update Student Details</h1></div>
			<div class = "main">
		<% 
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/sis";
		String user = "root";
		String password = "497557";
		
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		String getroll = request.getParameter("e");
		
		String query = "select roll_no, password, firstname, lastname, gender, age, phone_no, email, date_of_birth, local_address, city_name, state_name, students.course_id, students.branch_id, course_name, branch_name from branch, courses, students where roll_no = '"+getroll+"' and students.course_id = courses.course_id and students.branch_id = branch.branch_id ";
		
		try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, password);
		
		%>
		<form action="update.jsp" method = "post">
			<%
			st = conn.createStatement();
			rs = st.executeQuery(query);
			
			while(rs.next()){
			%>
			<h3 class = "name">Roll Number</h3>
			<input class = "cinroll" type = "text" name = "roll" required value = '<%= rs.getString("roll_no") %>'>
			
			<h3 class = "name">Password</h3>
			<input class = "cinpass" type = "text" name = "pass" required value = '<%= rs.getString("password") %>'>
			
			<div id = "name">
				<h3 class = "name">Name</h3>
				<h4 class = "cfirst">First name</h4>
				<input class = "cinfirst" type = "text" name = "first" required value = '<%= rs.getString("firstname") %>'>
				<h4 class = "clast">Last name</h4>
				<input class = "cinlast" type = "text" name = "last" value = '<%= rs.getString("lastname") %>'>
			</div>
			<div id = "genage">
				<h4 class = "gender">Gender</h4>
				<div class = "mf">
					<input class = "cmale" type = "radio" name = "gender" value = "male" <% if(rs.getString("gender").equals("male")){ %> checked = "checked" <% }else{} %>>
					<lable class = "clmale">male</lable>
					<input class = "cfemale" type = "radio" name = "gender" value = "female" <% if(rs.getString("gender").equals("female")){ %> checked = "checked" <% }else{} %>>
					<label class = "clfemale">female</label>
				</div>
				
				<div id = "age">
					<h4 class = "age">Age</h4>
					<input class = "cage" type = "number" name = "age" required value = '<%= rs.getString("age") %>'>
				</div>
			</div>
			
			<h3 class = "name">Date of Birth</h3>
			<input class = "cindob" type = "date" name = "dob" required value = '<%= rs.getString("date_of_birth") %>'>
			
			<h3 class = "name">Email</h3>
			<input class = "cinemail" type = "email" name = "email" value = '<%= rs.getString("email") %>'>
			
			<h3 class = "name">Phone Number</h3>
			<input class = "cinphone" type = "tel" name = "phone" required value = '<%= rs.getString("phone_no") %>'>
			
			<div id = "address">
				<h3 class = "name">Address</h3>
				
				<div class = "sstate">
					<h4 class = "cstate">State</h4>
					<input class = "cinstate" type = "text" name = "state" required value = '<%= rs.getString("state_name") %>'>
				</div>
				
				<div id = "scity">
					<h4 class = "ccity">City</h4>
					<input class = "cincity" type = "text" name = "city" required value = '<%= rs.getString("city_name") %>'>
				</div>
				
				<div id = "local">
					<h4 class = "clocal">local address</h4>
					<textarea class = "cinlocal" rows = "3" name = "local_a"><%= rs.getString("local_address") %></textarea>
				</div>
			</div>
			
			<h3 class = "name">Course</h3>
			<select class = "courseopt" name = "course" required>
				<option selected = "selected" value = '<%= rs.getString("course_id") %>'><%= rs.getString("course_name") %></option>
				<option value = "100">B.TECH</option>
				<option value = "101">M.TECH</option>
				<option value = "102">B.SC</option>
			</select>
			
			<h3 class = "name">branch</h3>
			<select class = "branchopt" name = "branch" required>
				<option selected = "selected" value = '<%= rs.getString("branch_id") %>'><%= rs.getString("branch_name") %></option>
				<option value = "500">computer science engineering</option>
				<option value = "501">electrical engineering</option>
				<option value = "502">civil engineering</option>
				<option value = "503">metallurgy and materials engineering</option>
				<option value = "504">mechanical engineering</option>
				<option value = "505">b.sc mathematics</option>
				<option value = "506">b.sc physiology</option>
				<option value = "507">b.sc chemistry</option>
			</select>
			
			<%
			}
			}catch(Exception e){
			out.println("database connection error!!...");
			}
			%>
			<div id = "btn">
				<button class = "btn" type = "submit">Update</button>
			</div>
		</form>
		</div>
		</div>
	</div>
</body>
</html>





