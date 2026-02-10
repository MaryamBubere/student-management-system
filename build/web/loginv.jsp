<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
    "select * from login where username=? and password=?"
);

ps.setString(1, username);
ps.setString(2, password);

ResultSet rs = ps.executeQuery();

if(rs.next()){
    response.sendRedirect("home.jsp");
}else{
    out.println("Invalid Login");
}

con.close();
%>
