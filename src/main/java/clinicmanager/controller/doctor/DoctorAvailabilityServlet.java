package clinicmanager.controller.doctor;

import clinicmanager.dto.AvailabilityDTO;
import clinicmanager.exception.BusinessException;
import clinicmanager.model.*;
import clinicmanager.service.AvailabilityService;
import clinicmanager.util.AuthUtils;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/doctor/availabilities")
public class DoctorAvailabilityServlet extends HttpServlet {
    @Inject
   private AvailabilityService availabilityService;
   public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
       User user = AuthUtils.requireRole(
               request, response, Role.DOCTOR
       );

       if (user == null) {
           return;
       }

       Doctor doctor = (Doctor) user;

       List<Availability> availabilities = availabilityService.findByDoctorId(doctor.getId());
       request.setAttribute("availabilities", availabilities);
       request.getRequestDispatcher(
               "/WEB-INF/views/doctor/availabilities.jsp"
       ).forward(request, response);
   }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {
            User user = AuthUtils.requireRole(
                    request, response, Role.DOCTOR
            );

            if (user == null) {
                return;
            }

            Doctor doctor = (Doctor) user;

            AvailabilityDTO dto = new AvailabilityDTO();
            dto.setDayOfWeek(request.getParameter("dayOfWeek"));
            dto.setStartTime(request.getParameter("startTime"));
            dto.setEndTime(request.getParameter("endTime"));
            dto.setStatus(request.getParameter("status"));
            dto.setValidFrom(request.getParameter("validFrom"));
            dto.setValidUntil(request.getParameter("validUntil"));

            availabilityService.createAvailability(doctor, dto);

            response.sendRedirect(
                    request.getContextPath() + "/doctor/availabilities"
            );

        } catch (BusinessException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher(
                    "/WEB-INF/views/doctor/availabilities.jsp"
            ).forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                    "Erreur lors de la création de la disponibilité.", e);
        }
    }
}
