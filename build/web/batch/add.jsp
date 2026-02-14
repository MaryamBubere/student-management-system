<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Connection con = null;
PreparedStatement pst = null;

try {

    String name = request.getParameter("name");

    con = DBConnection.getConnection();

    pst = con.prepareStatement(
        "INSERT INTO batch(name) VALUES (?)"
    );

    pst.setString(1, name);

    pst.executeUpdate();

    // redirect back to batch main page (original behavior)
    response.sendRedirect("batch.jsp");

} catch(Exception e) {

    out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");

} finally {

    try { if(pst!=null) pst.close(); } catch(Exception e){}
    try { if(con!=null) con.close(); } catch(Exception e){}

}
%>
