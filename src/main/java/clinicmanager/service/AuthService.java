package clinicmanager.service;

import clinicmanager.dto.DoctorDTO;
import clinicmanager.dto.LoginDTO;
import clinicmanager.dto.PatientDTO;
import clinicmanager.exception.DuplicateCinException;
import clinicmanager.exception.DuplicateEmailException;
import clinicmanager.exception.InvalidCredentialsException;
import clinicmanager.exception.SpecialtyNotFoundException;
import clinicmanager.mapper.DoctorMapper;
import clinicmanager.mapper.PatientMapper;
import clinicmanager.model.*;
import clinicmanager.repository.IPatientRepository;
import clinicmanager.repository.imp.DoctorRepository;
import clinicmanager.repository.imp.SpecialtyRepository;
import clinicmanager.repository.imp.UserRepository;
import clinicmanager.util.PasswordUtil;
import jakarta.enterprise.context.ApplicationScoped;

import jakarta.inject.Inject;
import jakarta.validation.Validator;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;

import java.util.Set;

@ApplicationScoped
public class AuthService {
    @Inject
    private  IPatientRepository patientRepository;
    @Inject
    private  Validator validator;
    @Inject
    private UserRepository userRepository;
    @Inject
    private DoctorRepository doctorRepository;
    @Inject
    private SpecialtyRepository specialtyRepository;





    public void registerPatient(PatientDTO patientDTO) throws DuplicateCinException, DuplicateEmailException {


                //  Validation du DTO
                Set<ConstraintViolation<PatientDTO>> violations =
                        validator.validate(patientDTO);

                if (!violations.isEmpty()) {
                    throw new ConstraintViolationException(violations);
                }

                // Vérification de l'email
                if (patientRepository.existsByEmail(patientDTO.getEmail())) {
                    throw new DuplicateEmailException(
                            "Cette adresse email est déjà utilisée."
                    );
                }

                // Vérification du CIN
                if (patientRepository.existsByCin(patientDTO.getCin())) {
                    throw new DuplicateCinException(
                            "Ce CIN est déjà utilisé."
                    );
                }

        String hash = PasswordUtil.hashPassword(patientDTO.getPassword());

        Patient patient = PatientMapper.toEntity(patientDTO, hash);

                // Enregistrement
                 patientRepository.save(patient);
            }


    public  Doctor registerDoctor(DoctorDTO dto){
        String hash = PasswordUtil.hashPassword(dto.getPassword());

        Specialty specialty = specialtyRepository
                .findById(dto.getSpecialtyId())
                .orElseThrow(() ->
                        new SpecialtyNotFoundException("Specialty not found")
                );

        Doctor doctor = DoctorMapper.toEntity(
                dto,
                hash,
                specialty
        );

      return   doctorRepository.save(doctor);
    }

public User login(LoginDTO dto) {

    User user = userRepository.findByEmail(dto.getEmail())
            .orElseThrow(() ->
                    new InvalidCredentialsException(
                            "Email ou mot de passe incorrect"
                    )
            );

    if (!PasswordUtil.checkPassword(
            dto.getPassword(),
            user.getPassword()
    )) {
        throw new InvalidCredentialsException(
                "Email ou mot de passe incorrect"
        );
    }

    return user;
}
}
