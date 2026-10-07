package clinicmanager.service;
import clinicmanager.model.Role;
import clinicmanager.model.User;
import clinicmanager.repository.IUserRepository;
import clinicmanager.util.PasswordUtil;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;

@ApplicationScoped
public class UserService {


        @Inject
        private IUserRepository userRepository;

        public void createDefaultAdmin() {

            String email = "admin@gmail.com";
            String password = PasswordUtil.hashPassword("admin1");
            if (userRepository.findByEmail(email).isPresent()) {
                return;
            }

            User admin = new User(
                    "Admin","System",email,"+21268737332",password ,Role.ADMIN

            );

            userRepository.save(admin);
        }

}
