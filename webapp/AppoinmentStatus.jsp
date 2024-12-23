<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Appointments</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Pending Appointments</h2>
    <table>
        <thead>
            <tr>
                <th>Phone Number</th>
                <th>Name</th>
                <th>Age</th>
                <th>Address</th>
                <th>Specialist</th>
                <th>Reason</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Check if appointments are available -->
            <c:if test="${not empty appointments}">
                <!-- Loop through the appointments list -->
                <c:forEach var="appointment" items="${appointments}">
                    <tr>
                        <td>${appointment.phnumber}</td>
                        <td>${appointment.name}</td>
                        <td>${appointment.age}</td>
                        <td>${appointment.address}</td>
                        <td>${appointment.specialist}</td>
                        <td>${appointment.reason}</td>
                        <td>
                            <!-- Action buttons to accept/reject -->
                            <form action="updateStatus" method="post">
                                <input type="hidden" name="phnumber" value="${appointment.phnumber}">
                                <button type="submit" name="status" value="Accept">Accept</button>
                                <button type="submit" name="status" value="Reject">Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty appointments}">
                <tr>
                    <td colspan="7">No pending appointments found.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>
