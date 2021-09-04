<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%

try{
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
//String q1= "create table supplier (id int auto_increment, name varchar(100), email varchar(100), address varchar(500), number bigint, primary key(id) )" ;
//String q2= "create table rawMaterial (id int auto_increment, rawMaterialName varchar(200), primary key(id))";
String q3= "create table inward(id int auto_increment, supplier varchar(100), rawMaterial varchar(100), date varchar(30), quantity bigint, primary key(id))";
//System.out.println(q1);
//st.execute(q1);


//System.out.println(q2);
//st.execute(q2);

System.out.println(q3);
st.execute(q3);


System.out.println("Table created");
con.close();

}catch(Exception e)

{
	System.out.println(e);
}

%>