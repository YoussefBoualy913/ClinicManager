package clinicmanager.repository.imp;

import clinicmanager.config.JPAConfig;
import clinicmanager.model.Patient;
import clinicmanager.repository.IPatientRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.PersistenceContext;

import java.util.Optional;

@ApplicationScoped
public class PatientRepository implements IPatientRepository {

    @Override
    public boolean existsByEmail(String email) {
        EntityManager em = JPAConfig.createEntityManager();
        Long count = em.createQuery(
                        "SELECT COUNT(p) FROM Patient p WHERE p.email = :email",
                        Long.class
                )
                .setParameter("email", email)
                .getSingleResult();

        return count > 0;
    }

    @Override

        public Optional<Patient> findByEmail(String email) {
        EntityManager em = JPAConfig.createEntityManager();
            return em.createQuery(
                            "SELECT p FROM Patient p WHERE p.email = :email",
                            Patient.class
                    )
                    .setParameter("email", email)
                    .getResultStream()
                    .findFirst();
        }

    @Override
    public boolean existsByCin(String cin) {
        EntityManager em = JPAConfig.createEntityManager();
        Long count = em.createQuery(
                        "SELECT COUNT(p) FROM Patient p WHERE p.cin = :cin",
                        Long.class
                )
                .setParameter("cin", cin)
                .getSingleResult();

        return count > 0;
    }

    @Override
    public Patient save(Patient patient) {
            EntityManager em = JPAConfig.createEntityManager();
            EntityTransaction transaction = em.getTransaction();

            try {
                transaction.begin();

                em.persist(patient);

                transaction.commit();

                return patient;

            } catch (Exception e) {

                if (transaction.isActive()) {
                    transaction.rollback();
                }

                throw e;
            }
        }

    @Override
    public void update(Patient patient) {
        EntityManager em = JPAConfig.createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();

            em.merge(patient);

            transaction.commit();

        } catch (Exception e) {

            if (transaction.isActive()) {
                transaction.rollback();
            }

            throw e;
        }
    }
}