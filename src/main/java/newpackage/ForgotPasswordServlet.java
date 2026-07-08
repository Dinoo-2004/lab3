package newpackage;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.sql.*;

import org.mindrot.jbcrypt.BCrypt;


@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
protected void doPost(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {


    String username =
            request.getParameter("username");

    String email =
            request.getParameter("email");


    try {

        Class.forName("com.mysql.cj.jdbc.Driver");


        Connection con =
        DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/schooll",
        "root",
        "");


        String sql =
        "SELECT * FROM user WHERE name=? AND email=?";


        PreparedStatement ps =
        con.prepareStatement(sql);


        ps.setString(1, username);
        ps.setString(2, email);


        ResultSet rs = ps.executeQuery();


        if(rs.next()){


            // đúng username + email

            request.setAttribute(
            "username",
            username);


            request.getRequestDispatcher(
            "resetPassword.jsp")
            .forward(request,response);



        }else{


            request.setAttribute(
            "error",
            "Username hoặc Email không đúng");


            request.getRequestDispatcher(
            "forgotPassword.jsp")
            .forward(request,response);

        }


    }catch(Exception e){

        e.printStackTrace();

    }

}

}