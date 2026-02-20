<!DOCTYPE html>
<html>
<head>
<title>Admin Profile</title>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: 'Poppins', sans-serif;
}

body{
    display:flex;
    min-height:100vh;
    background: linear-gradient(135deg,#141e30,#243b55);
}

/* ================= Sidebar ================= */
.sidebar{
    width:240px;
    background:rgba(255,255,255,0.05);
    backdrop-filter: blur(15px);
    padding:30px 20px;
    color:white;
    box-shadow: 5px 0 25px rgba(0,0,0,0.3);
}

.sidebar h2{
    text-align:center;
    margin-bottom:40px;
    font-weight:600;
    letter-spacing:1px;
}

.sidebar a{
    display:flex;
    align-items:center;
    gap:12px;
    color:white;
    text-decoration:none;
    padding:12px;
    margin:12px 0;
    border-radius:10px;
    transition:0.4s;
}

.sidebar a i{
    font-size:18px;
}

.sidebar a:hover{
    background:linear-gradient(45deg,#00c6ff,#0072ff);
    transform:translateX(5px);
}

/* ================= Main ================= */
.main{
    flex:1;
    padding:60px;
    color:white;
}

/* ================= Card ================= */
.card{
    max-width:750px;
    background:rgba(255,255,255,0.08);
    backdrop-filter: blur(20px);
    border-radius:20px;
    padding:40px;
    box-shadow:0 20px 40px rgba(0,0,0,0.4);
    transition:0.4s;
}

.card:hover{
    transform:translateY(-8px);
}

.card .fa-user-shield{
    font-size:70px;
    background:linear-gradient(45deg,#00c6ff,#0072ff);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
    margin-bottom:15px;
}

.card h2{
    font-size:28px;
    margin-bottom:5px;
}

.card p{
    opacity:0.8;
    margin-bottom:25px;
}

.card h3{
    margin-bottom:20px;
    font-weight:600;
    border-bottom:1px solid rgba(255,255,255,0.2);
    padding-bottom:10px;
}

/* ================= Roles ================= */
.role{
    display:flex;
    align-items:center;
    gap:15px;
    padding:12px;
    border-radius:12px;
    margin:12px 0;
    transition:0.3s;
    background:rgba(255,255,255,0.05);
}

.role i{
    font-size:18px;
    color:#00c6ff;
}

.role:hover{
    background:linear-gradient(45deg,#00c6ff,#0072ff);
    transform:scale(1.03);
}

.role:hover i{
    color:white;
}

</style>
</head>

<body>

<div class="sidebar">
    <h2><i class="fas fa-user-crown"></i> Admin</h2>
    <a href="adminDashboard.jsp"><i class="fas fa-gauge-high"></i> Dashboard</a>
    <a href="adminProfile.jsp"><i class="fas fa-id-badge"></i> Profile</a>
</div>

<div class="main">
    <h1><i class="fas fa-user-shield"></i> Admin Profile</h1>
    <br>

    <div class="card">
        <i class="fas fa-user-shield"></i>
        <h2>Administrator</h2>
        <p><i class="fas fa-bolt"></i> Electricity Billing System Super Admin</p>

        <h3>Powers & Functions</h3>

        <div class="role">
            <i class="fas fa-users-cog"></i>
            <span>Manage Operators & Staff Accounts</span>
        </div>

        <div class="role">
            <i class="fas fa-user-plus"></i>
            <span>Add, Edit & Remove Consumers</span>
        </div>

        <div class="role">
            <i class="fas fa-file-invoice-dollar"></i>
            <span>Generate & Approve Electricity Bills</span>
        </div>

        <div class="role">
            <i class="fas fa-money-check-alt"></i>
            <span>Monitor Payments & Transactions</span>
        </div>

        <div class="role">
            <i class="fas fa-chart-line"></i>
            <span>View Reports & Revenue Analytics</span>
        </div>

        <div class="role">
            <i class="fas fa-database"></i>
            <span>Maintain Database & Records</span>
        </div>

        <div class="role">
            <i class="fas fa-shield-halved"></i>
            <span>Ensure Security & Access Control</span>
        </div>

        <div class="role">
            <i class="fas fa-cogs"></i>
            <span>Configure Tariff Rates & System Settings</span>
        </div>

    </div>
</div>

</body>
</html>
