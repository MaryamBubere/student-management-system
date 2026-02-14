<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Connection con = null;
PreparedStatement pst = null;

try {

    String batchname = request.getParameter("bname");
    String year = request.getParameter("year");

    con = DBConnection.getConnection();

    pst = con.prepareStatement(
        "INSERT INTO batch(batchname, year) VALUES (?, ?)"
    );

    pst.setString(1, batchname);
    pst.setString(2, year);

    pst.executeUpdate();

    response.sendRedirect("batch.jsp");

} catch(Exception e) {

    out.println("<h3 style='color:red;'>Error: "
        + e.getMessage() + "</h3>");

} finally {

    try { if(pst!=null) pst.close(); } catch(Exception e){}
    try { if(con!=null) con.close(); } catch(Exception e){}

}
%>
