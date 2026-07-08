<%-- 
    Document   : ResetPassword
    Created on : Jul 7, 2026, 9:21:00 AM
    Author     : Dinoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset Password</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <img src="img/profile.jpg" alt="profile" class="avatar"/>
            
            <form action="ResetPasswordServlet" method="post">
                <h1>Reset Password</h1>
                
                <p style="color:red; text-align:center">${error}</p>
                
                <input type="hidden" name="username" value="${username}">
                
                <div class="form-group">
                    <label for="password">New Password</label>
                    <input type="password" name="password" placeholder="Enter new password" required>
                    <small></small>                   
                </div>
                
                <input type="submit" value="Change Password">
                <a href="login.jsp">Back to Login</a>
            </form>
        </div>
    </body>
</html>
