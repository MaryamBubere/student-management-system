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
        <h1>Add Course</h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" align="left" action="add.jsp">
                    <div>
                        <label class="form-label">Course Name</label>
                        <input type="text" id="name" name="name" placeholder="Course Name" class="form-control" required>
                    </div>
                    
                    <div>
                        <label class="form-label">Duration</label>
                        <input type="text" id="duration" name="duration" placeholder="Duration" class="form-control" required>
                    </div>
                    <br>
                    <div>
                        <input type="submit" name="submit" class="btn btn-info" value="submit">
                        <input type="reset" id="duration"  class="btn btn-warning" value="reset" >
                    </div>
                </form>
                
            </div>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tbl-course" class="table table-responsive table-bordered" cellpadding="0" width="100">
                        <thead>
                            <tr> 
                                <th>Course name</th>
                                <th>Duration</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
                            
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/studentmanagement", "root", "root75");
                            String query = "select * from course";
                            Statement st = con.createStatement();
                            rs = st.executeQuery(query);
                            while(rs.next())
                            {
                                String id = rs.getString("id");
                                
                            
                            
                            
                            
                            %>
                            <tr>
                                <td><%=rs.getString("course_name") %></td>
                                <td><%=rs.getString("duration") %></td>
                                <td><a href ="courseupdate.jsp?id=<%=id %>">Edit</a></td>
                                <td><a href ="coursedelete.jsp?id=<%=id %>">Delete</a></td>
                            </tr>
                             
                            
                            <% } %>
                            
                        </tbody>
                    </table>
                        
                </div>
            </div>
        </div>
         
    </body>
</html>

