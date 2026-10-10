package clinicmanager.controller.patient;

import clinicmanager.model.Appointment;
import clinicmanager.model.Patient;
import clinicmanager.model.Role;
import clinicmanager.model.User;
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


@WebServlet("/patient/appointments")
public class MyAppointmentsServlet extends HttpServlet {
    @Inject
    private AppointmentService appointmentService;
    @Override
    public  void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {

        User user = AuthUtils.requireRole(
                request, response, Role.PATIENT
        );

        if (user == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login"
            );
            return;
        }

        Patient patient = (Patient) user;

        List<Appointment> appointments =
                appointmentService.findByPatient(patient.getId());
        request.setAttribute("appointments", appointments);

        request.getRequestDispatcher(
                "/WEB-INF/views/patient/appointments.jsp"
        ).forward(request, response);
    }

}
