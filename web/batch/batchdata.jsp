<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>Batch Data</title>

<!-- RESTORED ORIGINAL BOOTSTRAP CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.small-btn {
    padding: 2px 8px;
    font-size: 12px;
}
</style>

</head>

<body>

<div class="container mt-3">

<h2>Batch List</h2>

<table class="table table-bordered table-striped">

<thead>
<tr>
    <th>ID</th>
    <th>Batch Name</th>
    <th>Edit</th>
    <th>Delete</th>
</tr>
</thead>

<tbody>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try {

    con = DBConnection.getConnection();

    st = con.createStatement();

    rs = st.executeQuery("SELECT * FROM batch");

    while(rs.next()) {

        String id = rs.getString("id");
%>

<tr>

<td><%= rs.getString("id") %></td>

<td><%= rs.getString("name") %></td>

<td>
<a href="batchupdate.jsp?id=<%=id%>" class="btn btn-warning btn-sm">
Edit
</a>
</td>

<td>
<a href="batchdelete.jsp?id=<%=id%>" class="btn btn-danger btn-sm">
Delete
</a>
</td>

</tr>

<%
    }

} catch(Exception e) {
%>

<tr>
<td colspan="4" style="color:red;">
Database Error: <%= e.getMessage() %>
</td>
</tr>

<%
} finally {

    try { if(rs!=null) rs.close(); } catch(Exception e){}
    try { if(st!=null) st.close(); } catch(Exception e){}
    try { if(con!=null) con.close(); } catch(Exception e){}

}
%>

</tbody>

</table>

<a href="batch.jsp" class="btn btn-info small-btn">
Back
</a>

</div>

</body>
</html>
