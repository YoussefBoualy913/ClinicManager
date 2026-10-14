package clinicmanager.repository.imp;

import clinicmanager.config.JPAConfig;
import clinicmanager.model.Appointment;
import clinicmanager.model.AppointmentStatus;
import clinicmanager.model.Doctor;
import clinicmanager.repository.IAppointmentRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;
import java.time.LocalTime;
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
    @Override
    public List<Appointment> findByDoctorId(UUID doctorId) {
        EntityManager em = JPAConfig.createEntityManager();
        return em.createQuery(
                        "SELECT a FROM Appointment a " +
                                "WHERE a.doctor.id = :doctorId " +
                                "ORDER BY a.date DESC, a.startTime DESC",
                        Appointment.class
                )
                .setParameter("doctorId", doctorId)
                .getResultList();
    }
    @Override
    public boolean existsOverlappingAppointment(
            Doctor doctor,
            LocalDate date,
            LocalTime slotStart,
            LocalTime slotEnd) {

        EntityManager em = JPAConfig.createEntityManager();
        try {
            Long count = em.createQuery("""
                SELECT COUNT(a)
                FROM Appointment a
                WHERE a.doctor = :doctor
                  AND a.date = :date
                  AND a.status <> :cancelled
                  AND a.startTime < :slotEnd
                  AND a.endTime > :slotStart
                """, Long.class)
                    .setParameter("doctor", doctor)
                    .setParameter("date", date)
                    .setParameter("slotStart", slotStart)
                    .setParameter("slotEnd", slotEnd)
                    .setParameter("cancelled", AppointmentStatus.CANCELED)
                    .getSingleResult();

            return count > 0;

        } finally {
            em.close();
        }
    }
  @Override
    public void save(Appointment appointment) {

        EntityManager em = JPAConfig
                .createEntityManager();

        try {
            em.getTransaction().begin();

            em.persist(appointment);

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

