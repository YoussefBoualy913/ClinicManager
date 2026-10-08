package clinicmanager.service;


import clinicmanager.exception.BusinessException;
import clinicmanager.model.Patient;
import clinicmanager.repository.IPatientRepository;
import clinicmanager.util.PasswordUtil;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.util.UUID;

@ApplicationScoped
public class PatientService {

    @Inject
    private IPatientRepository patientRepository;

    public void update(Patient patient) {

        patientRepository.update(patient);
    }

    public void changePassword(
            Patient patient,
            String currentPassword,
            String newPassword,
            String confirmPassword
    ) throws BusinessException {


        if (newPassword == null || newPassword.length() < 6) {
            throw new BusinessException(
                    "Le nouveau mot de passe doit contenir au moins 6 caractères."
            );
        }


        if (!newPassword.equals(confirmPassword)) {
            throw new BusinessException(
                    "Les nouveaux mots de passe ne correspondent pas."
            );
        }

        if (!PasswordUtil.checkPassword(
                currentPassword,
                patient.getPassword()
        )) {
            throw new BusinessException(
                    "Le mot de passe actuel est incorrect."
            );
        }


        String newHashedPassword =
                PasswordUtil.hashPassword(newPassword);

        patient.setPassword(newHashedPassword);

        patientRepository.update(patient);
    }
}
