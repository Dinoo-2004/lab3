<%-- 
    Document   : ResetPassword
    Created on : Jul 7, 2026, 9:21:00 AM
    Author     : Dinoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h2>Reset Password</h2>


        <form action="ResetPasswordServlet" method="post">


            <input type="hidden" 
                   accesskey="" accept=""name="name"
                   value="${username}">


        New Password:

            <input type="password"
                    name="password">


        <button>
            Change Password
        </button>


        </form>
    </body>
</html>
