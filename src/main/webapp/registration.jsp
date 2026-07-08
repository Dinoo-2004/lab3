<%-- 
    Document   : registration
    Created on : Jul 1, 2026, 1:16:18 PM
    Author     : Dinoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Form Validation</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <img src="img/profile.jpg" alt="profile" class="avatar"/>
            <small></small>
            
            <form action="RegisterServlet" method="post" >
                <h1>Register</h1>
                
                <!--username -->
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="name" placeholder="Enter username" id="username" required>
                    <small></small>                   
                </div>
                
                <!--email-->
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" placeholder="Enter email" id="email" required>
                    <small></small>                   
                </div>
                
                <!--password-->
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" placeholder="Enter password" id="password" required>
                    <small></small>                   
                </div>
                
                <!--confirm password-->
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" name="confirmPassword" placeholder="Confirm Password" id="confirmPassword" required>
                    <small></small>                   
                </div>
                
                <!--button-->
                <input type="submit" value="Register">
                <a href="login.jsp"> Already have account?</a>
            </form>
        </div>
        
         <script src="validate.js" type="text/javascript"></script>  
    </body>
</html>
