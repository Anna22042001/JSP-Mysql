<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import= "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<html>
<head>
<title>Kim JSP</title>
</head>
<% SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy"); %>
<body>
<h1>Reservation List</h1>
<table border = "1">
    <tr>
        <td>room name</td>
        <td>user_name</td>
        <td>start_date</td>
        <td>end_date</td>
        <td>purpose</td>
        <td>number of people</td>
        <td>use projector</td>
        <td>eat lunch</td>
        <td>Delete</td>
        <%
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hw5?characterEncoding=UTF-8&serverTimezone=UTC", "root", "Anna22042001?");
            Statement statement = connection.createStatement();
            String query = "SELECT room, user_name, Start_date, End_date, Purpose, no_of_people, use_projector, eat_lunch from reservation";
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><%= rs.getString(6)%></td>
                    <td><%= rs.getString(7)%></td>
                    <td><%= rs.getString(8)%></td>
                    <td><a href="delete_reservation.jsp?name=<%=rs.getString(1)%>">del</a></td>
                </tr>
    <%
            }
        } catch(SQLException e){
            out.println(e.toString());
        }
    %>
    </tr>
</table>