<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
try{
String name=request.getParameter("name");
String location=request.getParameter("location");
String capacity=request.getParameter("capacity");
String supervisor=request.getParameter("supervisor");
String no_of_door=request.getParameter("number_of_doors");
if (name == "" || capacity == "" || location == "" || supervisor == "" || no_of_door == ""){
    out.println("Please, go back to the register page and fill all information needed to register");
}
else{
    try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hw5?characterEncoding=UTF-8&serverTimezone=UTC", "root", "nna22042001?");
PreparedStatement p = conn.prepareStatement("INSERT INTO registered VALUES (?, ?, ?, ?, ?)");
p.setString(1, name);
p.setString(2, location);
p.setInt(3, Integer.valueOf(capacity));
p.setString(4, supervisor);
p.setInt(5, Integer.valueOf(no_of_door));
p.executeUpdate();
response.sendRedirect("register.jsp");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e.toString());
e.printStackTrace();
}
}}
catch(Exception e){
    out.println("Please submit all information");
}

%>