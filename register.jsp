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
<h1>Registered Room List</h1>
<table border = "1">
    <tr>
        <td>room name</td>
        <td>location</td>
        <td>capacity</td>
        <td>supervisior</td>
        <td>Number of doors</td>
        <td>Delete</td>
        <%
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hw5?characterEncoding=UTF-8&serverTimezone=UTC", "root", "Anna22042001?");
            Statement statement = connection.createStatement();
            String query = "SELECT name, location, capacity, supervisor, number_of_doors from registered";
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><a href="delete_room.jsp?name=<%=rs.getString(1)%>">del</a></td>
                </tr>
    <%
            }
        } catch(SQLException e){
            out.println(e.toString());
        }
    %>
    </tr>
</table>
<h1>Insert Room Information</h1>
<form action="insert_room.jsp" method="post">
    <p><input type="text" name="name" placeholder="room name"></p>
    <p><input type="text" name="location" placeholder="location"></p>
    <p><input type="number" name="capacity" placeholder="capacity"></p>
    <p><input type="text" name="supervisor" placeholder="supervisor"></p>
    <p><input type="number" name="number_of_doors" placeholder="number_of_doors"></p>
    <p><input type="submit" value="register the room"></p>
</form>
</body>
</html>