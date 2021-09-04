<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.* " %>

<%

String id = request.getParameter("id");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("address");
String number = request.getParameter("number");


try{
	
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("update supplier set name= '"+name+"' , email= '"+email+"', address= '"+address+"', number= '"+number+"' where id= '"+id+"'");
	
	response.sendRedirect("supplier.jsp?msg=done");
	
}catch(Exception e)
{
	response.sendRedirect("supplier.jsp?msg=wrong");

	System.out.println(e);
}





%>

