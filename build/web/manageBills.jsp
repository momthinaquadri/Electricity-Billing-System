<%@ include file="db.jsp" %>
<%@ page import="java.sql.*" %>

<%
String msg="";

if(request.getParameter("generate")!=null){

    long ivrs = Long.parseLong(request.getParameter("ivrs"));
    int units = Integer.parseInt(request.getParameter("units"));

    double rate = 6.5;
    double amount = units * rate;

    PreparedStatement ps = con.prepareStatement(
    "INSERT INTO bills(ivrs_no,units,amount,status,bill_date) VALUES(?,?,?,'Unpaid',CURDATE())");

    ps.setLong(1,ivrs);
    ps.setInt(2,units);
    ps.setDouble(3,amount);

    ps.executeUpdate();
    msg="Bill Generated Successfully!";
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Manage Bills</title>
<link rel="stylesheet" href="admin-style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
.form-box{
background:rgba(255,255,255,0.15);
backdrop-filter:blur(20px);
padding:30px;
border-radius:20px;
width:400px;
margin-top:30px;
box-shadow:0 10px 40px rgba(0,0,0,0.4);
}

input{
width:100%;
padding:12px;
margin:10px 0;
border:none;
border-radius:10px;
}

button{
background:linear-gradient(45deg,#00c6ff,#0072ff);
color:white;
padding:12px;
border:none;
border-radius:10px;
cursor:pointer;
width:100%;
transition:0.3s;
}

button:hover{
transform:scale(1.05);
}
</style>
</head>

<body>

<div class="sidebar">
<h2><i class="fas fa-bolt"></i> Admin</h2>
<a href="adminDashboard.jsp"><i class="fas fa-chart-line"></i> Dashboard</a>
<a href="manageBills.jsp"><i class="fas fa-file-invoice"></i> Generate Bill</a>
</div>

<div class="main">
<h1><i class="fas fa-file-invoice-dollar"></i> Generate Bill</h1>

<% if(!msg.equals("")){ %>
<p style="color:#00ffcc;"><%= msg %></p>
<% } %>

<div class="form-box">
<form method="post">

<label>Customer IVRS Number</label>
<input type="number" name="ivrs" required>

<label>Units Consumed</label>
<input type="number" name="units" required>

<button type="submit" name="generate">
<i class="fas fa-bolt"></i> Generate Bill
</button>

</form>
</div>

</div>
</body>
</html>
