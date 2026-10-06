
package clinicmanager.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(
        name = "patients",
        uniqueConstraints = {
                @UniqueConstraint(
                        name = "uk_patient_cin",
                        columnNames = "cin"
                )
        }
)
@PrimaryKeyJoinColumn(name = "user_id")
public class Patient extends User {

    @Column(nullable = false, unique = true, length = 30)
    private String cin;

    private LocalDate birthDate;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private Gender gender;

    @Column(length = 255)
    private String address;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private BloodGroup bloodGroup;

    public Patient() {
        super();
    }

    public Patient(
            String firstName,
            String lastName,
            String email,
            String phone,
            String password,
            String cin,
            LocalDate birthDate,
            Gender gender,
            String address,
            BloodGroup bloodGroup
    ) {
        super(firstName, lastName, email, phone, password, Role.PATIENT);
        this.cin = cin;
        this.birthDate = birthDate;
        this.gender = gender;
        this.address = address;
        this.bloodGroup = bloodGroup;
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public BloodGroup getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(BloodGroup bloodGroup) {
        this.bloodGroup = bloodGroup;
    }
}
