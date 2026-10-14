package clinicmanager.service;


import clinicmanager.dto.TimeSlotDTO;
import clinicmanager.exception.BusinessException;
import clinicmanager.model.Doctor;
import clinicmanager.repository.imp.AbsenceRepository;
import clinicmanager.repository.imp.DoctorRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
@ApplicationScoped
public class DoctorService {

    @Inject
    private DoctorRepository doctorRepository;
    @Inject
    private TimeSlotService timeSlotService;
    public Optional<Doctor> findByDoctorId(UUID doctorId) {
       return doctorRepository.findByDoctorId(doctorId);
    }
    public List<Doctor> findBySpecialtyId(UUID specialtyId) {
        return  doctorRepository.findBySpecialtyId(specialtyId);
    }

    public List<LocalDate> getAvailableDatesForDoctor(Doctor doctor) {


        List<LocalDate> availableDates = new ArrayList<>();

        LocalDate today = LocalDate.now();
        LocalDate endDate = today.plusDays(30);

        for (LocalDate date = today; !date.isAfter(endDate); date = date.plusDays(1)) {

            List<TimeSlotDTO> availableSlots =
                    timeSlotService.getAvailableSlotsForDoctor(doctor, date);

            if (availableSlots != null && !availableSlots.isEmpty()) {
                availableDates.add(date);
            }
        }

        return availableDates;
    }

}
