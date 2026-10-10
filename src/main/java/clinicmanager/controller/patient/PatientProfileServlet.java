package clinicmanager.controller.patient;

import clinicmanager.exception.DateTimeParseException;
import clinicmanager.model.Patient;
import clinicmanager.model.Role;
import clinicmanager.model.User;
import clinicmanager.repository.IPatientRepository;
import clinicmanager.service.PatientService;
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
import java.time.format.DateTimeFormatter;
import java.util.Optional;

@WebServlet("/patient/profile")
public class PatientProfileServlet extends HttpServlet {
    @Inject
    private IPatientRepository patientRepository;
    @Inject
    private PatientService patientService;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = AuthUtils.requireRole(
                request, response, Role.PATIENT
        );

        if (user == null) {
            return;
        }

        Patient patient = (Patient) user;
        request.setAttribute("patient", patient);

        request.setAttribute(
                "createdAtFormatted",
                patient.getCreatedAt().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))
        );
        request.getRequestDispatcher(
                "/WEB-INF/views/patient/profile.jsp"
        ).forward(request, response);
    }


        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {


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

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String birthDateParam = request.getParameter("birthDate");
            String address = request.getParameter("address");
            String cin = request.getParameter("cin");

            try {

                LocalDate birthDate = null;

                if (birthDateParam != null && !birthDateParam.isBlank()) {
                    birthDate = LocalDate.parse(birthDateParam);
                }

                patient.setFirstName(firstName);
                patient.setLastName(lastName);
                patient.setEmail(email);
                patient.setPhone(phone);
                patient.setBirthDate(birthDate);
                patient.setAddress(address);
                patient.setCin(cin);

                patientService.update(patient);

                request.getSession().setAttribute("patient", patient);

                response.sendRedirect(
                        request.getContextPath() + "/patient/profile?success=true"
                );

            } catch (DateTimeParseException e) {

                request.setAttribute("error", "La date de naissance est invalide.");

                request.setAttribute("patient", patient);

                request.getRequestDispatcher(
                        "/WEB-INF/views/patient/profile.jsp"
                ).forward(request, response);

            } catch (Exception e) {

                e.printStackTrace();

                request.setAttribute(
                        "error",
                        "Une erreur est survenue lors de la mise à jour du profil."
                );

                request.setAttribute("patient", patient);

                request.getRequestDispatcher(
                        "/WEB-INF/views/patient/profile.jsp"
                ).forward(request, response);
            }
        }
    }
