<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.* " %>

<%
String id = request.getParameter("id");



try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("delete from rawMaterial where id= ? ");
	ps.setString(1, id);
	ps.executeUpdate();
	
	response.sendRedirect("rawMaterial.jsp");
	
}catch(Exception e)
{

	System.out.println(e);
}
%>