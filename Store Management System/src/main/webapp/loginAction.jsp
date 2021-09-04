

<%

String username= request.getParameter("username");
String password= request.getParameter("password"); 

if("Admin".equals(username) && "123".equals(password)){
	
	
	response.sendRedirect("home.jsp");
}else
{
	
	response.sendRedirect("index.jsp?msg=invalid");

}



%>