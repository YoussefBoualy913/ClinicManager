package clinicmanager.repository;


import clinicmanager.model.Patient;

import java.util.Optional;

public interface IPatientRepository {
    boolean existsByEmail(String email);
    Optional<Patient> findByEmail(String email);
    boolean existsByCin(String cin);

    Patient save(Patient patient);
    void update(Patient patient);
//    void delete(Patient patient);
}
