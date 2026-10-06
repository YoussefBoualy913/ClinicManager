package clinicmanager.service;

import clinicmanager.dto.DoctorDTO;
import clinicmanager.exception.SpecialtyNotFoundException;
import clinicmanager.mapper.DoctorMapper;
import clinicmanager.model.Doctor;
import clinicmanager.model.Specialty;
import clinicmanager.repository.imp.DoctorRepository;
import clinicmanager.repository.imp.SpecialtyRepository;
import clinicmanager.util.PasswordUtil;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.util.List;
@ApplicationScoped
public class SpecialtyService {
    @Inject
    private  SpecialtyRepository specialtyRepository;


    public  List<Specialty> findAll(){
      return  specialtyRepository.findAll();
    }

}
