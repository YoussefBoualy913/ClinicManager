package clinicmanager.exception;


public class AppointmentConflictException extends BusinessException {

    private static final long serialVersionUID = 1L;
    public AppointmentConflictException() {
        super("AppointmentConflictException");
    }
}
