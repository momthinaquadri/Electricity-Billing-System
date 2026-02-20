<%@ include file="db.jsp" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Revenue</title>
<link rel="stylesheet" href="admin-style.css">
</head>

<body>

<div class="sidebar">
    <h2><i class="fas fa-bolt"></i> Admin</h2>
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="revenue.jsp">Revenue</a>
</div>

<div class="main">

<h1>Revenue Report</h1>

<%
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM bills WHERE status='Paid'");
%>

<table style="width:100%; background:white; color:black;">
<tr style="background:#0072ff; color:white;">
<th>Bill ID</th>
<th>IVRS</th>
<th>Amount</th>
<th>Date</th>
</tr>

<%
while(rs.next()){
%>
<tr>
<td><%= rs.getInt("bill_id") %></td>
<td><%= rs.getString("ivrs_no") %></td>
<td> <%= rs.getDouble("amount") %></td>
<td><%= rs.getDate("bill_date") %></td>
</tr>
<% } %>

</table>

</div>
</body>
</html>
