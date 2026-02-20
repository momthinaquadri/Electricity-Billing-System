<%@ include file="db.jsp" %>
<%
String name=request.getParameter("name");

if(name!=null){
PreparedStatement ps=con.prepareStatement(
"insert into customers(name,address,phone) values(?,?,?)");
ps.setString(1,name);
ps.setString(2,request.getParameter("address"));
ps.setString(3,request.getParameter("phone"));
ps.executeUpdate();
out.println("<script>alert('Request Submitted Successfully!');</script>");
}
%>

<html>
<head>
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
body{
background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
font-family:Poppins;
color:white;
}
.glass{
background:rgba(255,255,255,0.1);
padding:50px;
border-radius:25px;
backdrop-filter:blur(20px);
text-align:center;
width:400px;
}
input{
width:90%;
padding:10px;
margin:10px;
border:none;
border-radius:20px;
}
button{
padding:10px 25px;
border:none;
border-radius:25px;
background:linear-gradient(45deg,#00f2ff,#ff00c8);
color:white;
cursor:pointer;
}
</style>
</head>
<body>

<div class="glass">
<h2><i class="fas fa-plug"></i> New Connection</h2>

<form method="post">
<input type="text" name="name" placeholder="Full Name" required>
<input type="text" name="address" placeholder="Address" required>
<input type="text" name="phone" placeholder="Phone" required>
<button type="submit">
<i class="fas fa-paper-plane"></i> Submit Request
</button>
</form>

<br>
<button onclick="location.href='customerDashboard.jsp'">
<i class="fas fa-arrow-left"></i> Back
</button>

</div>
</body>
</html>
