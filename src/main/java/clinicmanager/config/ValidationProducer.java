package clinicmanager.config;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.inject.Produces;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;

@ApplicationScoped
public class ValidationProducer {

    @Produces
    @ApplicationScoped
    public Validator validator() {

        ValidatorFactory factory =
                Validation.buildDefaultValidatorFactory();

        return factory.getValidator();
    }
}