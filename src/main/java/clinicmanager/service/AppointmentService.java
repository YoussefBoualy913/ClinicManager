package clinicmanager.service;


import clinicmanager.model.Appointment;
import clinicmanager.repository.IAppointmentRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.util.List;
import java.util.UUID;
@ApplicationScoped
public class AppointmentService {
    @Inject
    private IAppointmentRepository appointmentRepository;

    public List<Appointment> findByPatient(UUID patientId) {
        return appointmentRepository.findByPatient(patientId);
    }
}
