<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>


<style type="text/css">
form{
	margin-top: 130px;

}
.form-design{
	padding: 10px 20px;
	width: 320px;
	border-bottom: 2px solid #cc;
}




.input-design{

	
	font-size: 25px;
		
	
	padding: 12px;
	margin-top: 20px;
	margin-left: 400px;
	margin-right: 400px;	
	font-size: 12px;
	width: 200px;
}

a{
 text-decoration: none;
}

</style>



</head>
<body>


<form action="loginAction.jsp" method="post" >

<h1 align="center">Login</h1>

<div align="center">
<input type="text" class="form-design" name="username" placeholder="Username" required><br><br>
<input type="password" class="form-design" name="password" placeholder="Password" required><br><br>
<input type="submit" class="input-design"  value="Admin Login">
</div>
</form>

<%
String msg=request.getParameter("msg");

if("invalid".equals(msg))
	{
%>
<h1>Username and Password are incorrect</h1>
<%
    }
%>

</body>
</html>