<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin Secure Login</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

<style>
*{
margin:0;
padding:0;
box-sizing:border-box;
}

body{
font-family:'Poppins',sans-serif;
height:100vh;
display:flex;
justify-content:center;
align-items:center;
overflow:hidden;
background: linear-gradient(-45deg,#141e30,#243b55,#0f2027,#1c1c1c);
background-size:400% 400%;
animation:gradientBG 12s ease infinite;
}

/* Glow Background */
body::before{
content:"";
position:absolute;
width:600px;
height:600px;
background:radial-gradient(circle, rgba(0,255,255,0.2), transparent 60%);
top:-200px;
left:-200px;
animation:moveGlow 10s infinite alternate;
}

body::after{
content:"";
position:absolute;
width:500px;
height:500px;
background:radial-gradient(circle, rgba(255,0,150,0.2), transparent 60%);
bottom:-200px;
right:-200px;
animation:moveGlow 8s infinite alternate-reverse;
}

/* Card */
.container{
position:relative;
z-index:2;
background: rgba(255,255,255,0.08);
backdrop-filter: blur(25px);
padding:60px 45px;
border-radius:30px;
text-align:center;
color:white;
width:420px;
border:1px solid rgba(255,255,255,0.3);
box-shadow:0 35px 90px rgba(0,0,0,0.8);
animation:fadeIn 1s ease-in-out;
}

/* Neon Border */
.container::before{
content:"";
position:absolute;
inset:0;
border-radius:30px;
padding:2px;
background:linear-gradient(45deg,#00f2ff,#ff00c8,#00f2ff);
-webkit-mask:
linear-gradient(#000 0 0) content-box,
linear-gradient(#000 0 0);
-webkit-mask-composite: xor;
mask-composite: exclude;
animation:borderMove 4s linear infinite;
}

h2{
margin-bottom:30px;
font-weight:600;
letter-spacing:1px;
}

.input-group{
position:relative;
margin:18px 0;
}

.input-group i{
position:absolute;
top:14px;
left:15px;
color:#ccc;
}

input{
width:100%;
padding:14px 14px 14px 45px;
border:none;
border-radius:14px;
background:rgba(255,255,255,0.15);
color:white;
font-size:14px;
outline:none;
transition:0.3s;
}

input:focus{
background:rgba(255,255,255,0.25);
box-shadow:0 0 15px rgba(0,255,255,0.6);
}

/* Login Button */
.login-btn{
width:100%;
padding:15px;
margin-top:20px;
background: linear-gradient(45deg,#ff416c,#ff4b2b);
border:none;
color:white;
border-radius:14px;
cursor:pointer;
font-weight:600;
font-size:15px;
transition:0.3s;
}

.login-btn:hover{
transform:translateY(-4px);
box-shadow:0 15px 35px rgba(0,0,0,0.6);
}

/* Back Button */
.back-btn{
display:block;
text-decoration:none;
text-align:center;
margin-top:15px;
padding:15px;
background: linear-gradient(45deg,#11998e,#38ef7d);
color:white;
border-radius:14px;
font-weight:600;
transition:0.3s;
}

.back-btn:hover{
transform:translateY(-4px);
box-shadow:0 15px 35px rgba(0,0,0,0.6);
}

/* Error */
.error{
margin-top:15px;
background:rgba(255,0,0,0.25);
padding:10px;
border-radius:10px;
font-size:14px;
animation:shake 0.4s;
}

/* Animations */
@keyframes gradientBG {
0% {background-position: 0% 50%;}
50% {background-position: 100% 50%;}
100% {background-position: 0% 50%;}
}

@keyframes moveGlow{
from{transform:translate(0,0);}
to{transform:translate(60px,60px);}
}

@keyframes fadeIn{
from{opacity:0;transform:translateY(20px);}
to{opacity:1;transform:translateY(0);}
}

@keyframes shake{
0%,100%{transform:translateX(0);}
25%{transform:translateX(-5px);}
75%{transform:translateX(5px);}
}

@keyframes borderMove{
0%{filter:hue-rotate(0deg);}
100%{filter:hue-rotate(360deg);}
}
</style>
</head>

<body>

<div class="container">

<h2>
<i class="fas fa-user-shield"></i>
Admin Secure Login
</h2>

<form method="post">

<div class="input-group">
<i class="fas fa-user"></i>
<input name="user" placeholder="Username" required>
</div>

<div class="input-group">
<i class="fas fa-lock"></i>
<input type="password" name="pass" placeholder="Password" required>
</div>

<button type="submit" class="login-btn">
<i class="fas fa-bolt"></i> Secure Login
</button>

</form>

<a href="index.html"><i class="fas fa-sign-out-alt"></i> Logout</a>

<%
if(request.getParameter("user")!=null){
PreparedStatement ps=con.prepareStatement(
"select * from admin where username=? and password=?"
);
ps.setString(1,request.getParameter("user"));
ps.setString(2,request.getParameter("pass"));
ResultSet rs=ps.executeQuery();

if(rs.next()){
response.sendRedirect("adminDashboard.jsp");
}else{
out.println("<div class='error'><i class='fas fa-exclamation-triangle'></i> Invalid Username or Password</div>");
}
}
%>

</div>

</body>
</html>
