<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
String success = "";

if(request.getParameter("message") != null){

    String ivrs = request.getParameter("ivrs");
    String msg = request.getParameter("message");

    PreparedStatement ps = con.prepareStatement(
    "INSERT INTO complaints(ivrs_no,message,status) VALUES(?,?,?)");

    ps.setLong(1, Long.parseLong(ivrs));
    ps.setString(2, msg);
    ps.setString(3, "Open");

    ps.executeUpdate();

    success = "Complaint Submitted Successfully!";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Complaint</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

body{
margin:0;
font-family:Poppins;
background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
overflow:hidden;
}

.glass{
background:rgba(255,255,255,0.08);
backdrop-filter:blur(25px);
padding:50px;
border-radius:30px;
width:450px;
box-shadow:0 25px 70px rgba(0,0,0,0.6);
color:white;
animation:fadeIn 1s ease-in-out;
}

@keyframes fadeIn{
from{opacity:0;transform:translateY(30px);}
to{opacity:1;transform:translateY(0);}
}

h2{
text-align:center;
margin-bottom:25px;
font-weight:600;
}

.input-group{
margin-bottom:20px;
}

input, textarea{
width:100%;
padding:12px 15px;
border-radius:20px;
border:none;
outline:none;
font-size:14px;
}

textarea{
height:100px;
resize:none;
}

button{
width:100%;
padding:12px;
border:none;
border-radius:25px;
background:linear-gradient(45deg,#00f2ff,#ff00c8);
color:white;
font-size:15px;
cursor:pointer;
transition:0.4s;
}

button:hover{
transform:scale(1.05);
box-shadow:0 10px 30px rgba(0,0,0,0.5);
}

.success{
background:#00c851;
padding:10px;
border-radius:15px;
text-align:center;
margin-bottom:15px;
font-size:14px;
}

.back-btn{
margin-top:15px;
background:linear-gradient(45deg,#ff512f,#dd2476);
}

.icon{
margin-right:8px;
}

</style>
</head>
<body>

<div class="glass">

<h2><i class="fas fa-exclamation-triangle icon"></i> Register Complaint</h2>

<% if(!success.equals("")){ %>
<div class="success">
<i class="fas fa-check-circle"></i> <%= success %>
</div>
<% } %>

<form method="post">

<div class="input-group">
<input type="number" name="ivrs" placeholder="Enter IVRS Number" required>
</div>

<div class="input-group">
<textarea name="message" placeholder="Enter your complaint..." required></textarea>
</div>

<button type="submit">
<i class="fas fa-paper-plane icon"></i> Submit Complaint
</button>

</form>

<button class="back-btn"
onclick="location.href='customerDashboard.jsp'">
<i class="fas fa-arrow-left icon"></i> Back to Dashboard
</button>

</div>

</body>
</html>
