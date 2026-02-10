<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();

ResultSet rs = st.executeQuery("select * from course");
%>

<h2>Course List</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Name</th>
</tr>

<%
while(rs.next()){
%>
<tr>
    <td><%=rs.getInt("id")%></td>
    <td><%=rs.getString("name")%></td>
</tr>
<%
}
con.close();
%>
</table>
