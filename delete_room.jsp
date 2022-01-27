<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("name");
if (name == null){
    out.println("Please, go back to the register page and choose room to delete");
}
else{
    try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hw5?characterEncoding=UTF-8&serverTimezone=UTC", "root", "Anna22042001?");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM registered WHERE name='"+name +"'");
out.println("Delete room successfully");
response.sendRedirect("register.jsp");
}
catch(Exception e)
{
System.out.print(e.toString());
e.printStackTrace();
}
}

%>