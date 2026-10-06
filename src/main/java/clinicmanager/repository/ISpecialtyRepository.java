package clinicmanager.repository;


import clinicmanager.model.Specialty;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ISpecialtyRepository {
   Optional<Specialty> findById(UUID id);
   List<Specialty> findAll();
}
