package clinicmanager.controller.admin;

import clinicmanager.model.Appointment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("todayAppointmentsCount", appointmentService.getTodayAppointmentsCount(doctorId));
//        request.setAttribute("completedCount", appointmentService.getTodayCompletedCount(doctorId));
//        request.setAttribute("pendingCount", appointmentService.getTodayPendingCount(doctorId));
//        request.setAttribute("totalPatientsCount", patientService.getTotalPatientsCountByDoctor(doctorId));
//
//        List<Appointment> todayAppointments = appointmentService.getTodayAppointmentsForDoctor(doctorId);
//        request.setAttribute("todayAppointments", todayAppointments);
        request.getRequestDispatcher(
                "/WEB-INF/views/admin/dashboard.jsp"
        ).forward(request, response);
    }

}
