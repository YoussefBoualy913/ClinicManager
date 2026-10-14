package clinicmanager.repository.imp;

import clinicmanager.config.JPAConfig;
import clinicmanager.model.Doctor;
import clinicmanager.repository.IDoctorRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@ApplicationScoped
public class DoctorRepository implements IDoctorRepository {
    @Override
    public Optional<Doctor> findByDoctorId(UUID doctorId) {
        EntityManager em = JPAConfig.createEntityManager();
        try {
             Doctor doctor = em.find(Doctor.class, doctorId);
             return Optional.ofNullable(doctor);
        }finally {
            em.close();
        }
    }

    @Override
    public List<Doctor> findBySpecialtyId(UUID specialtyId) {
        EntityManager em = JPAConfig.createEntityManager();
        try {
            return em.createQuery(
                            "SELECT d FROM Doctor d WHERE d.specialty.id = :id", Doctor.class)
                    .setParameter("id", specialtyId)
                    .getResultList();
        } finally {
            em.close();
        }
    }
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
