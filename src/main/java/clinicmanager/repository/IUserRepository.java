package clinicmanager.repository;


import clinicmanager.model.User;

import java.util.Optional;

public interface IUserRepository {

    Optional<User> findByEmail(String email);
}
