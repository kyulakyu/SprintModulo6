package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Profesional;
import model.repository.IProfesionalRepository;

@Service
public class ProfesionalService {
	@Autowired
    private IProfesionalRepository prRepo;
  
  public ProfesionalService(IProfesionalRepository prRepo) {
       this.prRepo = prRepo;
    }
  public Profesional getProfesionalById(int id) {
        return prRepo.getOne(id);
       
    }
  
    public List<Profesional> getProfesional() {
    	
    	return prRepo.findAllProfesionales();
        
    }
    public void update(Profesional p) {
		prRepo.save(p);
	}
    @Transactional
    public Profesional getProfesionalWithProperties(int id) {
        Profesional profesional = prRepo.findById(id).orElse(null);
        
        if (profesional != null) {
            // Cargar propiedades relacionadas adicionales aquí
            profesional.getTitulo(); // Ejemplo: Cargar la colección de roles
            
            // Puedes hacer más operaciones para cargar otras propiedades
            
            return profesional;
        }
        
        return null;
    }
}

