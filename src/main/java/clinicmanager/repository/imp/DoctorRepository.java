package clinicmanager.repository.imp;

import clinicmanager.config.JPAConfig;
import clinicmanager.model.Doctor;
import clinicmanager.repository.IDoctorRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
@ApplicationScoped
public class DoctorRepository implements IDoctorRepository {

    @Override
    public Doctor save(Doctor doctor) {

        EntityManager em = JPAConfig.createEntityManager();

        try {
            em.getTransaction().begin();

            em.persist(doctor);

            em.getTransaction().commit();

            return doctor;

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
