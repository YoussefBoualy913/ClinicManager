package clinicmanager.exception;


public class DuplicateMatriculeException extends BusinessException {

    private static final long serialVersionUID = 1L;
    public DuplicateMatriculeException() {
        super("DuplicateMatriculeException");
    }
}
