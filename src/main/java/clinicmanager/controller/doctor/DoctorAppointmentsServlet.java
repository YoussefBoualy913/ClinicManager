package clinicmanager.controller.doctor;

import clinicmanager.model.*;
import clinicmanager.service.AppointmentService;
import clinicmanager.util.AuthUtils;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/doctor/appointments")
public class DoctorAppointmentsServlet extends HttpServlet {
    @Inject
    private AppointmentService appointmentService;
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = AuthUtils.requireRole(
                req, resp, Role.DOCTOR
        );

        if (user == null) {
            resp.sendRedirect(
                    req.getContextPath() + "/login"
            );
            return;
        }

        Doctor doctor = (Doctor) user;

        List<Appointment> appointments = appointmentService.findByDoctorId(doctor.getId());
        req.setAttribute("appointments",appointments );
        req.getRequestDispatcher(
                "/WEB-INF/views/doctor/appointments.jsp"
        ).forward(req, resp);
    }


}
