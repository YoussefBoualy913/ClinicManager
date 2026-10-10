package clinicmanager.controller.doctor;

import clinicmanager.dto.AbsenceDTO;
import clinicmanager.exception.BusinessException;
import clinicmanager.model.*;
import clinicmanager.service.AbsenceService;
import clinicmanager.util.AuthUtils;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/doctor/absences")
public class DoctorAbsenceServlet extends HttpServlet {
   @Inject
   private AbsenceService absenceService;

    public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = AuthUtils.requireRole(
                request, response, Role.DOCTOR
        );

        if (user == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login"
            );
            return;
        }

        Doctor doctor = (Doctor) user;

        List<Absence> absences = absenceService.findByDoctorId(doctor.getId());
        request.setAttribute("absences", absences);
        request.getRequestDispatcher("/WEB-INF/views/doctor/absence.jsp").forward(request, response);
    }


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        try {
            User user = AuthUtils.requireRole(
                    request, response, Role.DOCTOR
            );

            if (user == null) {
                response.sendRedirect(
                        request.getContextPath() + "/login"
                );
                return;
            }

            Doctor doctor = (Doctor) user;

            AbsenceDTO dto = new AbsenceDTO();

            dto.setStartDate(request.getParameter("startDate"));
            dto.setEndDate(request.getParameter("endDate"));
            dto.setReason(request.getParameter("reason"));
            dto.setType(request.getParameter("type"));

            absenceService.createAbsence(doctor, dto);

            response.sendRedirect(
                    request.getContextPath() + "/doctor/absences"
            );

        } catch (BusinessException e) {
            request.setAttribute("error", e.getMessage());

            request.getRequestDispatcher(
                    "/WEB-INF/views/doctor/absences.jsp"
            ).forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                    "Erreur lors de la création de l'absence.", e
            );
        }
    }

}
