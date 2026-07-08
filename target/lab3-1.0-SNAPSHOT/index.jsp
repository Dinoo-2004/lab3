<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="newpackage.User"%>
<%
    User logUser = (User) session.getAttribute("logUser");
    if(logUser == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Register</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f4f6f9;
        }
        .custom-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            padding: 25px;
            border: 1px solid rgba(0,0,0,0.05);
        }
        .table-wrapper {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            border: 1px solid rgba(0,0,0,0.05);
            background: #ffffff;
        }
        .header-title {
            font-weight: 700;
            color: #2c3e50;
        }
    </style>
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

<div class="container py-5">

<div class="d-flex justify-content-between align-items-center mb-5 border-bottom pb-3">
    <h2 class="header-title"><i class="bi bi-mortarboard-fill text-primary me-2"></i> Student Register Form</h2>
    <div class="d-flex align-items-center">
        <span class="text-secondary fw-bold me-4"><i class="bi bi-person-circle me-1"></i> Xin chào, <%= logUser.getName() %>!</span>
        <a href="LogoutServlet" class="btn btn-outline-danger px-4 shadow-sm"><i class="bi bi-box-arrow-right me-1"></i> Logout</a>
    </div>
</div>

<div class="row">

    <!-- ================= FORM ================= -->

    <div class="col-lg-4 mb-4">

        <div class="custom-card">
            <h5 class="mb-4 text-secondary"><i class="bi bi-person-plus-fill me-2"></i>Add New Record</h5>
            <form method="post">

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="sname" name="sname" placeholder="Student Name" required>
                    <label for="sname">Student Name</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="course" name="course" placeholder="Course" required>
                    <label for="course">Course</label>
                </div>

                <div class="form-floating mb-4">
                    <input type="number" class="form-control" id="fee" name="fee" placeholder="Fee" required>
                    <label for="fee">Fee ($)</label>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button type="reset" class="btn btn-light px-4"><i class="bi bi-arrow-counterclockwise me-1"></i> Reset</button>
                    <button type="submit" name="submit" class="btn btn-primary px-4 shadow-sm"><i class="bi bi-check2-circle me-1"></i> Submit</button>
                </div>

            </form>
        </div>

    </div>

    <!-- ================= TABLE ================= -->

    <div class="col-lg-8">

        <div class="table-wrapper">
            <table class="table table-hover align-middle mb-0">

                <thead class="table-dark">
                    <tr>
                        <th class="ps-4">ID</th>
                        <th>Student Name</th>
                        <th>Course</th>
                        <th>Fee</th>
                        <th class="text-center">Actions</th>
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

    <td class="ps-4 fw-bold text-secondary"><%= rs.getInt("id") %></td>

    <td><%= rs.getString("stname") %></td>

    <td><span class="badge bg-info text-dark rounded-pill px-3 py-2"><%= rs.getString("course") %></span></td>

    <td class="text-success fw-bold">$<%= rs.getString("fee") %></td>

    <td class="text-center">

        <a
        href="update.jsp?id=<%=rs.getInt("id")%>"
        class="btn btn-sm btn-outline-success me-2"
        title="Edit">
            <i class="bi bi-pencil-square"></i> Edit
        </a>

        <a
        href="delete.jsp?id=<%=rs.getInt("id")%>"
        class="btn btn-sm btn-outline-danger"
        onclick="return confirm('Are you sure you want to delete this record?')"
        title="Delete">
            <i class="bi bi-trash"></i> Delete
        </a>

    </td>

</tr>

<%
    }

}
catch(Exception e){

    out.println("<tr>");
    out.println("<td colspan='5' class='text-danger text-center p-4'>");
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

</div>

</body>
</html>