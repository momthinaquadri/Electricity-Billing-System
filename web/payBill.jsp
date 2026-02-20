<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
int billId = Integer.parseInt(request.getParameter("bill_id"));

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM bills WHERE bill_id=?"
);
ps.setInt(1,billId);
ResultSet rs = ps.executeQuery();
rs.next();

double amount = rs.getDouble("amount");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Secure Payment Processing</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<!-- Font Awesome -->
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
color:white;
}

.payment-box{
background:rgba(255,255,255,0.08);
backdrop-filter:blur(15px);
padding:50px;
border-radius:25px;
text-align:center;
box-shadow:0 20px 60px rgba(0,0,0,0.6);
width:420px;
position:relative;
}

/* Secure badge */
.secure{
position:absolute;
top:20px;
right:25px;
font-size:14px;
color:#00f2fe;
}

.secure i{
margin-right:5px;
}

/* Loader Circle */
.loader{
width:90px;
height:90px;
border:8px solid rgba(255,255,255,0.2);
border-top:8px solid #00f2fe;
border-radius:50%;
animation:spin 1s linear infinite;
margin:20px auto;
}

@keyframes spin{
100%{transform:rotate(360deg);}
}

.amount{
font-size:28px;
margin:20px 0;
font-weight:600;
color:#00f2fe;
}

.bank{
margin-top:10px;
font-size:14px;
opacity:0.8;
}

.bank i{
margin-right:6px;
}

.processing{
margin-top:15px;
font-size:15px;
letter-spacing:0.5px;
}

.processing i{
color:#00f2fe;
margin-right:6px;
animation:pulse 1s infinite;
}

@keyframes pulse{
0%{opacity:0.3;}
50%{opacity:1;}
100%{opacity:0.3;}
}

</style>

<script>
setTimeout(function(){
window.location="paymentSuccess.jsp?bill_id=<%=billId%>";
},3000);
</script>

</head>

<body>

<div class="payment-box">

<div class="secure">
<i class="fas fa-lock"></i> Secure Payment
</div>

<i class="fas fa-credit-card" style="font-size:40px;color:#00f2fe;"></i>

<div class="loader"></div>

<div class="amount">
    <%=amount%>
</div>

<div class="bank">
<i class="fas fa-university"></i> Connecting to Bank Server...
</div>

<div class="processing">
<i class="fas fa-sync-alt"></i>
Processing your transaction securely...
</div>

</div>

</body>
</html>