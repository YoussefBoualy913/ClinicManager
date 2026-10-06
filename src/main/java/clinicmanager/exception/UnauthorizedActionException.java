package clinicmanager.exception;


public class UnauthorizedActionException extends BusinessException {

    private static final long serialVersionUID = 1L;
   public UnauthorizedActionException() {
       super("UnauthorizedActionException");
   }
}
