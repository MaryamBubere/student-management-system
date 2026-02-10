<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<html>
<head>
    <title>Course Data</title>
</head>
<body>

<h2>Courses</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Name</th>
</tr>

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM course");

while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
</tr>
<%
}
con.close();
%>

</table>

</body>
</html>
