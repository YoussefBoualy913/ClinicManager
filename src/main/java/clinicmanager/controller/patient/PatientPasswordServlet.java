package clinicmanager.controller.patient;

import clinicmanager.exception.BusinessException;
import clinicmanager.model.Patient;
import clinicmanager.service.PatientService;
import clinicmanager.util.PasswordUtil;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/patient/profile/password")
public class PatientPasswordServlet extends HttpServlet {
    @Inject
    private PatientService patientService;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Patient patient = (Patient) request.getSession().getAttribute("patient");

        if (patient == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        try {

            patientService.changePassword(
                    patient,
                    currentPassword,
                    newPassword,
                    confirmPassword
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/patient/profile?passwordSuccess=true"
            );

        } catch (BusinessException e) {

            request.setAttribute("error", e.getMessage());
            request.setAttribute("patient", patient);

            request.getRequestDispatcher(
                    "/WEB-INF/views/patient/profile.jsp"
            ).forward(request, response);
        }
    }
}
