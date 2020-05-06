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
		String password = "497557";
		
		String getroll = request.getParameter("v");
		
		String query = "select roll_no, firstname, lastname, gender, age, phone_no, email, date_of_birth, local_address, city_name, state_name, course_name, branch_name from students, branch, courses where roll_no = '"+getroll+"' and students.course_id = courses.course_id and students.branch_id = branch.branch_id";
		
		try{
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, password);
			
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()){
				request.setAttribute("getroll", rs.getString("roll_no"));
				request.setAttribute("getfirst", rs.getString("firstname"));
				request.setAttribute("getgender", rs.getString("gender"));
				request.setAttribute("getage", rs.getString("age"));
				request.setAttribute("getphone", rs.getString("phone_no"));
				request.setAttribute("getemail", rs.getString("email"));
				request.setAttribute("getdob", rs.getString("date_of_birth"));
				request.setAttribute("getlocal", rs.getString("local_address"));
				request.setAttribute("getcity", rs.getString("city_name"));
				request.setAttribute("getstate", rs.getString("state_name"));
				request.setAttribute("getcourse", rs.getString("course_name"));
				request.setAttribute("getbranch", rs.getString("branch_name"));
				
				request.getRequestDispatcher("student_details.jsp").forward(request, response);
			}
			
		}catch(Exception e){
			out.println("database connection error!!");
		}
	%>
</body>
</html>