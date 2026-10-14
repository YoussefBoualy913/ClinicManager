package clinicmanager.repository;


import clinicmanager.dto.AbsenceDTO;
import clinicmanager.model.Absence;
import clinicmanager.model.Doctor;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public interface IAbsenceRepository {
    List<Absence> findAbsenceByDoctorId(UUID doctorId);
    void save(Absence  absence);
    boolean existsAbsenceOnDate(Doctor doctor, LocalDate date);
}
