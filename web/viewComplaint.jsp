<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
/* ================= DELETE LOGIC ================= */
String deleteId = request.getParameter("delete_id");

if(deleteId != null){
    PreparedStatement dps = con.prepareStatement("DELETE FROM complaints WHERE id=?");
    dps.setInt(1, Integer.parseInt(deleteId));
    dps.executeUpdate();
    dps.close();
    response.sendRedirect("viewComplaint.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Complaints</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

body{
margin:0;
font-family:Poppins;
background:linear-gradient(135deg,#141e30,#243b55);
min-height:100vh;
padding:40px;
color:white;
}

.container{
max-width:1100px;
margin:auto;
background:rgba(255,255,255,0.08);
backdrop-filter:blur(20px);
padding:40px;
border-radius:30px;
box-shadow:0 25px 70px rgba(0,0,0,0.6);
animation:fadeIn 1s ease-in-out;
}

@keyframes fadeIn{
from{opacity:0;transform:translateY(30px);}
to{opacity:1;transform:translateY(0);}
}

h2{
text-align:center;
margin-bottom:30px;
font-weight:600;
}

table{
width:100%;
border-collapse:collapse;
background:white;
color:#333;
border-radius:20px;
overflow:hidden;
}

th{
background:#243b55;
color:white;
padding:15px;
font-size:14px;
}

td{
padding:15px;
border-bottom:1px solid #eee;
font-size:14px;
}

tr:hover{
background:#f3f3f3;
transition:0.3s;
}

.status-open{
background:#ff4d4d;
color:white;
padding:6px 15px;
border-radius:20px;
font-size:12px;
}

.status-resolved{
background:#00c851;
color:white;
padding:6px 15px;
border-radius:20px;
font-size:12px;
}

/* DELETE BUTTON */
.delete-btn{
padding:6px 15px;
border:none;
border-radius:20px;
background:#ff4444;
color:white;
cursor:pointer;
font-size:12px;
transition:0.3s;
}

.delete-btn:hover{
background:#cc0000;
transform:scale(1.05);
}

.no-data{
text-align:center;
margin-top:20px;
font-size:16px;
color:#ff4d4d;
}

.back-btn{
margin-top:25px;
padding:12px 25px;
border:none;
border-radius:25px;
background:linear-gradient(45deg,#00f2ff,#ff00c8);
color:white;
cursor:pointer;
transition:0.4s;
}

.back-btn:hover{
transform:scale(1.05);
box-shadow:0 10px 30px rgba(0,0,0,0.5);
}

.icon{
margin-right:8px;
}

</style>

<script>
function confirmDelete(id){
    if(confirm("Are you sure you want to delete this complaint?")){
        window.location="viewComplaint.jsp?delete_id="+id;
    }
}
</script>

</head>

<body>

<div class="container">

<h2><i class="fas fa-list icon"></i> Customer Complaints</h2>

<table>
<tr>
<th>ID</th>
<th>IVRS No</th>
<th>Message</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM complaints ORDER BY id DESC");

boolean hasData = false;

while(rs.next()){
hasData = true;
String status = rs.getString("status");
%>

<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getLong("ivrs_no") %></td>
<td><%= rs.getString("message") %></td>

<td>
<% if(status.equalsIgnoreCase("Open")){ %>
<span class="status-open">Open</span>
<% } else { %>
<span class="status-resolved"><%= status %></span>
<% } %>
</td>

<td>
<button class="delete-btn"
onclick="confirmDelete(<%= rs.getInt("id") %>)">
<i class="fas fa-trash"></i> Delete
</button>
</td>

</tr>

<%
}
rs.close();
st.close();
%>

</table>

<%
if(!hasData){
%>
<div class="no-data">
No complaints found.
</div>
<%
}
%>

<center>
<button class="back-btn"
onclick="location.href='adminDashboard.jsp'">
<i class="fas fa-arrow-left icon"></i> Back to Dashboard
</button>
</center>

</div>

</body>
</html>
