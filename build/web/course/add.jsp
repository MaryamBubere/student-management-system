<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<%
String name = request.getParameter("name");

Connection con = DBConnection.getConnection();
PreparedStatement ps =
    con.prepareStatement("INSERT INTO course(name) VALUES(?)");

ps.setString(1, name);
ps.executeUpdate();

con.close();
response.sendRedirect("coursedata.jsp");
%>
