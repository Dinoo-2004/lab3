<%-- 
    Document   : forgotPassword
    Created on : Jul 7, 2026, 9:13:14 AM
    Author     : Dinoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget</title>
    </head>
    <body>
        <form action="ForgotPasswordServlet" method="post">

    <label>Username</label>
    <input type="text" name="name" required>

    <label>Email</label>
    <input type="email" name="email" required>

    <button type="submit">Verify</button>

            </form>

        <p style="color:red">${error}</p>
    </body>
</html>
