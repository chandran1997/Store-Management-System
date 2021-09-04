<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.* " %>

<%

String id = request.getParameter("id");
String supplier = request.getParameter("supplier");
String rawMaterial = request.getParameter("rawMaterial");
String date = request.getParameter("date");
String quantity = request.getParameter("quantity");


try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into inward values(?,?,?,?,?)");
	ps.setString(1, id);
	ps.setString(2, supplier);
	ps.setString(3, rawMaterial);
	ps.setString(4, date);
	ps.setString(5, quantity);

	ps.executeUpdate();
	
	response.sendRedirect("inawrd.jsp?msg=done");
	
}catch(Exception e)
{
	response.sendRedirect("inawrd.jsp?msg=wrong");

	System.out.println(e);
}





%>

