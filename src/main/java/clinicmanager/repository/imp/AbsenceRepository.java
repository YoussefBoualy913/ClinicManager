package clinicmanager.repository.imp;

import clinicmanager.config.JPAConfig;
import clinicmanager.model.Absence;
import clinicmanager.model.Availability;
import clinicmanager.repository.IAbsenceRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;

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
}
