package clinicmanager.controller.auth;

import clinicmanager.dto.LoginDTO;
import clinicmanager.exception.InvalidCredentialsException;
import clinicmanager.model.User;
import clinicmanager.service.AuthService;
import jakarta.inject.Inject;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private AuthService authService;

    @Inject
    public void setAuthService(AuthService authService) {
        this.authService = authService;
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User loggedUser = (User) session.getAttribute("user");


            if (loggedUser.getRole() != null) {
                switch (loggedUser.getRole()) {
                    case PATIENT:
                        response.sendRedirect(request.getContextPath() + "/patient/profile");
                        return;
                    case DOCTOR:
                        response.sendRedirect(request.getContextPath() + "/doctor/dashboard");
                        return;
                    case ADMIN:
                        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                        return;
                    default:
                        response.sendRedirect(request.getContextPath() + "/dashboard");
                        return;
                }
            }
        }

        request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginDTO dto = new LoginDTO(email, password);

        try {

            User user = authService.login(dto);

            HttpSession session = request.getSession();

            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("role", user.getRole());

            switch (user.getRole()) {

                case PATIENT ->
                        response.sendRedirect(
                                request.getContextPath()
                                        + "/patient/profile"
                        );

                case DOCTOR ->
                        response.sendRedirect(
                                request.getContextPath()
                                        + "/doctor/dashboard"
                        );

                case ADMIN ->
                        response.sendRedirect(
                                request.getContextPath()
                                        + "/admin/dashboard"
                        );
            }

        } catch (InvalidCredentialsException e) {

            request.setAttribute(
                    "error",
                    "Email ou mot de passe incorrect"
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/auth/login.jsp"
            ).forward(request, response);
        }
    }
}
