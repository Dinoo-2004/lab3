<%-- 
    Document   : forgotPassword
    Created on : Jul 7, 2026, 9:13:14 AM
    Author     : Dinoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot Password</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <img src="img/profile.jpg" alt="profile" class="avatar"/>
            
            <form action="ForgotPasswordServlet" method="post">
                <h1>Forgot Password</h1>
                
                <p style="color:red; text-align:center">${error}</p>
                
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" placeholder="Enter username" required>
                    <small></small>                   
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" placeholder="Enter email address" required>
                    <small></small>                   
                </div>
                
                <input type="submit" value="Verify">
                <a href="login.jsp">Back to Login</a>
            </form>
        </div>
    </body>
</html>
