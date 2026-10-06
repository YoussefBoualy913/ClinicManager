
package clinicmanager.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(
        name = "doctors",
        uniqueConstraints = {
                @UniqueConstraint(
                        name = "uk_doctor_matricule",
                        columnNames = "matricule"
                )
        }
)
@PrimaryKeyJoinColumn(name = "user_id")
public class Doctor extends User {

    @Column(nullable = false, unique = true, length = 50)
    private String matricule;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 50)
    private DoctorTitle title;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "specialty_id", nullable = false)
    private Specialty specialty;

    @OneToMany(mappedBy = "doctor",
            cascade = CascadeType.REMOVE)
    private List<Availability> availabilities = new ArrayList<>();

    public Doctor() {
        super();
    }

    public Doctor(
            String firstName,
            String lastName,
            String email,
            String phone,
            String password,
            String matricule,
            DoctorTitle title,
            Specialty specialty
    ) {
        super(firstName, lastName, email, phone, password, Role.DOCTOR);
        this.matricule = matricule;
        this.title = title;
        this.specialty = specialty;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public DoctorTitle getTitle() {
        return title;
    }

    public void setTitle(DoctorTitle title) {
        this.title = title;
    }

    public Specialty getSpecialty() {
        return specialty;
    }

    public void setSpecialty(Specialty specialty) {
        this.specialty = specialty;
    }
}
