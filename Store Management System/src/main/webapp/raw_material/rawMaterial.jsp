<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.* " %>



	
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Raw Material</title>

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

<h1>Raw Materials</h1>

<form action="rawMaterialAction.jsp" method="post">


<input type="text" name="rawMaterial" class="form-design" placeholder="Enter Raw Material Name" required><br><br>
<input type="submit" class="input-design"  value="Save">
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

<table>

	<tr>
		<th>ID</th>
		<th>Raw Material</th>
		<th>Delete</th>
	</tr>
	
	
	
	<%
		try{
			
			Connection con= ConnectionProvider.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from rawMaterial");
			while(rs.next()){
			
	
	
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><a href="deleteRawMaterial.jsp?id=<%=rs.getString(1)  %>">Delete</a></td>
	</tr>
	<%
			}
		}catch(Exception e){
			System.out.println(e);
		}
	
	%>
</table>



</body>
</html>