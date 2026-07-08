<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Register</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body>

<%
if(request.getParameter("submit") != null){

    String name = request.getParameter("sname");
    String course = request.getParameter("course");
    String fee = request.getParameter("fee");

    Connection con = null;
    PreparedStatement pst = null;

    try{

        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/schooll",
                "root",
                "");

        pst = con.prepareStatement(
                "INSERT INTO records(stname, course, fee) VALUES (?, ?, ?)");

        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);

        pst.executeUpdate();
%>

<script>
    alert("Record Added Successfully!");
    window.location="index.jsp";
</script>

<%
    }
    catch(Exception e){
        out.println("<h4 style='color:red'>" + e.getMessage() + "</h4>");
    }
    finally{

        try{
            if(pst != null) pst.close();
            if(con != null) con.close();
        }
        catch(Exception ex){}
    }
}
%>

<div class="container mt-4">

<div class="d-flex justify-content-between align-items-center mb-4">
    <h2>Student Register Form</h2>
    <a href="LogoutServlet" class="btn btn-danger">Logout</a>
</div>

<div class="row">

    <!-- ================= FORM ================= -->

    <div class="col-sm-4">

        <form method="post">

            <div class="mb-3">
                <label class="form-label">
                    Student Name
                </label>

                <input
                    type="text"
                    class="form-control"
                    name="sname"
                    placeholder="Student Name"
                    required>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    Course
                </label>

                <input
                    type="text"
                    class="form-control"
                    name="course"
                    placeholder="Course"
                    required>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    Fee
                </label>

                <input
                    type="number"
                    class="form-control"
                    name="fee"
                    placeholder="Fee"
                    required>
            </div>

            <div class="text-end">

                <input
                    type="submit"
                    name="submit"
                    value="Submit"
                    class="btn btn-primary">

                <input
                    type="reset"
                    value="Reset"
                    class="btn btn-warning">

            </div>

        </form>

    </div>

    <!-- ================= TABLE ================= -->

    <div class="col-sm-8">

        <table class="table table-bordered table-striped">

            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Student Name</th>
                    <th>Course</th>
                    <th>Fee</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>

            <tbody>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try{

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/schooll",
            "root",
            "");

    st = con.createStatement();

    rs = st.executeQuery("SELECT * FROM records");

    while(rs.next()){
%>

<tr>

    <td><%= rs.getInt("id") %></td>

    <td><%= rs.getString("stname") %></td>

    <td><%= rs.getString("course") %></td>

    <td><%= rs.getString("fee") %></td>

    <td>

        <a
        href="update.jsp?id=<%=rs.getInt("id")%>"
        class="btn btn-success btn-sm">

        Edit

        </a>

    </td>

    <td>

        <a
        href="delete.jsp?id=<%=rs.getInt("id")%>"
        class="btn btn-danger btn-sm"
        onclick="return confirm('Are you sure?')">

        Delete

        </a>

    </td>

</tr>

<%
    }

}
catch(Exception e){

    out.println("<tr>");
    out.println("<td colspan='6' style='color:red'>");
    out.println(e.getMessage());
    out.println("</td>");
    out.println("</tr>");

}
finally{

    try{

        if(rs!=null) rs.close();
        if(st!=null) st.close();
        if(con!=null) con.close();

    }
    catch(Exception ex){}

}
%>

            </tbody>

        </table>

    </div>

</div>

</div>

</body>
</html>