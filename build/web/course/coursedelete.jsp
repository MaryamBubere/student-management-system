 <%@page import="java.sql.*"%>
 <%Class.forName("com.mysql.jdbc.Driver");%>
 
 <%
 String batchid= request.getParameter("id");
 
 Connection con;
 PreparedStatement pst;
 
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/studentmanagement","root","root75");
pst = con.prepareStatement("delete from course where id=?");


pst.setString(1, batchid);
pst.executeUpdate();

String redirect= "course.jsp";
response.sendRedirect(redirect);

 %>