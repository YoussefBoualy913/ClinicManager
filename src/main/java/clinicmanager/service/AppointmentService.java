package clinicmanager.service;


import clinicmanager.exception.BusinessException;
import clinicmanager.model.*;
import clinicmanager.repository.IAppointmentRepository;
import clinicmanager.repository.imp.AbsenceRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;
@ApplicationScoped
public class AppointmentService {
    @Inject
    private IAppointmentRepository appointmentRepository;
    @Inject
    private AbsenceRepository absenceRepository;

    public List<Appointment> findByPatient(UUID patientId) {
        return appointmentRepository.findByPatient(patientId);
    }
    public List<Appointment> findByDoctorId(UUID doctorId) {
        return appointmentRepository.findByDoctorId(doctorId);
    }

    public void createAppointment(
            Patient patient,
            Doctor doctor,
            LocalDate date,
            LocalTime time,
            AppointmentType type,
            String reason) throws BusinessException {


        if (patient == null || doctor == null || date == null
                || time == null || type == null) {
            throw new BusinessException(
                    "Tous les champs obligatoires doivent être renseignés.");
        }

        if (date.isBefore(LocalDate.now())) {
            throw new BusinessException(
                    "Impossible de créer un rendez-vous dans le passé.");
        }

        LocalTime endTime = time.plusMinutes(30);


        boolean hasAppointment =
                appointmentRepository.existsOverlappingAppointment(
                        doctor, date, time, endTime);

        if (hasAppointment) {
            throw new BusinessException(
                    "Ce créneau est déjà réservé.");
        }

        boolean hasAbsence =
                absenceRepository.existsAbsenceOnDate(doctor, date);

        if (hasAbsence) {
            throw new BusinessException(
                    "Le médecin est absent à cette date.");
        }


        Appointment appointment = new Appointment();

        appointment.setPatient(patient);
        appointment.setDoctor(doctor);
        appointment.setDate(date);
        appointment.setStartTime(time);
        appointment.setEndTime(endTime);
        appointment.setType(type);
        appointment.setReason(reason);
        appointment.setStatus(AppointmentStatus.PLANNED);

        appointmentRepository.save(appointment);
    }

}
