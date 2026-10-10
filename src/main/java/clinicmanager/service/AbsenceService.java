package clinicmanager.service;

import clinicmanager.dto.AbsenceDTO;
import clinicmanager.exception.BusinessException;
import clinicmanager.exception.DateTimeParseException;
import clinicmanager.model.Absence;
import clinicmanager.model.AbsenceType;
import clinicmanager.model.Availability;
import clinicmanager.model.Doctor;
import clinicmanager.repository.IAbsenceRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class AbsenceService {
    @Inject
    private IAbsenceRepository absenceRepository;

    public List<Absence> findByDoctorId(UUID doctorId) {
        return absenceRepository.findAbsenceByDoctorId(doctorId);
    }

    public void createAbsence(Doctor doctor, AbsenceDTO dto) throws BusinessException {

        if (doctor == null) {
            throw new BusinessException(
                    "Le médecin doit être authentifié."
            );
        }

        if (dto == null) {
            throw new BusinessException(
                    "Les données de l'absence sont obligatoires."
            );
        }

        if (dto.getStartDate() == null
                || dto.getStartDate().isBlank()
                || dto.getEndDate() == null
                || dto.getEndDate().isBlank()) {
            throw new BusinessException(
                    "Les dates de début et de fin sont obligatoires."
            );
        }

        LocalDate startDate;
        LocalDate endDate;

        try {
            startDate = LocalDate.parse(dto.getStartDate());
            endDate = LocalDate.parse(dto.getEndDate());
        } catch (DateTimeParseException e) {
            throw new BusinessException(
                    "Le format des dates est invalide. Utilisez yyyy-MM-dd."
            );
        }

        if (endDate.isBefore(startDate)) {
            throw new BusinessException(
                    "La date de fin doit être égale ou postérieure à la date de début."
            );
        }

        if (dto.getReason() != null && dto.getReason().length() > 500) {
            throw new BusinessException(
                    "Le motif ne doit pas dépasser 500 caractères."
            );
        }

        if (dto.getType() == null || dto.getType().isBlank()) {
            throw new BusinessException(
                    "Le type d'absence est obligatoire."
            );
        }

        AbsenceType type;

        try {
            type = AbsenceType.valueOf(dto.getType());
        } catch (IllegalArgumentException e) {
            throw new BusinessException(
                    "Le type d'absence sélectionné est invalide."
            );
        }

        Absence absence = new Absence();
        absence.setDoctor(doctor);
        absence.setStartDate(startDate);
        absence.setEndDate(endDate);
        absence.setReason(
                dto.getReason() == null || dto.getReason().isBlank()
                        ? null
                        : dto.getReason().trim()
        );
        absence.setType(type);

        absenceRepository.save(absence);
    }
}
