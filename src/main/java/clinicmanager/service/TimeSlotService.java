package clinicmanager.service;


import clinicmanager.dto.TimeSlotDTO;
import clinicmanager.model.Availability;
import clinicmanager.model.Doctor;
import clinicmanager.repository.imp.AbsenceRepository;
import clinicmanager.repository.imp.AppointmentRepository;
import clinicmanager.repository.imp.AvailabilityRepository;
import clinicmanager.repository.imp.DoctorRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
@ApplicationScoped
public class TimeSlotService {

    @Inject
    private AvailabilityRepository  availabilityRepository;
    @Inject
    private AppointmentRepository  appointmentRepository;
    @Inject
    private AbsenceRepository absenceRepository;

    public List<TimeSlotDTO> getAvailableSlotsForDoctor(
            Doctor doctor,
            LocalDate date
    ) {
        if (doctor == null || date == null || date.isBefore(LocalDate.now())) {
            return Collections.emptyList();
        }

        List<Availability> availabilities =
                availabilityRepository.findByDoctorAndDayOfWeek(
                        doctor,
                        date.getDayOfWeek()
                );

        List<TimeSlotDTO> availableSlots = new ArrayList<>();

        for (Availability availability : availabilities) {


            if (date.isBefore(availability.getValidFrom())
                    || date.isAfter(availability.getValidUntil())) {
                continue;
            }

            LocalTime slotStart = availability.getStartTime();
            LocalTime availabilityEnd = availability.getEndTime();

            while (!slotStart.plusMinutes(30).isAfter(availabilityEnd)) {

                LocalTime slotEnd = slotStart.plusMinutes(30);

                boolean hasAppointment =
                        appointmentRepository.existsOverlappingAppointment(
                                doctor,
                                date,
                                slotStart,
                                slotEnd
                        );

                boolean hasAbsence =
                        absenceRepository.existsAbsenceOnDate(doctor, date);

                if (!hasAppointment && !hasAbsence) {
                    availableSlots.add(
                            new TimeSlotDTO(slotStart, slotEnd)
                    );
                }

                slotStart = slotEnd;
            }
        }

        return availableSlots;
    }

}
