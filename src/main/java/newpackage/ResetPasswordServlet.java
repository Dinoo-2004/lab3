package newpackage;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.sql.*;

import org.mindrot.jbcrypt.BCrypt;


@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/ResetPasswordServlet"})
public class ResetPasswordServlet extends HttpServlet {


@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {


    String username = request.getParameter("username");

    String password = request.getParameter("password");


    try {


        Class.forName("com.mysql.cj.jdbc.Driver");


        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/schooll",
                "root",
                ""
        );


        // Băm mật khẩu mới
        String hashPassword = BCrypt.hashpw(
                password,
                BCrypt.gensalt()
        );


        String sql =
                "UPDATE users SET password=? WHERE name=?";


        PreparedStatement ps =
                con.prepareStatement(sql);


        ps.setString(1, hashPassword);
        ps.setString(2, username);


        int result = ps.executeUpdate();



        if(result > 0){

            response.sendRedirect("login.jsp");

        }else{

            request.setAttribute(
                    "error",
                    "Reset password failed"
            );

            request.getRequestDispatcher(
                    "resetPassword.jsp"
            ).forward(request,response);

        }


        con.close();


    } catch(Exception e){

        e.printStackTrace();

    }

}


}