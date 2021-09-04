<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.* " %>

<%
String id = request.getParameter("id");
String rawMaterial = request.getParameter("rawMaterial");


try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into rawMaterial values(?,?)");
	ps.setString(1, id);
	ps.setString(2, rawMaterial);
	ps.executeUpdate();
	
	response.sendRedirect("rawMaterial.jsp?msg=done");
	
}catch(Exception e)
{
	response.sendRedirect("rawMaterial.jsp?msg=wrong");

	System.out.println(e);
}
%>