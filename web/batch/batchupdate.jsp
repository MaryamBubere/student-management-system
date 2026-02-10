
<%-- 
    Document   : course
    Created on : 30-Jan-2025, 7:12:10 pm
    Author     : Dell
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h1>Batch </h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" align="left" action="batchdata.jsp">
                    <%
                     Connection con;
                     PreparedStatement pst;
                     ResultSet rs;
                            
                     Class.forName("com.mysql.jdbc.Driver");
                     con = DriverManager.getConnection("jdbc:mysql://localhost/studentmanagement", "root", "root75");
                     
                     String id = request.getParameter("id");
                     
                     pst = con.prepareStatement("select * from batch where id = ?");
                     pst.setString(1, id);
                     rs = pst.executeQuery();
                     
                     while(rs.next())
                     {
                    
                    %>
                    <div>
                        <lable class="form-label">Batch Id</lable>
                        <input type="text" id="id" name="id" placeholder="Batch Id" class="form-control" value="<%= rs.getString("id") %>" required>
                    </div>
                    
                    <div>
                        <lable class="form-label">Batch Name</lable>
                        <input type="text" id="bname" name="bname" placeholder="Batch Name" class="form-control" value="<%= rs.getString("batchname") %>" required>
                    </div>
                    
                    <div>
                        <lable class="form-label">Year</lable>
                        <input type="text" id="year" name="year" placeholder="Year" class="form-control" value="<%= rs.getString("year") %>" required>
                    </div>
                    
                    <div>
                        <input type="submit" name="submit" class="btn btn-info" value="submit">
                        <input type="reset" id="duration"  class="btn btn-warning" value="reset" >
                    </div>
                </form>>
                
            </div>
            <div class="col-sm-8">
            
            <% } %>
                        
                        
                 
            </div>
        </div>
        
    </body>
</html>

