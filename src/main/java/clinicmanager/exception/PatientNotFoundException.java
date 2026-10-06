package clinicmanager.exception;


public class PatientNotFoundException extends BusinessException {

    private static final long serialVersionUID = 1L;
    public PatientNotFoundException() {
        super("PatientNotFoundException");
    }
}
