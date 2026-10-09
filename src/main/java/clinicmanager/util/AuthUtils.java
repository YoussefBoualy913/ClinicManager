package clinicmanager.util;

import clinicmanager.model.Doctor;
import clinicmanager.model.Patient;
import clinicmanager.model.User;
import clinicmanager.model.Role;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
public class AuthUtils {

    public static User requireRole(
            HttpServletRequest request,
            HttpServletResponse response,
            Role expectedRole
    ) throws IOException {

        HttpSession session = request.getSession(false);

        User user = session != null
                ? (User) session.getAttribute("user")
                : null;

        if (user == null || user.getRole() != expectedRole) {
            response.sendRedirect(request.getContextPath() + "/login");
            return null;
        }

        if (expectedRole == Role.PATIENT && !(user instanceof Patient)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return null;
        }

        if (expectedRole == Role.DOCTOR && !(user instanceof Doctor)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return null;
        }

        return user;
    }
}
