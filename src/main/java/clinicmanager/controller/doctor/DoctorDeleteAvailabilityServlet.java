package clinicmanager.controller.doctor;

import clinicmanager.repository.imp.AvailabilityRepository;
import clinicmanager.service.AvailabilityService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.UUID;
@WebServlet("/doctor/availabilities/delete")
public class DoctorDeleteAvailabilityServlet extends HttpServlet {
    @Inject
    private AvailabilityService availabilityService;
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UUID availabilityId = UUID.fromString(req.getParameter("id"));
      try {

          availabilityService.deleteAvailability(availabilityId);
          resp.sendRedirect(
                  req.getContextPath() + "/doctor/availabilities"
          );
      }catch(Exception e) {
          req.setAttribute("error", e.getMessage());
          req.getRequestDispatcher(
                  "/WEB-INF/views/doctor/availabilities.jsp"
          ).forward(req, resp);
      }

    }
}
