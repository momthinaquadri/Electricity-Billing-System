<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
int billId = Integer.parseInt(request.getParameter("bill_id"));

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM bills WHERE bill_id=?"
);

ps.setInt(1, billId);
ResultSet rs = ps.executeQuery();
rs.next();

String status = rs.getString("status");
double amount = rs.getDouble("amount");
%>

<!DOCTYPE html>
<html>
<head>
<title> Invoice</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

body{
font-family:Poppins;
background:linear-gradient(135deg,#ece9e6,#ffffff);
padding:40px;
}

.invoice{
background:white;
padding:50px;
border-radius:20px;
box-shadow:0 20px 60px rgba(0,0,0,0.15);
max-width:750px;
margin:auto;
position:relative;
overflow:hidden;
}

.invoice::before{
content:"";
position:absolute;
top:0;
left:0;
width:100%;
height:8px;
background:linear-gradient(90deg,#11998e,#38ef7d);
}

.header{
display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:30px;
}

.header h1{
color:#11998e;
margin:0;
}

.logo{
font-size:22px;
font-weight:600;
color:#333;
}

table{
width:100%;
margin-top:20px;
border-collapse:collapse;
}

table td{
padding:14px;
border-bottom:1px solid #eee;
font-size:14px;
}

.label{
font-weight:600;
color:#555;
}

.value{
text-align:right;
font-weight:500;
}

.total-box{
margin-top:25px;
text-align:right;
font-size:20px;
font-weight:700;
color:#11998e;
}

.status{
padding:6px 18px;
border-radius:20px;
font-size:13px;
color:white;
display:inline-block;
}

.paid{
background:#00c851;
}

.unpaid{
background:#ff4444;
}

.printBtn{
margin-top:30px;
background:linear-gradient(45deg,#11998e,#38ef7d);
color:white;
padding:12px 30px;
border:none;
border-radius:30px;
cursor:pointer;
font-size:14px;
transition:0.3s;
}

.printBtn:hover{
transform:scale(1.05);
box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

/* PRINT STYLE */
@media print{
.printBtn{
display:none;
}
body{
background:white;
}
}

.icon{
margin-right:8px;
color:#11998e;
}

</style>

<script>
function printBill(){
window.print();
}
</script>

</head>

<body>

<div class="invoice">

<div class="header">
    <h1><i class="fas fa-file-invoice-dollar icon"></i> Invoice</h1>
    <div class="logo">
        <i class="fas fa-bolt"></i> Electricity Board
    </div>
</div>

<table>

<tr>
<td class="label">
<i class="fas fa-hashtag icon"></i> Bill ID
</td>
<td class="value">
<%= rs.getInt("bill_id") %>
</td>
</tr>

<tr>
<td class="label">
<i class="fas fa-id-card icon"></i> IVRS Number
</td>
<td class="value">
<%= rs.getString("ivrs_no") %>
</td>
</tr>

<tr>
<td class="label">
<i class="fas fa-indian-rupee-sign icon"></i> Total Amount
</td>
<td class="value">
 <i class="fas fa-indian-rupee-sign icon"></i><%= amount %>
</td>
</tr>

<tr>
<td class="label">
<i class="fas fa-info-circle icon"></i> Status
</td>
<td class="value">
<% if(status.equalsIgnoreCase("Paid")){ %>
<span class="status paid">
<i class="fas fa-check-circle"></i> Paid
</span>
<% } else { %>
<span class="status unpaid">
<i class="fas fa-exclamation-circle"></i> <%= status %>
</span>
<% } %>
</td>
</tr>

</table>

<div class="total-box">
Grand Total: <%= amount %>
</div>

<center>
<button class="printBtn" onclick="printBill()">
<i class="fas fa-print"></i> Print Invoice
</button>
</center>

</div>

</body>
</html>
