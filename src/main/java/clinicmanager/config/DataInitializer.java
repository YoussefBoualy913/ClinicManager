package clinicmanager.config;
import clinicmanager.service.UserService;
import jakarta.annotation.PostConstruct;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.context.Initialized;
import jakarta.enterprise.event.Observes;
import jakarta.inject.Inject;

@ApplicationScoped
public class DataInitializer {

    @Inject
    private UserService userService;


    public void init( @Observes @Initialized(ApplicationScoped.class) Object event) {

        userService.createDefaultAdmin();
    }
}