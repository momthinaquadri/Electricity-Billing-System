<%@ include file="db.jsp" %>
<%
int id = Integer.parseInt(request.getParameter("id"));

// Generate IVRS from ID
long ivrs = (id * 100L) + 1000L;

// Update only if not already approved
PreparedStatement ps = con.prepareStatement(
    "UPDATE customers SET status='Approved', ivrs_no=? WHERE id=? AND status='Pending'"
);

ps.setLong(1, ivrs);
ps.setInt(2, id);
ps.executeUpdate();

ps.close();
con.close();

response.sendRedirect("viewRequests.jsp");
%>
