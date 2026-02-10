<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement("delete from batch where id=?");
ps.setInt(1, id);

ps.executeUpdate();

response.sendRedirect("batchdata.jsp");

con.close();
%>
