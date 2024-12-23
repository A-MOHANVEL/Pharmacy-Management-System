<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Appointments</title>
</head>
<body>
    <h2>Pending Appointments</h2>
    <table>
        <thead>
            <tr>
                <th>Patient Name</th>
                <th>Age</th>
                <th>Specialist</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%-- Display appointments here --%>
            <c:forEach var="appointment" items="${pendingAppointments}">
                <tr>
                    <td>${appointment.name}</td>
                    <td>${appointment.age}</td>
                    <td>${appointment.specialist}</td>
                    <td>${appointment.status}</td>
                    <td>
                        <button onclick="window.location.href='updateAppointmentStatus.jsp?id=${appointment.id}&status=accept'">Accept</button>
                        <button onclick="window.location.href='updateAppointmentStatus.jsp?id=${appointment.id}&status=reject'">Reject</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
