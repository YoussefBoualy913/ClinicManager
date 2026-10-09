package clinicmanager.repository.imp;

import clinicmanager.config.JPAConfig;
import clinicmanager.model.Availability;
import clinicmanager.repository.IAvailabilityRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.UUID;
@ApplicationScoped
public class AvailabilityRepository implements IAvailabilityRepository {

    @Override
    public Availability findByAvailability(UUID availabilityId) {
        EntityManager em = JPAConfig.createEntityManager();
        return em.find(Availability.class, availabilityId);
    }

    @Override
    public List<Availability> findAvailabilityByDoctorId(UUID doctorId) {
        EntityManager em = JPAConfig.createEntityManager();

        try {
            return em.createQuery(
                            "SELECT a FROM Availability a WHERE a.doctor.id = :doctorId",
                            Availability.class
                    )
                    .setParameter("doctorId", doctorId)
                    .getResultList();

        } finally {
            em.close();
        }
}

    @Override
    public void save(Availability availability) {

        EntityManager em = JPAConfig.createEntityManager();

        try {
            em.getTransaction().begin();

            em.persist(availability);

            em.getTransaction().commit();

        } catch (RuntimeException e) {

            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }

            throw e;

        } finally {
            em.close();
        }
    }

    @Override
    public void delete(UUID id) {
        EntityManager em = JPAConfig.createEntityManager();

        try {
            em.getTransaction().begin();

            Availability availability = em.find(Availability.class, id);

            if (availability != null) {
                em.remove(availability);
            }

            em.getTransaction().commit();

        } catch (RuntimeException e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;

        } finally {
            em.close();
        }
    }
}
