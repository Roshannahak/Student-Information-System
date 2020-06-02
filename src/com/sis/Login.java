package com.sis;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sis.dao.Daolayer;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rollid = request.getParameter("rollid");
		String pass = request.getParameter("inpass");
		
		int choose = Integer.parseInt(request.getParameter("select"));
		
		Daolayer dao = new Daolayer();
		
		if(choose == 1) {
			if(dao.admincheck(rollid, pass)) {
				HttpSession session = request.getSession();
				session.setAttribute("id", rollid);
				
				int gettotal = dao.total();
				int getboys = dao.totalboys();
				int getgirl = dao.totalgirls();
				
				session.setAttribute("total", gettotal);
				session.setAttribute("boys", getboys);
				session.setAttribute("girls", getgirl);
				response.sendRedirect("admin_dashboard.jsp");
			}
			else {
				response.sendRedirect("index.jsp");
			}
		}else if(choose == 2) {
			if(dao.studentcheck(rollid, pass)) {
				HttpSession session = request.getSession();
				session.setAttribute("roll", rollid);
				response.sendRedirect("studentpage/student_dashboard.jsp?r="+rollid);
			}else {
				response.sendRedirect("index.jsp");
			}
		}
	}

}
