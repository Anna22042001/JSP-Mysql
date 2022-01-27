<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("name");
if (name == null){
    out.println("Please, go back to the reservation page and choose reservation to delete");
}
else{
    try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hw5?characterEncoding=UTF-8&serverTimezone=UTC", "root", "Anna22042001?");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM reservation WHERE room='"+name +"'");
response.sendRedirect("reservation_list.jsp");
}
catch(Exception e)
{
System.out.print(e.toString());
e.printStackTrace();
}
}
%>

