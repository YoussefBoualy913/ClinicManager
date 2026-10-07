package clinicmanager.controller.auth;
import clinicmanager.service.UserService;
import jakarta.inject.Inject;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/test")
public class UserServlet extends HttpServlet {

    @Inject
   private UserService userService;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        response.getWriter().println(
               "coici une message de test!"
        );
    }
}
