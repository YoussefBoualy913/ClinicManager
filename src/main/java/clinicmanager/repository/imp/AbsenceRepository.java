package clinicmanager.repository.imp;

import clinicmanager.config.JPAConfig;
import clinicmanager.model.Absence;
import clinicmanager.model.Availability;
import clinicmanager.model.Doctor;
import clinicmanager.repository.IAbsenceRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class AbsenceRepository implements IAbsenceRepository {
   @Override
    public List<Absence> findAbsenceByDoctorId(UUID doctorId) {
        EntityManager em = JPAConfig.createEntityManager();

        try {
            return em.createQuery(
                            "SELECT a FROM Absence a WHERE a.doctor.id = :doctorId",
                            Absence.class
                    )
                    .setParameter("doctorId", doctorId)
                    .getResultList();

        } finally {
            em.close();
        }
    }
    @Override
    public void save(Absence absence) {
        EntityManager em = JPAConfig.createEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(absence);
            em.getTransaction().commit();
        }catch(Exception e) {
            if(em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
        }finally {
            em.close();
        }

    }
    @Override
    public boolean existsAbsenceOnDate(Doctor doctor, LocalDate date) {

        EntityManager em = JPAConfig
                .createEntityManager();

        try {
            Long count = em.createQuery("""
                SELECT COUNT(a)
                FROM Absence a
                WHERE a.doctor = :doctor
                  AND a.startDate <= :date
                  AND a.endDate >= :date
                """, Long.class)
                    .setParameter("doctor", doctor)
                    .setParameter("date", date)
                    .getSingleResult();

            return count > 0;

        } finally {
            em.close();
        }
    }
}
