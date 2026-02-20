<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
String ivrs = request.getParameter("ivrs");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Bills</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>

body{
margin:0;
font-family:'Poppins',sans-serif;
background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
min-height:100vh;
padding:40px;
color:white;
}

/* SEARCH BOX */
.search-box{
max-width:600px;
margin:auto;
background:rgba(255,255,255,0.1);
backdrop-filter:blur(10px);
padding:30px;
border-radius:20px;
box-shadow:0 10px 40px rgba(0,0,0,0.4);
text-align:center;
}

.search-box h2{
margin-bottom:20px;
font-weight:600;
}

.search-box input{
width:70%;
padding:12px;
border-radius:10px;
border:none;
outline:none;
font-size:15px;
}

.search-box button{
padding:12px 20px;
border:none;
border-radius:10px;
background:linear-gradient(90deg,#00c6ff,#0072ff);
color:white;
font-weight:600;
cursor:pointer;
transition:0.3s;
}

.search-box button:hover{
transform:scale(1.05);
}

/* BILL CARD */
.bill-card{
background:white;
color:#333;
max-width:700px;
margin:30px auto;
padding:30px;
border-radius:20px;
box-shadow:0 20px 50px rgba(0,0,0,0.4);
}

.bill-card h3{
margin-top:0;
color:#0072ff;
}

.bill-info{
margin:10px 0;
font-size:15px;
}

.action-btn{
margin-top:15px;
padding:10px 20px;
border:none;
border-radius:8px;
font-weight:600;
cursor:pointer;
transition:0.3s;
}

.pay-btn{
background:#28a745;
color:white;
}

.print-btn{
background:#007bff;
color:white;
}

.action-btn:hover{
transform:scale(1.05);
}

</style>
</head>

<body>

<div class="search-box">
<h2>Search Your Bill</h2>

<form method="get">
<input type="text" name="ivrs" placeholder="Enter IVRS Number" required>
<button type="submit">Search</button>
</form>
</div>

<%
if(ivrs != null){

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM bills WHERE ivrs_no=?"
);
ps.setString(1, ivrs);
ResultSet rs = ps.executeQuery();

boolean found=false;

while(rs.next()){
found=true;
String status = rs.getString("status");
%>

<div class="bill-card">

<h3>Bill ID: <%= rs.getInt("bill_id") %></h3>

<div class="bill-info">
IVRS Number: <b><%= rs.getString("ivrs_no") %></b>
</div>

<div class="bill-info">
Total Amount:  <b><%= rs.getDouble("amount") %></b>
</div>

<div class="bill-info">
Status: 
<b style="color:<%= status.equalsIgnoreCase("Pending") ? "red" : "green" %>">
<%= status %>
</b>
</div>

<% if(status != null && status.equalsIgnoreCase("Unpaid")) { %>

<a href="payBill.jsp?bill_id=<%= rs.getInt("bill_id") %>">
<button class="action-btn pay-btn">Pay Now</button>
</a>

<% } else { %>

<a href="printBill.jsp?bill_id=<%= rs.getInt("bill_id") %>">
<button class="action-btn print-btn">View / Print Bill</button>
</a>

<% } %>

</div>

<%
}

if(!found){
%>
<div style="text-align:center;margin-top:20px;color:#ff4d4d;font-weight:600;">
No bill found for this IVRS number.
</div>
<%
}

}
%>

</body>
</html>
