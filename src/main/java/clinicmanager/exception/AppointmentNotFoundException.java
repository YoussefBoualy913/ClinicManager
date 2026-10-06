package clinicmanager.exception;


public class AppointmentNotFoundException extends BusinessException {

    private static final long serialVersionUID = 1L;
    public AppointmentNotFoundException() {
        super("AppointmentNotFoundException");
    }
}
