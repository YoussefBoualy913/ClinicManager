package clinicmanager.exception;


public class MedicalNoteLockedException extends BusinessException {

    private static final long serialVersionUID = 1L;
    public MedicalNoteLockedException() {
        super("MedicalNoteLockedException");
    }
}
