package clinicmanager.repository;


import clinicmanager.model.Doctor;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface IDoctorRepository {
    Optional<Doctor> findByDoctorId(UUID doctorId);
    List<Doctor> findBySpecialtyId(UUID specialtyId);
    Doctor save(Doctor doctor);
}
