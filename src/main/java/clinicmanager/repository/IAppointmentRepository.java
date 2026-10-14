package clinicmanager.repository;


import clinicmanager.model.Appointment;
import clinicmanager.model.Doctor;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

public interface IAppointmentRepository {
  List<Appointment> findByPatient(UUID patientId);
  List<Appointment> findByDoctorId(UUID doctorId);
  boolean existsOverlappingAppointment(Doctor doctor, LocalDate date, LocalTime slotStart, LocalTime slotEnd);
  void save(Appointment appointment);
}
