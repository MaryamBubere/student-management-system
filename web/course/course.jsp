<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Course List</title>
</head>
<body>

<h2>Course Details</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Course Name</th>
    </tr>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try {
    con = DBConnection.getConnection();
    st = con.createStatement();
    rs = st.executeQuery("SELECT * FROM course");

    while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
        </tr>
<%
    }
} catch (Exception e) {
    out.println("<p style='color:red'>Database Error</p>");
    e.printStackTrace();
} finally {
    if (rs != null) rs.close();
    if (st != null) st.close();
    if (con != null) con.close();
}
%>

</table>

</body>
</html>
