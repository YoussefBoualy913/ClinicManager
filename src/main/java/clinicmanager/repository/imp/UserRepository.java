package clinicmanager.repository.imp;

import clinicmanager.config.JPAConfig;
import clinicmanager.model.User;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;

import java.util.Optional;
@ApplicationScoped
public class UserRepository {

    public Optional<User> findByEmail(String email) {

        EntityManager em = JPAConfig.createEntityManager();

        try {
            return em.createQuery(
                            "SELECT u FROM User u WHERE u.email = :email",
                            User.class
                    )
                    .setParameter("email", email)
                    .getResultStream()
                    .findFirst();

        } finally {
            em.close();
        }
    }
}
