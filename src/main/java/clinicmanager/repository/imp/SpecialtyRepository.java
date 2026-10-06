package clinicmanager.repository.imp;

import clinicmanager.config.JPAConfig;
import clinicmanager.model.Specialty;
import clinicmanager.repository.ISpecialtyRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@ApplicationScoped
public class SpecialtyRepository implements ISpecialtyRepository {

    @Override
    public Optional<Specialty> findById(UUID id) {

        EntityManager em = JPAConfig.createEntityManager();

        try {
            Specialty specialty = em.find(Specialty.class, id);

            return Optional.ofNullable(specialty);

        } finally {
            em.close();
        }
    }

    @Override
    public List<Specialty> findAll() {

        EntityManager em = JPAConfig.createEntityManager();

        try {
            return em.createQuery(
                    "SELECT s FROM Specialty s",
                    Specialty.class
            ).getResultList();

        } finally {
            em.close();
        }
    }
}
