package clinicmanager.controller.auth;

import clinicmanager.dto.DoctorDTO;
import clinicmanager.dto.PatientDTO;
import clinicmanager.dto.RegistrationDTO;
import clinicmanager.exception.DuplicateEmailException;
import clinicmanager.model.BloodGroup;
import clinicmanager.model.DoctorTitle;
import clinicmanager.model.Gender;
import clinicmanager.model.Specialty;
import clinicmanager.service.AuthService;
import clinicmanager.service.SpecialtyService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private AuthService authService;
    private SpecialtyService specialtyService;
    @Inject
    public void setAuthService(AuthService authService) {
        this.authService = authService;
    }
    @Inject
    public void setSpecialtyService(SpecialtyService specialtyService) {
        this.specialtyService = specialtyService;
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        String role = request.getParameter("role");

        if ("patient".equalsIgnoreCase(role)) {
            request.getRequestDispatcher(
                    "/WEB-INF/views/auth/register-patient.jsp"
            ).forward(request, response);

        } else if ("doctor".equalsIgnoreCase(role)) {

            List<Specialty> specialties =
                    specialtyService.findAll();

            if(!specialties.isEmpty()){
                request.setAttribute("specialties", specialties);
            }

            request.getRequestDispatcher(
                    "/WEB-INF/views/auth/register-doctor.jsp"
            ).forward(request, response);
        } else {
            request.getRequestDispatcher(
                    "/WEB-INF/views/auth/register-choice.jsp"
            ).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String role = request.getParameter("role");

        try {
            if ("patient".equalsIgnoreCase(role) || "PATIENT".equalsIgnoreCase(role)) {


                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");

                String cin = request.getParameter("cin");
                LocalDate birthDate = LocalDate.parse(request.getParameter("birthDate"));
                Gender gender = Gender.valueOf(request.getParameter("gender"));
                String address = request.getParameter("address");

                String bloodGroupStr = request.getParameter("bloodGroup");
                BloodGroup bloodGroup = (bloodGroupStr != null && !bloodGroupStr.isBlank())
                        ? BloodGroup.valueOf(bloodGroupStr) : null;

                PatientDTO patientDTO = new PatientDTO(firstName, lastName, email, phone, password,
                        cin, birthDate, gender, address, bloodGroup);

                authService.registerPatient(patientDTO);

            } else if ("doctor".equalsIgnoreCase(role) || "DOCTOR".equalsIgnoreCase(role)) {


                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");


                DoctorTitle title = DoctorTitle.valueOf(request.getParameter("title"));
                String matricule = request.getParameter("matricule");
                String officeNumber = request.getParameter("officeNumber");

                UUID specialtyId = UUID.fromString(request.getParameter("specialtyId"));


                DoctorDTO dto = new DoctorDTO(firstName, lastName, email, phone, password,
                        title, matricule, specialtyId);
                authService.registerDoctor(dto);

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Rôle non valide");
                return;
            }


            response.sendRedirect(request.getContextPath() + "/login?registered=true");

        } catch (IllegalArgumentException e) {
            // Gestion des erreurs de parsing/conversion ou validation
            request.setAttribute("errorMessage", "Données invalides ou manquantes : " + e.getMessage());

            // Re-diriger vers le formulaire approprié avec l'erreur
            String targetJsp = "doctor".equalsIgnoreCase(role) ?
                    "/WEB-INF/views/auth/register-doctor.jsp" : "/WEB-INF/views/auth/register-patient.jsp";

            request.getRequestDispatcher(targetJsp).forward(request, response);

        } catch (Exception e) {
            // Gestion des exceptions métier (ex: email déjà existant, CIN déjà utilisé)
            request.setAttribute("errorMessage", "Erreur d'inscription : " + e.getMessage());

            String targetJsp = "doctor".equalsIgnoreCase(role) ?
                    "/WEB-INF/views/auth/register-doctor.jsp" : "/WEB-INF/views/auth/register-patient.jsp";

            request.getRequestDispatcher(targetJsp).forward(request, response);
        }
    }
}

