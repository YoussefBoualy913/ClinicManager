package clinicmanager.exception;


public class DoctorNotFoundException extends BusinessException {

    private static final long serialVersionUID = 1L;
    public DoctorNotFoundException() {
        super("Doctor not found");
    }
}
