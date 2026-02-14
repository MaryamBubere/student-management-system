<%@page import="util.DBConnection"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Batch Management</title>

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

<a href="../index.jsp" class="btn btn-info small-btn mb-3">Back</a>

<h1>Batch</h1>

<div class="row">

<!-- FORM -->
<div class="col-sm-4">

<form method="POST" action="add.jsp">

<div class="mb-2">
<label class="form-label">Batch Name</label>
<input type="text"
name="bname"
class="form-control"
required>
</div>

<div class="mb-2">
<label class="form-label">Year</label>
<input type="text"
name="year"
class="form-control"
required>
</div>

<br>

<input type="submit"
class="btn btn-info"
value="Submit">

<input type="reset"
class="btn btn-warning"
value="Reset">

</form>

</div>


<!-- TABLE -->
<div class="col-sm-8">

<table class="table table-bordered table-striped">

<thead>

<tr>
<th>Batch Name</th>
<th>Year</th>
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

<td><%= rs.getString("batchname") %></td>

<td><%= rs.getString("year") %></td>

<td>
<a href="batchupdate.jsp?id=<%=id%>"
class="btn btn-warning btn-sm">
Edit
</a>
</td>

<td>
<a href="batchdelete.jsp?id=<%=id%>"
class="btn btn-danger btn-sm">
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

</div>

</div>

</div>

</body>
</html>
