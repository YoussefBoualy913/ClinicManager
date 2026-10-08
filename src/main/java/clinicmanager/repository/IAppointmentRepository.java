package clinicmanager.repository;


import clinicmanager.model.Appointment;

import java.util.List;
import java.util.UUID;

public interface IAppointmentRepository {
  List<Appointment> findByPatient(UUID patientId);
}
