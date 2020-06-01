package com.sis.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sis.dao.Daolayer;

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		Daolayer dao = new Daolayer();
		
		if(dao.newstudent(roll, pass, first, last, gender, age, dob, email, phone, state, city, local_a, course, branch)) {
			request.setAttribute("result", first+" Successfully Registered..");
			RequestDispatcher dispatcher = request.getRequestDispatcher("add_student.jsp");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("alert", "Student Roll.no: "+roll+" is already Registered..");
			RequestDispatcher dispatcher = request.getRequestDispatcher("add_student.jsp");
			dispatcher.forward(request, response);
		}
	}

}
