package newpackage;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("===== RegisterServlet chạy =====");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        User userModel = new User();
        userModel.setName(name);
        userModel.setEmail(email);
        userModel.setPassword(hashedPassword);

        UserDatabase regUser = new UserDatabase(ConnectionPro.getConnection());

        if (regUser.saveUser(userModel)) {
             HttpSession session = request.getSession();
             session.setAttribute("logUser", userModel);
             
             
                response.sendRedirect("login.jsp");
            
        } else {
            HttpSession regSession = request.getSession();
            regSession.setAttribute("RegError", "User Already Exists");
            response.sendRedirect("registration.jsp");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("===== doPost được gọi =====");

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Register Servlet";
    }
}
    

   