package com.example.servlet;

import com.example.dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phnumber = request.getParameter("phnumber");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        try {
            if (userDAO.registerUser(phnumber, password)) {
                response.sendRedirect("Login.jsp");
            } else {
                response.sendRedirect("Signup.jsp?error=Signup failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
