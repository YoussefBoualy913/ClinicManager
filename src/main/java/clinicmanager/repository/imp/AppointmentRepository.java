package clinicmanager.repository.imp;

import clinicmanager.config.JPAConfig;
import clinicmanager.model.Appointment;
import clinicmanager.repository.IAppointmentRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.UUID;
@ApplicationScoped
public class AppointmentRepository implements IAppointmentRepository {

    @Override
    public List<Appointment> findByPatient(UUID patientId) {
        EntityManager em = JPAConfig.createEntityManager();
        return em.createQuery(
                        "SELECT a FROM Appointment a " +
                                "WHERE a.patient.id = :patientId " +
                                "ORDER BY a.date DESC, a.startTime DESC",
                        Appointment.class
                )
                .setParameter("patientId", patientId)
                .getResultList();
    }
    }

