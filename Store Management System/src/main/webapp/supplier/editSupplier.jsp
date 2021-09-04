   
   <%@page import="project.ConnectionProvider" %>
   <%@page import="java.sql.*" %>


	
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Supplier</title>


<style type="text/css">

form{
	margin: 20px;

}
.form-design{
	padding: 10px 20px;
	width: 320px;
	
	
}

.input-design{

	
	font-size: 25px;
	border: none;
	border-bottom: 2px solid  black;
	padding: 12px;
	margin-top: 20px;
	
	margin-right: 400px;	
	font-size: 12px;
	width: 360px;
}

h2{
	margin-top:20px;
	background-color: #333;
	padding: 12px;
	width: 2000px;
	color: #fff;
}

</style>

</head>
<body>

<%

String id=request.getParameter("id");

try{
	Connection con= ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs=st.executeQuery("select * from supplier where id= '"+id+"' ");
	while(rs.next()){
		
	
%>

<h2>Edit Supplier Details</h2>
<form action="editSupplierAction.jsp" method="post">
<input type="hidden"  name="id"  value="<%=rs.getString(1) %>">
<input type="text" name="name" class="form-design" value="<%=rs.getString(2) %>" placeholder="Enter Name" required><br><br>
<input type="email" name="email" class="form-design" value="<%=rs.getString(3) %>" placeholder="Enter Email" required><br><br>
<input type="text" name="address" class="form-design" value="<%=rs.getString(4) %>" placeholder="Enter Address" required><br><br>
<input type="number" name="number" class="form-design"  value="<%=rs.getString(5) %>" placeholder="Enter Number" required><br><br>
<input type="submit" value="Save" class="input-design"  >


</form>


<%
	}
}catch(Exception e){
	System.out.println(e);
}



%>
</body>
</html>