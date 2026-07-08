<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
</head>

<body>

<%

Connection con = null;
PreparedStatement pst = null;

try{

    String id = request.getParameter("id");

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/schooll",
            "root",
            "");

    pst = con.prepareStatement(
            "DELETE FROM records WHERE id=?");

    pst.setString(1,id);

    pst.executeUpdate();

%>

<script>

alert("Delete Successful!");

window.location="index.jsp";

</script>

<%

}
catch(Exception e){

    out.println(e.getMessage());

}
finally{

    try{

        if(pst!=null)
            pst.close();

        if(con!=null)
            con.close();

    }catch(Exception ex){}

}

%>

</body>
</html>