package com.example.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/nextPage")
public class NextPageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourDatabase", "username", "password")) {
            PreparedStatement stmt = conn.prepareStatement("SELECT TabletName, Cost, ManufactureDate, ExpiryDate FROM tablets WHERE id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("tabletName", rs.getString("TabletName"));
                request.setAttribute("cost", rs.getDouble("Cost"));
                request.setAttribute("manufactureDate", rs.getDate("ManufactureDate").toString());
                request.setAttribute("expiryDate", rs.getDate("ExpiryDate").toString());
                request.setAttribute("quantity", quantity);
                request.setAttribute("totalCost", rs.getDouble("Cost") * quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/page2.jsp").forward(request, response);
    }
}
