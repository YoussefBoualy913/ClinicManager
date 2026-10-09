package clinicmanager.repository;


import clinicmanager.model.Availability;
import clinicmanager.model.Doctor;

import java.util.List;
import java.util.UUID;

public interface IAvailabilityRepository {
     Availability findByAvailability(UUID availabilityId);
     List<Availability> findAvailabilityByDoctorId(UUID doctorId);
     void save(Availability availability);
         void delete(UUID availabilityId);
}
