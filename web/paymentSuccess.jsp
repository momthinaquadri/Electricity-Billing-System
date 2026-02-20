<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
int billId = Integer.parseInt(request.getParameter("bill_id"));

PreparedStatement update = con.prepareStatement(
"UPDATE bills SET status='Paid' WHERE bill_id=?"
);
update.setInt(1,billId);
update.executeUpdate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Successful</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

body{
margin:0;
font-family:Poppins;
background:linear-gradient(135deg,#11998e,#38ef7d);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
overflow:hidden;
}

.card{
background:rgba(255,255,255,0.95);
padding:60px;
border-radius:30px;
text-align:center;
box-shadow:0 25px 70px rgba(0,0,0,0.3);
width:420px;
position:relative;
animation:fadeIn 0.8s ease-in-out;
}

@keyframes fadeIn{
from{opacity:0;transform:translateY(30px);}
to{opacity:1;transform:translateY(0);}
}

.success-circle{
width:100px;
height:100px;
border-radius:50%;
background:linear-gradient(45deg,#00c851,#007e33);
display:flex;
justify-content:center;
align-items:center;
margin:auto;
box-shadow:0 10px 25px rgba(0,0,0,0.3);
animation:pop 0.5s ease;
}

@keyframes pop{
0%{transform:scale(0);}
100%{transform:scale(1);}
}

.success-circle i{
font-size:45px;
color:white;
}

h2{
margin-top:20px;
font-weight:700;
color:#11998e;
}

p{
font-size:14px;
color:#555;
margin-top:10px;
}

.redirect{
margin-top:15px;
font-size:13px;
color:gray;
}

.btn{
margin-top:25px;
padding:12px 30px;
border:none;
border-radius:30px;
background:linear-gradient(45deg,#11998e,#38ef7d);
color:white;
cursor:pointer;
font-size:14px;
transition:0.3s;
}

.btn:hover{
transform:scale(1.05);
box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

.icon{
margin-right:8px;
}

/* subtle background animation */
body::before{
content:"";
position:absolute;
width:500px;
height:500px;
background:rgba(255,255,255,0.1);
border-radius:50%;
top:-150px;
right:-150px;
}

body::after{
content:"";
position:absolute;
width:400px;
height:400px;
background:rgba(255,255,255,0.08);
border-radius:50%;
bottom:-120px;
left:-120px;
}

</style>

<script>
setTimeout(function(){
window.location="printBill.jsp?bill_id=<%=billId%>";
},3000);
</script>

</head>

<body>

<div class="card">

<div class="success-circle">
<i class="fas fa-check"></i>
</div>

<h2>
<i class="fas fa-circle-check icon"></i>
Payment Successful
</h2>

<p>
<i class="fas fa-shield-check icon"></i>
Your transaction has been completed securely.
</p>

<div class="redirect">
<i class="fas fa-rotate-right icon"></i>
Redirecting to invoice...
</div>

<button class="btn"
onclick="location.href='printBill.jsp?bill_id=<%=billId%>'">
<i class="fas fa-file-invoice icon"></i>
View Invoice Now
</button>

</div>

</body>
</html>
