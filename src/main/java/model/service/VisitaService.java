package model.service;

import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Visita;
import model.repository.IVisitaRepository;

@Service
public class VisitaService {
	@Autowired
    private IVisitaRepository visRepo;
	
	public VisitaService() {
        super();
    }
	
	public List<Visita> obtenerTodasLasVisitas() {
        return visRepo.findAll();
    }
	
	public void crearVisita(int clienteId, int profesionalId, String fechaVisita, String detalle) {
        Visita visita = new Visita();
        visita.setClienteId(clienteId);
        visita.setProfesionalId(profesionalId);
        visita.setFechaVisita(fechaVisita);
        visita.setDetalle(detalle);
        
        visRepo.save(visita);
    }

	public Visita obtenerVisitaPorId(int visitaId) {
		return visRepo.getOne(visitaId);
	}

	public void guardarVisita(Visita visita) {
		visRepo.save(visita);
	}
	
	@Transactional
	public void actualizarEstadoVisita(int visitaId, boolean realizada) {
		Visita visita  = visRepo.findById(visitaId).orElse(null);
		if (visita != null) {
            visita.setVisitaRealizada(realizada);
            // No es necesario llamar a visitaRepository.save(visita) ya que la entidad está administrada por JPA y se actualizará automáticamente al final de la transacción.
        } else {
            throw new EntityNotFoundException("Visita no encontrada con el ID proporcionado");
        }
	}

	
	//Borrar
	public void actualizarVisita(Visita visita) {
        // Verificar si la visita existe en la base de datos
        if (visRepo.existsById(visita.getIdVisita())) {
            // Actualizar la visita en la base de datos
        	visRepo.save(visita);
        } else {
            // La visita no existe, realizar alguna acción o lanzar una excepción
            throw new RuntimeException("La visita con ID " + visita.getIdVisita() + " no existe.");
        }
    }
}
