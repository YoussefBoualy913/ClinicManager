package clinicmanager.service;


import clinicmanager.model.Patient;
import clinicmanager.repository.IPatientRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

@ApplicationScoped
public class PatientService {

    @Inject
    private IPatientRepository patientRepository;

    public void update(Patient patient) {
        patientRepository.update(patient);
    }
}
