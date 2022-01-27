<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import= "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<html>
<head>
<title>Creating a Table</title>
</head>
<body>
<h1>Creating a Table</h1>
<%
Connection connection = null;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hw5?characterEncoding=UTF-8&serverTimezone=UTC", "root", "Anna22042001?");
Statement statement = connection.createStatement();
String query = "CREATE TABLE registered (name VARCHAR(50) not null , location VARCHAR(50) not null, capacity INT(254) not null, supervisor VARCHAR(100) not null, number_of_doors INT(10) not null, UNIQUE (name));";
statement.executeUpdate(query);
Statement statement2 = connection.createStatement();
    
    String query1 = "INSERT INTO registered VALUES ('room1', 'CS-1', 100, 'Mr A', 4)";
    statement2.executeUpdate(query1);
    String query2 = "INSERT INTO registered VALUES ('room2', 'CS-2', 120, 'Mr B', 2)";
    statement2.executeUpdate(query2);
    String query3 = "INSERT INTO registered VALUES ('room3', 'CS-3', 140, 'Mr C', 5)";
    statement2.executeUpdate(query3);
    String query4 = "INSERT INTO registered VALUES ('room4', 'CS-4', 80, 'Mr D', 2)";
    statement2.executeUpdate(query4);
    String query5 = "INSERT INTO registered VALUES ('room5', 'CS-5', 200, 'Mr E', 5)";
    statement2.executeUpdate(query5);
    String query6 = "INSERT INTO registered VALUES ('room6', 'CS-6', 100, 'Mr F', 3)";
    statement2.executeUpdate(query6);
    String query7 = "INSERT INTO registered VALUES ('room7', 'CS-7', 80, 'Mr G', 2)";
    statement2.executeUpdate(query7);
    String query8 = "INSERT INTO registered VALUES ('room8', 'CS-8', 120, 'Mr H', 3)";
    statement2.executeUpdate(query8);
    String query9 = "INSERT INTO registered VALUES ('room9', 'CS-9', 100, 'Mr I', 4)";
    statement2.executeUpdate(query9);
    String query10 = "INSERT INTO registered VALUES ('room10', 'CS-10', 120, 'Mr E', 4)";
    statement2.executeUpdate(query10);

    Statement statement3 = connection.createStatement();
    String q = "Create TABLE reservation (room VARCHAR(50) not Null,user_name VARCHAR(50), Start_date DATE, End_date DATE, Purpose VARCHAR(50), no_of_people INT(254), use_projector BOOLEAN, eat_lunch BOOLEAN);";
    statement3.executeUpdate(q);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
    java.util.Date start1 = formatter.parse("2020/11/01");
    java.util.Date end1 = formatter.parse("2020/11/01");
    java.sql.Date sqlstart1 = new java.sql.Date(start1.getTime());
    java.sql.Date sqlend1 = new java.sql.Date(end1.getTime());
    PreparedStatement p1 = connection.prepareStatement("INSERT INTO reservation VALUES ('room1', 'Student A', ?, ?, 'group study', 10, true, true)");
    p1.setDate(1, sqlstart1);
    p1.setDate(2, sqlend1);
    p1.executeUpdate();
    java.util.Date start2 = formatter.parse("2020/04/26");
    java.util.Date end2 = formatter.parse("2020/04/26");
    java.sql.Date sqlstart2 = new java.sql.Date(start2.getTime());
    java.sql.Date sqlend2 = new java.sql.Date(end2.getTime());
    PreparedStatement p2 = connection.prepareStatement("INSERT INTO reservation VALUES ('room2', 'Student B', ?, ?, 'seminar', 10, true, false)");
    p2.setDate(1, sqlstart2);
    p2.setDate(2, sqlend2);
    p2.executeUpdate();   
    java.util.Date start3 = formatter.parse("2020/10/01");
    java.util.Date end3 = formatter.parse("2020/10/01");
    java.sql.Date sqlstart3 = new java.sql.Date(start3.getTime());
    java.sql.Date sqlend3 = new java.sql.Date(end3.getTime());
    PreparedStatement p3 = connection.prepareStatement("INSERT INTO reservation VALUES ('room3', 'Student C', ?, ?, 'presentation', 10, true, false)");
    p3.setDate(1, sqlstart3);
    p3.setDate(2, sqlend3);
    p3.executeUpdate();   
    java.util.Date start4 = formatter.parse("2020/11/20");
    java.util.Date end4 = formatter.parse("2020/11/20");
    java.sql.Date sqlstart4 = new java.sql.Date(start4.getTime());
    java.sql.Date sqlend4 = new java.sql.Date(end4.getTime());
    PreparedStatement p4 = connection.prepareStatement("INSERT INTO reservation VALUES ('room4', 'Student D', ?, ?, 'group study', 4, false, true)");
    p4.setDate(1, sqlstart4);
    p4.setDate(2, sqlend4);
    p4.executeUpdate();   
    java.util.Date start5 = formatter.parse("2020/11/01");
    java.util.Date end5 = formatter.parse("2020/11/01");
    java.sql.Date sqlstart5 = new java.sql.Date(start5.getTime());
    java.sql.Date sqlend5 = new java.sql.Date(end5.getTime());
    PreparedStatement p5 = connection.prepareStatement("INSERT INTO reservation VALUES ('room5', 'Student E', ?, ?, 'group study', 10, true, true)");
    p5.setDate(1, sqlstart5);
    p5.setDate(2, sqlend5);
    p5.executeUpdate();   
    java.util.Date start6 = formatter.parse("2020/11/01");
    java.util.Date end6 = formatter.parse("2020/11/01");
    java.sql.Date sqlstart6 = new java.sql.Date(start6.getTime());
    java.sql.Date sqlend6 = new java.sql.Date(end6.getTime());
    PreparedStatement p6 = connection.prepareStatement("INSERT INTO reservation VALUES ('room6', 'Student F', ?, ?, 'group study', 10, true, true)");
    p6.setDate(1, sqlstart6);
    p6.setDate(2, sqlend6);
    p6.executeUpdate();   
    java.util.Date start7 = formatter.parse("2020/11/01");
    java.util.Date end7 = formatter.parse("2020/11/01");
    java.sql.Date sqlstart7 = new java.sql.Date(start7.getTime());
    java.sql.Date sqlend7 = new java.sql.Date(end7.getTime());
    PreparedStatement p7 = connection.prepareStatement("INSERT INTO reservation VALUES ('room7', 'Student G', ?, ?, 'group study', 10, true, true)");
    p7.setDate(1, sqlstart7);
    p7.setDate(2, sqlend7);
    p7.executeUpdate();   
    java.util.Date start8 = formatter.parse("2020/11/01");
    java.util.Date end8 = formatter.parse("2020/11/01");
    java.sql.Date sqlstart8 = new java.sql.Date(start8.getTime());
    java.sql.Date sqlend8 = new java.sql.Date(end8.getTime());
    PreparedStatement p8 = connection.prepareStatement("INSERT INTO reservation VALUES ('room8', 'Student H', ?, ?, 'group study', 10, true, true)");
    p8.setDate(1, sqlstart8);
    p8.setDate(2, sqlend8);
    p8.executeUpdate();   
    java.util.Date start9 = formatter.parse("2020/11/01");
    java.util.Date end9 = formatter.parse("2020/11/01");
    java.sql.Date sqlstart9 = new java.sql.Date(start9.getTime());
    java.sql.Date sqlend9 = new java.sql.Date(end9.getTime());
    PreparedStatement p9 = connection.prepareStatement("INSERT INTO reservation VALUES ('room9', 'Student I', ?, ?, 'group study', 10, true, true)");
    p9.setDate(1, sqlstart9);
    p9.setDate(2, sqlend9);
    p9.executeUpdate();   
    java.util.Date start10 = formatter.parse("2020/11/01");
    java.util.Date end10 = formatter.parse("2020/11/01");
    java.sql.Date sqlstart10 = new java.sql.Date(start10.getTime());
    java.sql.Date sqlend10 = new java.sql.Date(end10.getTime());
    PreparedStatement p10 = connection.prepareStatement("INSERT INTO reservation VALUES ('room10', 'Student K', ?, ?, 'group study', 10, true, true)");
    p10.setDate(1, sqlstart1);
    p10.setDate(2, sqlend1);
    p10.executeUpdate();       
    
out.println("Table student create sucessfully.");
}
catch (Exception e)
{
out.println("An error occurred.");
}

%>

</body>
</html>