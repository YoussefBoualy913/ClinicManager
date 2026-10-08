package clinicmanager.controller.patient;

import clinicmanager.model.Appointment;
import clinicmanager.model.Patient;
import clinicmanager.service.AppointmentService;
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

        Patient patient =
                (Patient) request.getSession().getAttribute("patient");

        if (patient == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login"
            );
            return;
        }

        List<Appointment> appointments =
                appointmentService.findByPatient(patient.getId());
        request.setAttribute("appointments", appointments);

        request.getRequestDispatcher(
                "/WEB-INF/views/patient/appointments.jsp"
        ).forward(request, response);
    }

}
