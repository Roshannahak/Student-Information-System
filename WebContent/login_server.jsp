<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int choose = Integer.parseInt(request.getParameter("select"));

if(choose == 1){
	out.println("welcome admin");
}
else if(choose == 2){
	out.println("welcome student");
}
%>
</body>
</html>