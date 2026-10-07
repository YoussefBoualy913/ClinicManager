package clinicmanager.repository.imp;

import clinicmanager.config.JPAConfig;
import clinicmanager.model.User;
import clinicmanager.repository.IUserRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;

import java.util.Optional;
@ApplicationScoped
public class UserRepository implements IUserRepository {

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
    @Override
    public User save(User user) {

        EntityManager em = JPAConfig.createEntityManager();

        try {
            em.getTransaction().begin();

            em.persist(user);

            em.getTransaction().commit();

            return user;

        } catch (Exception e) {

            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }

            throw e;

        } finally {
            em.close();
        }
    }
}
