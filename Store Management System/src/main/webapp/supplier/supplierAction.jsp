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
	PreparedStatement ps = con.prepareStatement("insert into supplier values(?,?,?,?,?)");
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3, email);
	ps.setString(4, address);
	ps.setString(5, number);

	ps.executeUpdate();
	
	response.sendRedirect("supplier.jsp?msg=done");
	
}catch(Exception e)
{
	response.sendRedirect("supplier.jsp?msg=wrong");

	System.out.println(e);
}





%>

