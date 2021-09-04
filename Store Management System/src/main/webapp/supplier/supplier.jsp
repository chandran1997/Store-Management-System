<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Supplier</title>

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

table, td, th{
	border: 1px solid black;
	padding: 20px;
	
}

table{
	border-collapse: collapse;
	width: 100%;
	margin-top: 50px;
	
}

th{
	background-color:#333;
	color:#fff;
}



td{
	text-align: center;
}


a{
	text-decoration: none;
}

h1{
	margin-top:20px;
	background-color: #333;
	padding: 12px;
	width: 2000px;
	color: #fff;
}

</style>
</head>
<body>


<h1>Supplier Master</h1>
<form action="supplierAction.jsp" method="post" >


<input type="text" name="name" class="form-design" placeholder="Enter Name" required><br><br>
<input type="email" name="email" class="form-design" placeholder="Enter Email" required><br><br>
<input type="text" name="address" class="form-design" placeholder="Enter Address" required><br><br>
<input type="number" name="number" class="form-design" placeholder="Enter Number" required><br><br>
<input type="submit" class="input-design" value="Save"  >
</form>
<%

String msg= request.getParameter("msg");

if("done".equals(msg))
	{
%>

<h2>Successfully Updated</h2>
<%
	}
%>
<% 
if("wrong".equals(msg))
	{
%>

<h2>Something went Wrong! try again</h2>
<%
	}
%>




<!-- ----Supplier Table---- -->


<table>
<thead>
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Email</th>
		<th>Address</th>
		<th>number</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
</thead>

<tbody>	
	<%
	
		
			
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from supplier");
			while(rs.next()){
	
	
	%>
	
	
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><a href="editSupplier.jsp?id=<%=rs.getString(1) %>">Edit</a></td> 
		<td><a href="deleteSupplier.jsp?id=<%=rs.getString(1) %>">Delete</a></td>
	
	</tr>

	<%
			}

	
	%>
</tbody>
</table>



</body>
</html>