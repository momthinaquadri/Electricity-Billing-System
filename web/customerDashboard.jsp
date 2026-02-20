<%@ include file="db.jsp" %>
<html>
<head>
<title>Customer Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

/* Background */
body{
height:100vh;
background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
display:flex;
justify-content:center;
align-items:center;
overflow:hidden;
color:white;
}

/* Floating Glow Effect */
body::before{
content:'';
position:absolute;
width:500px;
height:500px;
background:radial-gradient(circle,#00f2ff,#ff00c8);
filter:blur(200px);
animation:move 8s infinite alternate;
z-index:-1;
}

@keyframes move{
0%{transform:translate(-200px,-200px);}
100%{transform:translate(200px,200px);}
}

/* Glass Container */
.container{
background:rgba(255,255,255,0.08);
padding:60px;
border-radius:30px;
backdrop-filter:blur(25px);
box-shadow:0 0 60px rgba(0,0,0,0.7);
text-align:center;
width:600px;
transition:0.4s;
}

.container:hover{
transform:scale(1.02);
}

h1{
margin-bottom:40px;
font-size:30px;
}

/* Dashboard Grid */
.grid{
display:grid;
grid-template-columns:1fr 1fr;
gap:25px;
}

/* Card Style */
.card{
background:linear-gradient(45deg,#00f2ff,#ff00c8);
padding:30px;
border-radius:25px;
cursor:pointer;
transition:0.4s;
box-shadow:0 0 25px rgba(255,0,200,0.6);
font-size:18px;
}

.card i{
font-size:30px;
margin-bottom:10px;
display:block;
}

.card:hover{
transform:translateY(-10px) scale(1.05);
box-shadow:0 0 50px rgba(0,255,255,0.9);
}

/* Logout Button */
.logout{
margin-top:30px;
padding:12px 35px;
border:none;
border-radius:30px;
background:white;
color:black;
font-weight:bold;
cursor:pointer;
transition:0.3s;
}

.logout:hover{
background:#ff4d4d;
color:white;
transform:scale(1.1);
}
</style>
</head>

<body>

<div class="container">

<h1><i class="fas fa-user-circle"></i> Customer Dashboard</h1>

<div class="grid">

<div class="card"
onclick="location.href='newConnection.jsp'">
<i class="fas fa-plug"></i>
Request New Connection
</div>

<div class="card"
onclick="location.href='customerBills.jsp'">
<i class="fas fa-file-invoice"></i>
View / Pay Bill
</div>

<div class="card"
onclick="location.href='complaint.jsp'">
<i class="fas fa-exclamation-circle"></i>
Register Complaint
</div>



</div>

<button class="logout"
onclick="location.href='index.html'">
<i class="fas fa-sign-out-alt"></i> Logout
</button>

</div>

</body>
</html>
