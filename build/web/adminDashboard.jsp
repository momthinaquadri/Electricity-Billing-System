<%@ include file="db.jsp" %>
<%@ page import="java.sql.*" %>
<%
int totalCustomers = 0;
int totalBills = 0;
double totalRevenue = 0;
int totalComplaints = 0;

Statement st = con.createStatement();

ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM customers");
if(rs1.next()){
    totalCustomers = rs1.getInt(1);
}

ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM bills");
if(rs2.next()){
    totalBills = rs2.getInt(1);
}

ResultSet rs3 = st.executeQuery("SELECT SUM(amount) FROM bills WHERE status='Paid'");
if(rs3.next()){
    totalRevenue = rs3.getDouble(1);
}

ResultSet rs4 = st.executeQuery("SELECT COUNT(*) FROM complaints");
if(rs4.next()){
    totalComplaints = rs4.getInt(1);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<link rel="stylesheet" href="admin-style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

<div class="sidebar">
    <h2><i class="fas fa-bolt"></i> Admin</h2>

    <a href="adminDashboard.jsp"><i class="fas fa-chart-line"></i> Dashboard</a>
    <a href="manageCustomers.jsp"><i class="fas fa-users"></i> Customers</a>
    <a href="manageBills.jsp"><i class="fas fa-file-invoice"></i> Bills</a>
    <a href="revenue.jsp"><i class="fas fa-rupee-sign"></i> Revenue</a>

  
    <a href="viewComplaint.jsp">
        <i class="fas fa-exclamation-circle"></i> Complaints
    </a>

    <a href="adminProfile.jsp"><i class="fas fa-user-cog"></i> Profile</a>
    <a href="index.html"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

<div class="main">

    <h1>Welcome Admin</h1>

    <div class="cards">

        <div class="card">
            <i class="fas fa-users"></i>
            <h2><%= totalCustomers %></h2>
            <p>Total Customers</p>
        </div>

        <div class="card">
            <i class="fas fa-file-invoice"></i>
            <h2><%= totalBills %></h2>
            <p>Total Bills</p>
        </div>

        <div class="card"
             onclick="location.href='billHistory.jsp'">
             <i class="fas fa-history"></i>
             <h2>History</h2>
             <p>Bill History</p>
        </div>

        <div class="card">
            <i class="fas fa-rupee-sign"></i>
            <h2><%= totalRevenue %></h2>
            <p>Total Revenue</p>
        </div>

        <!-- NEW COMPLAINT CARD -->
        <div class="card"
             onclick="location.href='viewComplaint.jsp'">
            <i class="fas fa-exclamation-triangle"></i>
            <h2><%= totalComplaints %></h2>
            <p>Total Complaints</p>
        </div>
            

    </div>

</div>

</body>
</html>
