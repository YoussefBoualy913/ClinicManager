package clinicmanager.exception;


public class UnavailableSlotException extends BusinessException {

    private static final long serialVersionUID = 1L;
    public UnavailableSlotException(String message) {
        super(message);
    }
}
