package clinicmanager.dto;

import clinicmanager.model.Gender;
import clinicmanager.model.BloodGroup;

import jakarta.validation.constraints.*;

import javax.xml.transform.Source;
import java.time.LocalDate;

public class PatientDTO {

    @NotBlank(message = "Le prénom est obligatoire")
    @Size(max = 50)
    private String firstName;

    @NotBlank(message = "Le nom est obligatoire")
    @Size(max = 50)
    private String lastName;

    @NotBlank(message = "L'email est obligatoire")
    @Email(message = "Email invalide")
    private String email;

    @NotBlank(message = "Le téléphone est obligatoire")
    @Pattern(regexp = "^\\+?[0-9]{9,15}$")
    private String phone;

    @NotBlank(message = "Le mot de passe est obligatoire")
    @Size(min = 8, message = "8 caractères minimum")
    private String password;

    @NotBlank(message = "Le CIN est obligatoire")
    @Size(min = 5, max = 20)
    private String cin;

    @NotNull(message = "La date de naissance est obligatoire")
    @Past(message = "La date doit être dans le passé")
    private LocalDate birthDate;

    @NotNull(message = "Le genre est obligatoire")
    private Gender gender;

    @NotBlank(message = "L'adresse est obligatoire")
    private String address;

    @NotNull(message = "Le groupe sanguin est obligatoire")
    private BloodGroup bloodGroup;


    public PatientDTO() {
    }

    public PatientDTO(String firstName, String lastName,
                      String email, String phone,
                      String password, String cin,
                      LocalDate birthDate, Gender gender,
                      String address, BloodGroup bloodGroup) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.cin = cin;
        this.birthDate = birthDate;
        this.gender = gender;
        this.address = address;
        this.bloodGroup = bloodGroup;
    }

    public @NotBlank(message = "Le prénom est obligatoire") @Size(max = 50) String getFirstName() {
        return firstName;
    }

    public void setFirstName(@NotBlank(message = "Le prénom est obligatoire") @Size(max = 50) String firstName) {
        this.firstName = firstName;
    }

    public @NotBlank(message = "Le nom est obligatoire") @Size(max = 50) String getLastName() {
        return lastName;
    }

    public void setLastName(@NotBlank(message = "Le nom est obligatoire") @Size(max = 50) String lastName) {
        this.lastName = lastName;
    }

    public @NotBlank(message = "L'email est obligatoire") @Email(message = "Email invalide") String getEmail() {
        return email;
    }

    public void setEmail(@NotBlank(message = "L'email est obligatoire") @Email(message = "Email invalide") String email) {
        this.email = email;
    }

    public @NotBlank(message = "Le téléphone est obligatoire") @Pattern(regexp = "^\\+?[0-9]{9,15}$") String getPhone() {
        return phone;
    }

    public void setPhone(@NotBlank(message = "Le téléphone est obligatoire") @Pattern(regexp = "^\\+?[0-9]{9,15}$") String phone) {
        this.phone = phone;
    }

    public @NotBlank(message = "Le mot de passe est obligatoire") @Size(min = 8, message = "8 caractères minimum") String getPassword() {
        return password;
    }

    public void setPassword(@NotBlank(message = "Le mot de passe est obligatoire") @Size(min = 8, message = "8 caractères minimum") String password) {
        this.password = password;
    }

    public @NotBlank(message = "Le CIN est obligatoire") @Size(min = 5, max = 20) String getCin() {
        return cin;
    }

    public void setCin(@NotBlank(message = "Le CIN est obligatoire") @Size(min = 5, max = 20) String cin) {
        this.cin = cin;
    }

    public @NotNull(message = "La date de naissance est obligatoire") @Past(message = "La date doit être dans le passé") LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(@NotNull(message = "La date de naissance est obligatoire") @Past(message = "La date doit être dans le passé") LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public @NotNull(message = "Le genre est obligatoire") Gender getGender() {
        return gender;
    }

    public void setGender(@NotNull(message = "Le genre est obligatoire") Gender gender) {
        this.gender = gender;
    }

    public @NotNull(message = "Le groupe sanguin est obligatoire") BloodGroup getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(@NotNull(message = "Le groupe sanguin est obligatoire") BloodGroup bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public @NotBlank(message = "L'adresse est obligatoire") String getAddress() {
        return address;
    }

    public void setAddress(@NotBlank(message = "L'adresse est obligatoire") String address) {
        this.address = address;
    }
}