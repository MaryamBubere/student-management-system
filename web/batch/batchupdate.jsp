<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Update Batch</title>

<!-- RESTORED ORIGINAL BOOTSTRAP CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<div class="container mt-3">

<h2>Update Batch</h2>

<div class="row">

<div class="col-sm-4">

<form method="POST" action="batchupdateprocess.jsp">

<%
Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;

try {

    con = DBConnection.getConnection();

    String id = request.getParameter("id");

    pst = con.prepareStatement("SELECT * FROM batch WHERE id = ?");

    pst.setString(1, id);

    rs = pst.executeQuery();

    if(rs.next()) {
%>

<div class="mb-2">
<label class="form-label">Batch Id</label>
<input type="text" class="form-control"
name="id"
value="<%= rs.getString("id") %>"
readonly>
</div>

<div class="mb-2">
<label class="form-label">Batch Name</label>
<input type="text" class="form-control"
name="name"
value="<%= rs.getString("name") %>"
required>
</div>

<div class="mt-2">
<input type="submit"
class="btn btn-info"
value="Update">

<a href="batch.jsp"
class="btn btn-warning">
Cancel
</a>
</div>

<%
    }

} catch(Exception e) {
%>

<p style="color:red;">
Error: <%= e.getMessage() %>
</p>

<%
} finally {

    try { if(rs!=null) rs.close(); } catch(Exception e){}
    try { if(pst!=null) pst.close(); } catch(Exception e){}
    try { if(con!=null) con.close(); } catch(Exception e){}

}
%>

</form>

</div>

</div>

</div>

</body>
</html>
