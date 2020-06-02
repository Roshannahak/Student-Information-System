<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="admindashboard.css">
<title>OPJU</title>
</head>
<body>
	<%
	response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
	if(session.getAttribute("id") == null){
		response.sendRedirect("index.jsp");
	}
	%>
	<div class="wrapper">
		<div class="sidebar">
			<h2>Admin</h2>
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="student_details.jsp">Student Details</a></li>
				<li><a href="add_student.jsp">Add Student</a></li>
				<li><form action="logout"><a href="logout">Logout</a></form></li>
			</ul>
		</div>
		<div class="main_content">
			<div class="info">
				<div class = "card">
					<h4>TOTAL STUDENTS</h4><hr>
					<h1>${total}</h1>
				</div>
				<div class = "card">
					<h4>BOYS</h4><hr>
					<h1>${boys}</h1>
				</div>
				<div class = "card">
					<h4>GIRLS</h4><hr>
					<h1>${girls}</h1>
				</div>
			</div>
		</div>
	</div>
</body>
</html>