package clinicmanager.dto;

import clinicmanager.model.DoctorTitle;

import java.util.UUID;

public class DoctorDTO {

    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String password;

    private DoctorTitle title;
    private String matricule;

    private UUID specialtyId;

    public DoctorDTO() {
    }

    public DoctorDTO(
            String firstName,
            String lastName,
            String email,
            String phone,
            String password,
            DoctorTitle title,
            String matricule,
            UUID specialtyId
    ) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.title = title;
        this.matricule = matricule;
        this.specialtyId = specialtyId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public DoctorTitle getTitle() {
        return title;
    }

    public void setTitle(DoctorTitle title) {
        this.title = title;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public UUID getSpecialtyId() {
        return specialtyId;
    }

    public void setSpecialtyId(UUID specialtyId) {
        this.specialtyId = specialtyId;
    }
}