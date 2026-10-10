package clinicmanager.repository;


import clinicmanager.dto.AbsenceDTO;
import clinicmanager.model.Absence;

import java.util.List;
import java.util.UUID;

public interface IAbsenceRepository {
    List<Absence> findAbsenceByDoctorId(UUID doctorId);
    void save(Absence  absence);
}
