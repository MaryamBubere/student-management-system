<%-- 
    Document   : login
    Created on : 30-Jan-2025, 6:20:13 pm
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h1>LOGIN</h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="loginv.jsp">
                    <div align="left"> 
                        <label class="form-label">Username</label>
                        <input type="text" id="uname" name="uname" class="form-control" placeholder="Username" size="30px" required>
                    </div>
                    <br>
                   
                    <div align="left"> 
                        <label class="form-label">Password</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Password" size="30px" required>
                    </div>
                    <br> 
                    <div align="left"> 
                        <input type="submit" id="submit" value="submit" class="btn btn-info">
                        <input type="reset" id="reset" name="reset" value="reset" class="btn btn-warning">
                    </div>
                        
                </form>
        </div>        
        
            <div class="col-sm-8">
                <img src="images/Student.png" alt=""/>
                
            </div>
    </body>
</html>
