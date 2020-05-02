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
		String db_password = "497557";
		
		//check query student already exist or not
		String check_query = "select * from students where roll_no = ?";
		
		//data insert query
		String insert_query = "insert into students values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try{
			//connect to database
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, db_password);
			
			//getting all parameters
			String roll = request.getParameter("roll");
			String pass = request.getParameter("pass");
			String first = request.getParameter("first");
			String last = request.getParameter("last");
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");
			String dob = request.getParameter("dob");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String state = request.getParameter("state");
			String city = request.getParameter("city");
			String local_a = request.getParameter("local_a");
			String course = request.getParameter("course");
			String branch = request.getParameter("branch");
			
			PreparedStatement cpt = conn.prepareStatement(check_query);
			cpt.setString(1, roll);
			ResultSet rs = cpt.executeQuery();
			
			//student roll number not exist
			if(!rs.next()){
				
				//insert new student information
				PreparedStatement pt = conn.prepareStatement(insert_query);
				pt.setString(1, roll);
				pt.setString(2, pass);
				pt.setString(3, first);
				pt.setString(4, last);
				pt.setString(5, gender);
				pt.setString(6, age);
				pt.setString(7, phone);
				pt.setString(8, email);
				pt.setString(9, dob);
				pt.setString(10, local_a);
				pt.setString(11, city);
				pt.setString(12, state);
				pt.setString(13, course);
				pt.setString(14, branch);
				
				int x = pt.executeUpdate();
				if(x>0){
					//out.println("registration successfull...");
					request.setAttribute("result", first+" Successfully Registered..");
					request.getRequestDispatcher("add_student.jsp").forward(request, response);
				}
				else{
					//out.println("data insertion error...");
					request.setAttribute("error", "Something Wrong, Data Insertion Error...");
					request.getRequestDispatcher("add_student.jsp").forward(request, response);
				}
				
			}
			//student roll number exist
			else{
				//out.println("student is already registered..");
				request.setAttribute("alert", "Student Roll.no: "+roll+" is already Registered..");
				request.getRequestDispatcher("add_student.jsp").forward(request, response);
			}
			
		}catch(Exception e){
			//out.println("database connection error!!");
			request.setAttribute("error", "database connection error!!");
			request.getRequestDispatcher("add_student.jsp").forward(request, response);
		}
	%>
</body>
</html>