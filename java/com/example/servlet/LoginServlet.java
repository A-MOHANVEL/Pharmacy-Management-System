package com.example.servlet;

import com.example.dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phnumber = request.getParameter("phnumber");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        try {
            if (userDAO.validateUser(phnumber, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("phnumber", phnumber);  // Store phnumber in session
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("Login.jsp?error=Invalid credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
