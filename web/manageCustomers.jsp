<%@ include file="db.jsp" %>
<%@ page import="java.sql.*" %>

<%
String action = request.getParameter("action");
String idParam = request.getParameter("id");

if(action != null && idParam != null){

    int id = Integer.parseInt(idParam);

   
    if(action.equals("approve")){

        long ivrs = (id * 100L) + 1000L;

        PreparedStatement ps = con.prepareStatement(
        "UPDATE customers SET status='Approved', ivrs_no=? WHERE id=?");

        ps.setLong(1, ivrs);
        ps.setInt(2, id);
        ps.executeUpdate();
        ps.close();
    }

    // ===== REJECT LOGIC =====
    else if(action.equals("reject")){

        PreparedStatement ps = con.prepareStatement(
        "DELETE FROM customers WHERE id=?");

        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
    }

    response.sendRedirect("manageCustomers.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Manage Customers</title>

<link rel="stylesheet" href="admin-style.css">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
.table-box{
background:rgba(255,255,255,0.12);
backdrop-filter:blur(20px);
padding:30px;
border-radius:20px;
box-shadow:0 10px 40px rgba(0,0,0,0.4);
}

table{
width:100%;
border-collapse:collapse;
color:white;
}

th,td{
padding:15px;
text-align:center;
}

th{
background:linear-gradient(45deg,#00c6ff,#0072ff);
}

tr{
border-bottom:1px solid rgba(255,255,255,0.2);
}

.btn{
padding:8px 15px;
border:none;
border-radius:8px;
cursor:pointer;
color:white;
transition:0.3s;
font-size:13px;
}

.approve{
background:linear-gradient(45deg,#00b09b,#96c93d);
}

.reject{
background:linear-gradient(45deg,#ff416c,#ff4b2b);
}

.btn:hover{
transform:scale(1.1);
}

.status-approved{
color:#00ffcc;
font-weight:bold;
}

.status-pending{
color:#ffd700;
font-weight:bold;
}
</style>
</head>

<body>

<div class="sidebar">
<h2><i class="fas fa-bolt"></i> Admin</h2>
<a href="adminDashboard.jsp"><i class="fas fa-chart-line"></i> Dashboard</a>
<a href="manageCustomers.jsp"><i class="fas fa-users"></i> Customers</a>
</div>

<div class="main">
<h1><i class="fas fa-user-check"></i> Customer Requests</h1>

<div class="table-box">
<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Address</th>
<th>IVRS Number</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM customers");

while(rs.next()){
    String status = rs.getString("status");
    long ivrs_no = rs.getLong("ivrs_no");
%>

<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("address") %></td>

<td>
<%= ivrs_no == 0 ? "-" : ivrs_no %>
</td>

<td class="<%= status.equals("Approved") ? "status-approved" : "status-pending" %>">
<%= status %>
</td>

<td>
<% if(status.equals("Pending")){ %>

<a href="manageCustomers.jsp?action=approve&id=<%= rs.getInt("id") %>">
<button class="btn approve">
<i class="fas fa-check-circle"></i> Approve
</button>
</a>

<a href="manageCustomers.jsp?action=reject&id=<%= rs.getInt("id") %>">
<button class="btn reject">
<i class="fas fa-times-circle"></i> Reject
</button>
</a>

<% } else { %>
<i class="fas fa-lock"></i>
<% } %>
</td>

</tr>

<% } %>

</table>
</div>
</div>

</body>
</html>
