<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import= "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
try{
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
String room_name=request.getParameter("room_name");
String user_name=request.getParameter("user_name");
String start_string = request.getParameter("start");
String end_string = request.getParameter("end");
String purpose = request.getParameter("purpose");
String no_of_people = request.getParameter("no");
String use_projector = request.getParameter("projector");
String lunch = request.getParameter("lunch");
if (room_name == "" || user_name == "" || start_string == "" || end_string == ""){
    out.println("Please, go back to the register page and fill enough information to reserve");
}
else{
    try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hw5?characterEncoding=UTF-8&serverTimezone=UTC", "root", "Anna22042001?");
PreparedStatement p = conn.prepareStatement("SELECT name from registered where name = '" + room_name + "'");
ResultSet rSet = p.executeQuery();

if (!rSet.isBeforeFirst() ){
    out.println("Not exists, please recheck your wanted room!");
}
else{
while(rSet.next()){
    String wanted_name = rSet.getString(1);
    PreparedStatement p1 = conn.prepareStatement("SELECT room from reservation where room = '" + wanted_name + "'");
    ResultSet rSet2 = p1.executeQuery();
    if (rSet2.isBeforeFirst()){
        out.println("Already occupied, please comeback the reservation page to find another room or wait until your wanted room available");
    }
    else{
        PreparedStatement p2 = conn.prepareStatement("INSERT INTO reservation VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        p2.setString(1, room_name);
        p2.setString(2, user_name);
        p2.setDate(3, new java.sql.Date(formatter.parse(start_string).getTime()));
        p2.setDate(4, new java.sql.Date(formatter.parse(end_string).getTime()));
        if (purpose != ""){
            p2.setString(5, purpose);
        }
        else{
            p2.setNull(5, Types.VARCHAR);
        }
        if (no_of_people != ""){
            p2.setInt(6, Integer.valueOf(no_of_people));
        }
        else{
            p2.setNull(6, Types.INTEGER);
        }
        out.println(use_projector);
        out.println(lunch);
        Boolean projector = (use_projector != null);
        Boolean have_lunch = (lunch != null);
        p2.setBoolean(7, projector);
        p2.setBoolean(8, have_lunch);
        p2.executeUpdate();
        response.sendRedirect("reservation_list.jsp");

        
    }
}
}
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