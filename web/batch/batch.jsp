<%-- 
    Document   : course
    Created on : 30-Jan-2025, 7:12:10 pm
    Author     : Dell
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
        .small-btn {
            padding: 2px 8px;
            font-size: 12px;
        }
             </style>
    <a href="../index.jsp" class="btn btn-info small-btn">Back</a>
    </head>
    <body>
        <h1>Batch</h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" align="left" action="add.jsp">
                    <div>
                        <lable class="form-label">BATCH NAME</lable>
                        <input type="text" id="bname" name="bname" placeholder="Batch Name" class="form-control" required>
                    </div>
                    
                    <div>
                        <lable class="form-label">YEAR</lable>
                        <input type="text" id="year" name="year" placeholder="Year" class="form-control" required>
                    </div>
                    <br>
                    <div>
                        <input type="submit" name="submit" class="btn btn-info" value="submit">
                        <input type="reset" name="reset"  class="btn btn-warning" value="reset">
                    </div>
                </form>
                
            </div>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tbl-course" class="table table-responsive table-bordered" cellpadding="0" width="100">
                        <thead>
                        <tr> 
                            <th>Batch Name</th>
                            <th>Year</th>
                            <th>Edit</th>
                             <th>Delete</th>
                        </tr>
                        <tbody>
                            <%
                            Connection con= DBConnection.getConnection();
                            PreparedStatement pst;
                            ResultSet rs;
                            
                            Class.forName("com.mysql.jdbc.Driver");
                            
                            String query = "select * from batch";
                            Statement st = con.createStatement();
                            rs = st.executeQuery(query);
                            while(rs.next())
                            {
                                String id = rs.getString("id");
                                
                            
                            
                            
                            
                            %>
                            <tr>
                                <td><%= rs.getString("batchname")%></td>
                                <td><%= rs.getString("year") %></td>
                                <td><a href ="batchupdate.jsp?id=<%=id %>">Edit</a></td>
                                <td><a href ="batchdelete.jsp?id=<%=id %>">Delete</a></td>
                            </tr>
                             
                            
                            <% } %>
                            
                        </tbody>
                        
                        
                </div>
            </div>
        </div>
                            
             
    </body>
</html>

