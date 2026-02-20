<%@ include file="db.jsp" %>
<%
PreparedStatement ps=con.prepareStatement(
"select * from bills order by bill_date desc");
ResultSet rs=ps.executeQuery();
%>

<html>
<head>
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
body{
background:#141e30;
color:white;
font-family:Poppins;
padding:40px;
text-align:center;
}
table{
margin:auto;
border-collapse:collapse;
width:90%;
}
th,td{
padding:12px;
border:1px solid white;
}
th{
background:#00f2ff;
color:black;
}
.payBtn{
background:linear-gradient(45deg,#00f2ff,#ff00c8);
border:none;
padding:5px 15px;
color:white;
border-radius:20px;
cursor:pointer;
}
</style>
</head>
<body>

<h2><i class="fas fa-file-invoice"></i> Your Bills</h2>

<table>
<tr>
<th>Bill ID</th>
<th>IVRS</th>
<th>Units</th>
<th>Amount</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
while(rs.next()){
%>
<tr>
<td><%=rs.getInt("bill_id")%></td>
<td><%=rs.getLong("ivrs_no")%></td>
<td><%=rs.getInt("units")%></td>
<td>? <%=rs.getDouble("amount")%></td>
<td><%=rs.getString("status")%></td>
<td>
<% if(rs.getString("status").equals("Unpaid")){ %>
<a href="payBill.jsp?bill_id=<%=rs.getInt("bill_id")%>">
<button class="payBtn">
<i class="fas fa-credit-card"></i> Pay
</button>
</a>
<% } else { %>
Paid ?
<% } %>
</td>
</tr>
<%
}
%>

</table>

<br>
<button onclick="location.href='adminDashboard.jsp'">
<i class="fas fa-arrow-left"></i> Back
</button>

</body>
</html>
