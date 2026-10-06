package clinicmanager.mapper;

import clinicmanager.dto.PatientDTO;
import clinicmanager.model.Patient;

public class PatientMapper {

    public static Patient toEntity(PatientDTO dto, String hashedPassword) {

        return new Patient(
                dto.getFirstName(),
                dto.getLastName(),
                dto.getEmail(),
                dto.getPhone(),
                hashedPassword,
                dto.getCin(),
                dto.getBirthDate(),
                dto.getGender(),
                dto.getAddress(),
                dto.getBloodGroup()
        );
    }
}
