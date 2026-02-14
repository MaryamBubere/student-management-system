<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Connection con = null;
PreparedStatement pst = null;

try {

    String id = request.getParameter("id");

    con = DBConnection.getConnection();

    pst = con.prepareStatement(
        "DELETE FROM batch WHERE id = ?"
    );

    pst.setString(1, id);

    pst.executeUpdate();

    // redirect to main batch page (original UI flow)
    response.sendRedirect("batch.jsp");

} catch(Exception e) {

    out.println("<h3 style='color:red;'>Error deleting batch: "
        + e.getMessage() + "</h3>");

} finally {

    try { if(pst!=null) pst.close(); } catch(Exception e){}
    try { if(con!=null) con.close(); } catch(Exception e){}

}
%>
