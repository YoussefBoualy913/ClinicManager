package clinicmanager.service;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class UserService {

    public String getMessage() {
        return "CDI fonctionne avec Tomcat !";
    }
}
