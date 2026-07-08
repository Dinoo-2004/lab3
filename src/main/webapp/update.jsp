<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body>

<div class="container mt-4">

    <h2>Student Update Form</h2>

    <div class="text-end mb-3">
        <a href="index.jsp" class="btn btn-secondary">Back Home</a>
    </div>

<%
    //============================
    // Kết nối Database
    //============================

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    String id = request.getParameter("id");

    String name = "";
    String course = "";
    String fee = "";

    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/schooll",
                "root",
                "");

        //=====================================
        // Nếu nhấn nút Update
        //=====================================

        if(request.getParameter("submit") != null)
        {
            id = request.getParameter("id");
            name = request.getParameter("sname");
            course = request.getParameter("course");
            fee = request.getParameter("fee");

            pst = con.prepareStatement(
            "UPDATE records SET stname=?, course=?, fee=? WHERE id=?");

            pst.setString(1, name);
            pst.setString(2, course);
            pst.setString(3, fee);
            pst.setString(4, id);

            pst.executeUpdate();

%>

<script>
    alert("Update Successful!");
    window.location="index.jsp";
</script>

<%

        }

        //=====================================
        // Lấy dữ liệu sinh viên theo ID
        //=====================================

        pst = con.prepareStatement(
        "SELECT * FROM records WHERE id=?");

        pst.setString(1, id);

        rs = pst.executeQuery();

        if(rs.next())
        {
            name = rs.getString("stname");
            course = rs.getString("course");
            fee = rs.getString("fee");
        }

%>

<form method="post">

    <input type="hidden"
           name="id"
           value="<%=id%>">

    <div class="mb-3">
        <label class="form-label">
            Student Name
        </label>

        <input
            type="text"
            class="form-control"
            name="sname"
            value="<%=name%>"
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
            value="<%=course%>"
            required>
    </div>

    <div class="mb-3">
        <label class="form-label">
            Fee
        </label>

        <input
            type="text"
            class="form-control"
            name="fee"
            value="<%=fee%>"
            required>
    </div>

    <input
        type="submit"
        name="submit"
        value="Update"
        class="btn btn-primary">

    <input
        type="reset"
        value="Reset"
        class="btn btn-warning">

</form>

<%

    }
    catch(Exception e)
    {
        out.println("<h3 style='color:red'>" + e.getMessage() + "</h3>");
    }
    finally
    {
        try
        {
            if(rs != null)
                rs.close();

            if(pst != null)
                pst.close();

            if(con != null)
                con.close();
        }
        catch(Exception ex)
        {

        }
    }

%>

</div>

</body>
</html>