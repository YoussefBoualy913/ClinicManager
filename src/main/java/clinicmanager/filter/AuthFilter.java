package clinicmanager.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import clinicmanager.model.*;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain
    ) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();


        if (uri.equals(contextPath + "/")
                || uri.equals(contextPath + "/login")
                || uri.equals(contextPath + "/register")
                || uri.startsWith(contextPath + "/css/")
                || uri.startsWith(contextPath + "/js/")) {

            chain.doFilter(request, response);
            return;
        }

        User user = (User) req.getSession().getAttribute("user");

        if (user == null) {
            resp.sendRedirect(contextPath + "/login");
            return;
        }

        chain.doFilter(request, response);
    }
}
