<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>

<%
Connection con = null;
PreparedStatement pst = null;

try {

    String id = request.getParameter("id");
    String name = request.getParameter("name");

    con = DBConnection.getConnection();

    pst = con.prepareStatement(
    "UPDATE batch SET name=? WHERE id=?"
    );

    pst.setString(1, name);
    pst.setString(2, id);

    pst.executeUpdate();

    response.sendRedirect("batch.jsp");

} catch(Exception e) {

    out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");

} finally {

    try { if(pst!=null) pst.close(); } catch(Exception e){}
    try { if(con!=null) con.close(); } catch(Exception e){}

}
%>
