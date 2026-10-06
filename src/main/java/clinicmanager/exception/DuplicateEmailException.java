package clinicmanager.exception;


    public class DuplicateEmailException extends BusinessException {

        private static final long serialVersionUID = 1L;
        public DuplicateEmailException(String message) {
            super(message);
        }
    }
