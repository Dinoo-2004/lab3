<%-- 
    Document   : registration
    Created on : Jul 1, 2026, 1:16:18 PM
    Author     : Dinoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>login Account</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <img src="img/profile.jpg" alt="profile" class="avatar"/>
            <small></small>
            
            <form action="LoginServlet" method="post">
                <h1>login Account</h1>
                
                <p style="color:red; text-align:center">${error}</p>
                
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="name" placeholder="Enter username" required>
                    <small></small>                   
                </div>
                
                        
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" placeholder="Enter password" required>
                    <small></small>                   
                </div>
                                                
                <input type="submit" value="Login">
                <a href="forgotPassword.jsp"> Forget Password</a>
                <a href="registration.jsp">Create New Account</a>
            </form>
        </div>
    </body>
</html>
