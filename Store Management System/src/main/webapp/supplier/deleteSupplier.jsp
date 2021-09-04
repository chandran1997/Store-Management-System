<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.* " %>

<%

String id = request.getParameter("id");



try{
	
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from supplier where id= ?");
	
	response.sendRedirect("supplier.jsp");
	
}catch(Exception e)
{

	System.out.println(e);
}





%>

