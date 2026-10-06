package clinicmanager.repository;


import clinicmanager.model.Patient;

public interface IPatientRepository {
    boolean existsByEmail(String email);

    boolean existsByCin(String cin);

    Patient save(Patient patient);
}
