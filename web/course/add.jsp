<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Connection con = null;
PreparedStatement ps = null;

try {

    String course_name = request.getParameter("name");
    String duration = request.getParameter("duration");

    con = DBConnection.getConnection();

    ps = con.prepareStatement(
        "INSERT INTO course(course_name, duration) VALUES (?, ?)"
    );

    ps.setString(1, course_name);
    ps.setString(2, duration);

    ps.executeUpdate();

    response.sendRedirect("course.jsp");

} catch(Exception e) {

    out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");

} finally {

    try { if(ps!=null) ps.close(); } catch(Exception e){}
    try { if(con!=null) con.close(); } catch(Exception e){}

}
%>
