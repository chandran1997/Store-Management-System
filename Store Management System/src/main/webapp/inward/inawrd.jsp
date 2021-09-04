<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inward</title>

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
	margin-left:400px;
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

h2{
	margin-top:20px;
	background-color: #333;
	padding: 12px;
	width: 100%;
	color: #fff;
}

</style>
</head>
<body>

<h2>Inward </h2>

<form method="post" action="inwardAction.jsp">

<div align="center">
Supplier<br><br>
</div>
	
	<div align="center">
	
	<select name="supplier" class="form-design">
			<%
			
			
			try{
				
			Connection con=ConnectionProvider.getCon();
			
			String query = ("select * from supplier");
			Statement st= con.createStatement();
			 ResultSet rs=st.executeQuery(query);
			while(rs.next())
			{
				String id= rs.getString("id");
				String name= rs.getString("name");
			%>
			
				
				<option value=  "<%= id %>"  >    <%= name%>    </option>
				
				<%
						}
				}catch(Exception e){
					System.out.println(e);
				}
				%>
	
	</select>
	
	
	</div><br>
	
	<div align="center">
	Raw Material : <br><br>
	<select name=rawMaterial width="30px" class="form-design">
			
			
			<% 
			try{
				Connection con=ConnectionProvider.getCon();
				
			String query1 = ("select * from rawMaterial");
			Statement st1= con.createStatement();
			 ResultSet rs=st1.executeQuery(query1);
			while(rs.next())
			{
				String id= rs.getString("id");
				String rawMaterialName= rs.getString("rawMaterialName");
			%>
			
				
				<option value=  "<%= id %>"  >    <%= rawMaterialName%>    </option>
				
				<%
			}
			}catch(Exception e){
				System.out.println(e);
			}
				%>
	
	
	
		
	</select>
	</div><br>
	
	<div align="center">
	Date of inward : <br>
	<br><input type="date" class="form-design" name=date placeholder="Date " size=30px />
	</div> <br>
	
	<div align="center">
	Quantity : <br>
	<br><input type="number" class="form-design" name=quantity placeholder=" Enter Quantity" size=30px />
	</div> <br>
	
	<div align="center">
			<input type="submit"  value="Save"  class="input-design" >
		
		</div>

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

<br> <br> <br> <br>

<table>
<thead>
	<tr>
		<th>ID</th>
		<th>Supplier</th>
		<th>Raw Materials</th>
		<th>Date</th>
		<th>Quantity</th>
		<th>Delete</th>
	</tr>
</thead>

<tbody>	
	<%
	
		try{
			
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select i.id, s.name, r.rawMaterialName, i.date, i.quantity  from inward i JOIN supplier s ON i.supplier = s.id JOIN  rawMaterial r ON i.rawMaterial = r.id");
			while(rs.next()){
	
				String id= rs.getString("i.id");
				
				%>
				
				<tr>
				    <td><%=rs.getString("i.id") %></td>
					<td><%=rs.getString("s.name") %></td>
					<td><%=rs.getString("r.rawMaterialName") %></td>
					<td><%=rs.getString("i.date") %></td>
					<td><%=rs.getString("i.quantity") %></td>
					<td><a href="deleteInward.jsp?id=<%=id%>">Delete</a></td>
				</tr>
			

	<%
			}
		}catch(Exception e)
	{
			System.out.println(e);
	}
	
	%>
</tbody>
</table>

</body>
</html>