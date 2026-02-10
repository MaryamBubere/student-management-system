<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>

<%
String name = request.getParameter("name");

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement("insert into course(name) values(?)");

ps.setString(1, name);

ps.executeUpdate();

response.sendRedirect("coursedata.jsp");

con.close();
%>
