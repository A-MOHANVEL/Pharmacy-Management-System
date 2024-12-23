//package com.example.servlet;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.example.dao.AppointmentDao;
//import com.example.model.Appointment;
//
//@WebServlet("/SubmitAppointmentServlet")
//public class SubmitAppointmentServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession(false);
//        String phnumber = (String) session.getAttribute("phnumber");
//        if (phnumber == null) {
//            response.sendRedirect("login.jsp");
//            return;
//        }
//
//        String name = request.getParameter("name");
//        int age = Integer.parseInt(request.getParameter("age"));
//        String address = request.getParameter("address");
//        String specialist = request.getParameter("specialist");
//        String reason = request.getParameter("reason");
//
//        Appointment appointment = new Appointment(phnumber, name, age, address, specialist, reason);
//
//        AppointmentDao appointmentDao = new AppointmentDao();
//        boolean isSaved = appointmentDao.bookAppointment(appointment);
//
//        if (isSaved) {
//            response.sendRedirect("success.jsp");
//        } else {
//            request.setAttribute("error", "Unable to submit appointment. Please try again.");
//            request.getRequestDispatcher("appointment_form.jsp").forward(request, response);
//        }
//    }
//}
package com.example.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.AppointmentDao;
import com.example.model.Appointment;

@WebServlet("/SubmitAppointmentServlet")
public class SubmitAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String phnumber = request.getParameter("phnumber");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        String specialist = request.getParameter("specialist");
        String reason = request.getParameter("reason");

        // Create an Appointment object
        Appointment appointment = new Appointment(phnumber, name, age, address, specialist, reason);

        // Save appointment in the database
        AppointmentDao appointmentDao = new AppointmentDao();
        boolean isSaved = appointmentDao.saveAppointment(appointment);

        if (isSaved) {
            response.sendRedirect("index.jsp"); // Redirect to success page
        } else {
            response.sendRedirect("error.jsp"); // Redirect to error page
        }
    }
}
