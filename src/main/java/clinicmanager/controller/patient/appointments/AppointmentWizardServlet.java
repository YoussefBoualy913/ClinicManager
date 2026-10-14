
package clinicmanager.controller.patient.appointments;

import clinicmanager.dto.TimeSlotDTO;
import clinicmanager.model.*;
import clinicmanager.repository.imp.AppointmentRepository;
import clinicmanager.service.AppointmentService;
import clinicmanager.service.DoctorService;
import clinicmanager.service.SpecialtyService;
import clinicmanager.service.TimeSlotService;
import clinicmanager.util.AuthUtils;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

@WebServlet(urlPatterns = {
        "/patient/appointments/new",
        "/patient/appointments/specialty",
        "/patient/appointments/doctor",
        "/patient/appointments/date",
        "/patient/appointments/slot",
        "/patient/appointments/confirm"
})
public class AppointmentWizardServlet extends HttpServlet {

    @Inject
    private SpecialtyService specialtyService;

    @Inject
    private DoctorService doctorService;

    @Inject
    private AppointmentService appointmentService;
    @Inject
    private TimeSlotService timeSlotService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        User user = AuthUtils.requireRole(
                request, response, Role.PATIENT
        );

        if (user == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login"
            );
            return;
        }

        if ("/patient/appointments/new".equals(path)) {

            List<Specialty> specialties = specialtyService.findAll();
            request.setAttribute("specialties", specialties);
            request.getRequestDispatcher("/WEB-INF/views/patient/appointments/appointment-specialties.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/patient/appointments/new");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
       HttpSession session = request.getSession();
        User user = AuthUtils.requireRole(
                request, response, Role.PATIENT
        );

        if (user == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login"
            );
            return;
        }

        try {
            switch (path) {
                case "/patient/appointments/specialty": {

                    UUID specialtyId = UUID.fromString(request.getParameter("specialtyId"));
                    Specialty specialty = specialtyService.findById(specialtyId)
                                    .orElseThrow(() -> new IllegalArgumentException("specialtyId not found"));

                    session.setAttribute("selectedSpecialty", specialty);

                    List<Doctor> doctors = doctorService.findBySpecialtyId(specialtyId);


                    request.setAttribute("doctors", doctors);
                    request.setAttribute("selectedSpecialty", specialty);

                    request.getRequestDispatcher("/WEB-INF/views/patient/appointments/appointment-doctors.jsp").forward(request, response);
                    break;
                }

                case "/patient/appointments/doctor": {

                    UUID doctorId = UUID.fromString(request.getParameter("doctorId"));
                    Doctor doctor = doctorService.findByDoctorId(doctorId).orElseThrow(() -> new IllegalArgumentException("doctorId not found"));

                    session.setAttribute("selectedDoctor", doctor);


                    List<LocalDate> availableDates = doctorService.getAvailableDatesForDoctor(doctor);

                    request.setAttribute("availableDates", availableDates);
                    request.setAttribute("selectedDoctor", doctor);
                    request.setAttribute("selectedSpecialty", session.getAttribute("selectedSpecialty"));

                    request.getRequestDispatcher("/WEB-INF/views/patient/appointments/appointment-dates.jsp").forward(request, response);
                    break;
                }
//
                case "/patient/appointments/date": {
                    LocalDate selectedDate = LocalDate.parse(request.getParameter("selectedDate"));
                    session.setAttribute("selectedDate", selectedDate);

                    Doctor doctor = (Doctor) session.getAttribute("selectedDoctor");
                    List<TimeSlotDTO> availableSlots = timeSlotService.getAvailableSlotsForDoctor(doctor, selectedDate);

                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d MMMM yyyy", Locale.FRENCH);
                    String formattedDate = selectedDate.format(formatter);



                    request.setAttribute("availableSlots", availableSlots);
                    request.setAttribute("formattedDate", formattedDate);
                    request.setAttribute("selectedDoctor", doctor);

                    request.getRequestDispatcher("/WEB-INF/views/patient/appointments/appointment-slots.jsp").forward(request, response);
                    break;
                }

                case "/patient/appointments/slot": {
                    LocalTime selectedTime = LocalTime.parse(request.getParameter("selectedTime"));
                    session.setAttribute("selectedTime", selectedTime);

                    request.setAttribute("selectedSpecialty", session.getAttribute("selectedSpecialty"));
                    request.setAttribute("selectedDoctor", session.getAttribute("selectedDoctor"));
                    request.setAttribute("selectedDate",session.getAttribute("selectedDate") );
                    request.setAttribute("selectedTime", selectedTime);

                    request.getRequestDispatcher("/WEB-INF/views/patient/appointments/appointment-confirmation.jsp").forward(request, response);
                    break;
                }

                case "/patient/appointments/confirm": {

                    Patient patient = (Patient) user;
                    Doctor doctor = (Doctor) session.getAttribute("selectedDoctor");
                    LocalDate date = (LocalDate) session.getAttribute("selectedDate");
                    LocalTime time = (LocalTime) session.getAttribute("selectedTime");
                    String reason = request.getParameter("reason");

                    appointmentService.createAppointment(patient, doctor, date, time, AppointmentType.CONSULTATION, reason);


                    session.removeAttribute("selectedSpecialty");
                    session.removeAttribute("selectedDoctor");
                    session.removeAttribute("selectedDate");
                    session.removeAttribute("selectedTime");


                    request.getRequestDispatcher("/WEB-INF/views/patient/appointments/appointment-success.jsp").forward(request, response);
                    break;
                }

                default:
                    response.sendRedirect(request.getContextPath() + "/patient/appointments/new");
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Erreur lors de la réservation : " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/common/messages.jsp").forward(request, response);
        }
    }
}