<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="addstudent.css">
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
				<li><a href="index.jsp">Logout</a></li>
			</ul>
		</div>
		<div class="main_content">
			<div class = "response1">
				<p class = "success">${result}</p>
			</div>
			<div class = "response2">
				<p class = "failed">${error}</p>
			</div>
			<div class = "response3">
				<p class = "alert">${alert}</p>
			</div>
			<div class = "addinfo"><h1>Add Student Info</h1></div>
			<div class = "main">
			<form action="add_student_server.jsp" method = "post">
				<h3 class = "name">Roll Number</h3>
				<input class = "cinroll" type = "text" name = "roll" required>
			
			<h3 class = "name">Password</h3>
			<input class = "cinpass" type = "password" name = "pass" required>
			
			<div id = "name">
				<h3 class = "name">Name</h3>
				<h4 class = "cfirst">First name</h4>
				<input class = "cinfirst" type = "text" name = "first" required>
				<h4 class = "clast">Last name</h4>
				<input class = "cinlast" type = "text" name = "last">
			</div>
			<div id = "genage">
				<h4 class = "gender">Gender</h4>
				<div class = "mf">
					<input class = "cmale" type = "radio" name = "gender" value = "male">
					<lable class = "clmale">male</lable>
					<input class = "cfemale" type = "radio" name = "gender" value = "female">
					<label class = "clfemale">female</label>
				</div>
				
				<div id = "age">
					<h4 class = "age">Age</h4>
					<input class = "cage" type = "number" name = "age" required>
				</div>
			</div>
			
			<h3 class = "name">Date of Birth</h3>
			<input class = "cindob" type = "date" name = "dob" required>
			
			<h3 class = "name">Email</h3>
			<input class = "cinemail" type = "email" name = "email" placeholder = "example@gmail.com">
			
			<h3 class = "name">Phone Number</h3>
			<input class = "cinphone" type = "tel" name = "phone" required placeholder = "123-45-678-91">
			
			<div id = "address">
				<h3 class = "name">Address</h3>
				
				<div class = "sstate">
					<h4 class = "cstate">State</h4>
					<input class = "cinstate" type = "text" name = "state" required>
				</div>
				
				<div id = "scity">
					<h4 class = "ccity">City</h4>
					<input class = "cincity" type = "text" name = "city" required>
				</div>
				
				<div id = "local">
					<h4 class = "clocal">local address</h4>
					<textarea class = "cinlocal" rows = "3" name = "local_a"></textarea>
				</div>
			</div>
			
			<h3 class = "name">Course</h3>
			<select class = "courseopt" name = "course" required>
				<option disabled = "disabled" selected = "selected">--choose one--</option>
				<option value = "100">B.TECH</option>
				<option value = "101">M.TECH</option>
				<option value = "102">B.SC</option>
			</select>
			
			<h3 class = "name">branch</h3>
			<select class = "branchopt" name = "branch" required>
				<option disabled = "disabled" selected = "selected">--choose one--</option>
				<option value = "500">computer science engineering</option>
				<option value = "501">electrical engineering</option>
				<option value = "502">civil engineering</option>
				<option value = "503">metallurgy and materials engineering</option>
				<option value = "504">mechanical engineering</option>
				<option value = "505">b.sc mathematics</option>
				<option value = "506">b.sc physiology</option>
				<option value = "507">b.sc chemistry</option>
			</select>
			
			<div id = "btn">
				<button class = "btn" type = "submit">Submit</button>
			</div>
		</form>
	</div>
		</div>
	</div>
</body>
</html>