<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>

<%
Connection con = null;
PreparedStatement pst = null;

try {

    String id = request.getParameter("id");

    con = DBConnection.getConnection();

    pst = con.prepareStatement("DELETE FROM course WHERE id = ?");

    pst.setString(1, id);

    pst.executeUpdate();

    response.sendRedirect("course.jsp");

} catch(Exception e) {

    out.println("<h3 style='color:red;'>Error deleting record: " + e.getMessage() + "</h3>");

} finally {

    try { if(pst!=null) pst.close(); } catch(Exception e){}
    try { if(con!=null) con.close(); } catch(Exception e){}

}
%>
