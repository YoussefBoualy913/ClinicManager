package clinicmanager.service;


import clinicmanager.dto.AvailabilityDTO;
import clinicmanager.exception.BusinessException;
import clinicmanager.exception.DateTimeParseException;
import clinicmanager.model.Availability;
import clinicmanager.model.AvailabilityStatus;
import clinicmanager.model.Doctor;
import clinicmanager.repository.IAvailabilityRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;
@ApplicationScoped
public class AvailabilityService {
    @Inject
    private IAvailabilityRepository availabilityRepository;

    public List<Availability> findByDoctorId(UUID doctorId) {
       return availabilityRepository.findAvailabilityByDoctorId(doctorId);
    }
    public void createAvailability(Doctor doctor, AvailabilityDTO dto) throws BusinessException {

        if (dto.getDayOfWeek() == null || dto.getDayOfWeek().isBlank()
                || dto.getStartTime() == null || dto.getStartTime().isBlank()
                || dto.getEndTime() == null || dto.getEndTime().isBlank()
                || dto.getStatus() == null || dto.getStatus().isBlank()
                || dto.getValidFrom() == null || dto.getValidFrom().isBlank()) {
            throw new BusinessException("Tous les champs obligatoires doivent être remplis.");
        }

        try {

            DayOfWeek day = DayOfWeek.valueOf(dto.getDayOfWeek());
            LocalTime start = LocalTime.parse(dto.getStartTime());
            LocalTime end = LocalTime.parse(dto.getEndTime());
            AvailabilityStatus status =
                    AvailabilityStatus.valueOf(dto.getStatus());

            LocalDate from = LocalDate.parse(dto.getValidFrom());

            LocalDate until = (dto.getValidUntil() == null
                    || dto.getValidUntil().isBlank())
                    ? null
                    : LocalDate.parse(dto.getValidUntil());

            if (!end.isAfter(start)) {
                throw new BusinessException(
                        "L'heure de fin doit être après l'heure de début.");
            }

            if (until != null && until.isBefore(from)) {
                throw new BusinessException(
                        "La date de fin doit être après la date de début.");
            }


            Availability availability = new Availability();
            availability.setDoctor(doctor);
            availability.setDayOfWeek(day);
            availability.setStartTime(start);
            availability.setEndTime(end);
            availability.setStatus(status);
            availability.setValidFrom(from);
            availability.setValidUntil(until);


            availabilityRepository.save(availability);

        } catch (DateTimeParseException | IllegalArgumentException e) {
            throw new BusinessException(
                    "Le jour, le statut, l'heure ou la date est invalide.");
        }
    }

    public void deleteAvailability(UUID availabilityId) {
        availabilityRepository.delete(availabilityId);
    }

}
