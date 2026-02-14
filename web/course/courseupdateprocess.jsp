<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>

<%
Connection con = null;
PreparedStatement pst = null;

try {

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String duration = request.getParameter("duration");

    con = DBConnection.getConnection();

    pst = con.prepareStatement(
    "UPDATE course SET course_name=?, duration=? WHERE id=?"
    );

    pst.setString(1, name);
    pst.setString(2, duration);
    pst.setString(3, id);

    pst.executeUpdate();

    response.sendRedirect("course.jsp");

} catch(Exception e) {

    out.println("Error: " + e.getMessage());

} finally {

    try { if(pst!=null) pst.close(); } catch(Exception e){}
    try { if(con!=null) con.close(); } catch(Exception e){}

}
%>
