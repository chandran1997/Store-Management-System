<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.* " %>

<%

String id = request.getParameter("id");



try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("delete from inward where id=? ");
	ps.setString(1, id);
	

	ps.executeUpdate();
	
	response.sendRedirect("inawrd.jsp");
	
}catch(Exception e)
{
	

	System.out.println(e);
}





%>

