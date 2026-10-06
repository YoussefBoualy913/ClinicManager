package clinicmanager.mapper;

import clinicmanager.dto.DoctorDTO;
import clinicmanager.model.Doctor;
import clinicmanager.model.Specialty;

public class DoctorMapper {

    public static Doctor toEntity(
            DoctorDTO dto,
            String hashedPassword,
            Specialty specialty
    ) {

        return new Doctor(
                dto.getFirstName(),
                dto.getLastName(),
                dto.getEmail(),
                dto.getPhone(),
                hashedPassword,
                dto.getMatricule(),
                dto.getTitle(),
                specialty
        );
    }
}