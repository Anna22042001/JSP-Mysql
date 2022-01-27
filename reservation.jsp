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
                </tr>
    <%
            }
        } catch(SQLException e){
            out.println(e.toString());
        }
    %>
    </tr>
</table>
<h1>Find the room you want</h1>
<table border = "1">
    <tr>
        <td>room name</td>
        <td>location</td>
        <td>capacity</td>
        <td>supervisior</td>
        <td>Number of doors</td>
        <%
        try{
            String capacity = request.getParameter("capacity");
            String no_of_door = request.getParameter("door");
            if (capacity == "" &&  no_of_door==""){
            }
            else if (capacity != "" &&  no_of_door==""){
            Statement statement2 = connection.createStatement();
            ResultSet rs2 = statement2.executeQuery("SELECT name, location, capacity, supervisor, number_of_doors from registered where capacity >= '" + capacity + "'");
            while(rs2.next()){
                %>
                <tr>
                    <td><%= rs2.getString(1)%></td>
                    <td><%= rs2.getString(2)%></td>
                    <td><%= rs2.getString(3)%></td>
                    <td><%= rs2.getString(4)%></td>
                    <td><%= rs2.getString(5)%></td>
                </tr>
    <%
            }
            }
            else if (capacity == "" &&  no_of_door!=""){
                Statement statement1 = connection.createStatement();
                String query1 = "SELECT name, location, capacity, supervisor, number_of_doors from registered where number_of_doors >= '" + no_of_door + "'";
                ResultSet rs1 = statement1.executeQuery(query1);
                while(rs1.next()){
                    %>
                    <tr>
                        <td><%= rs1.getString(1)%></td>
                        <td><%= rs1.getString(2)%></td>
                        <td><%= rs1.getString(3)%></td>
                        <td><%= rs1.getString(4)%></td>
                        <td><%= rs1.getString(5)%></td>
                    </tr>
        <%
                
                    }
                    }
            else{
            }
        } catch(SQLException e){
            out.println(e.toString());
        }
    %>
    </tr>
</table>
<h3>Put the conditions you want</h3>
<form action="reservation.jsp" method="post">
    Condition 1: <input type="number" name = "capacity" placeholder="Minumum capcity needed" style="width: 175px;"><br/>
    Condition 2: <input type="number" name = "door" placeholder="Minumum number of doors needed" style="width: 230px;"><br/>
    <p><input type="submit" value="find a room"></p>
</form>
<h3>Make a new reservation</h3>
<form action="insert_reservation.jsp" method="post">
    <p><input type="text" name="room_name" placeholder="room name"></p>
    <p><input type="text" name="user_name" placeholder="user_name"></p>
    <p><input type="date" name="start"></p>
    <p><input type="date" name="end"></p>
    <p><input type="text" name="purpose" placeholder="purpose"></p>
    <p><input type="number" name="no" placeholder="number of people"></p>
    <p><input type="checkbox" name="projector"> user projector</p>
    <p><input type="checkbox" name="lunch"> eat lunch</p>
    <p><input type="submit" value="make a reservation"></p>
</form>

</body>
</html>