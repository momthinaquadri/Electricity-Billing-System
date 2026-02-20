<%@ page import="java.sql.*" %>
<%
Connection con=null;
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/electricity_system",
"root","");
%>
