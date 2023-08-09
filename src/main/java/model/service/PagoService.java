package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import model.entity.Pago;
import model.repository.IPagoRepository;

@Service
public class PagoService {

    private final IPagoRepository PagoRepository;

    @Autowired
    public PagoService(IPagoRepository PagoRepository) {
        this.PagoRepository = PagoRepository;
    }

    public List<Pago> getPagos() {
        return PagoRepository.findAll();
    }

    public List<Pago> getUltimosTresPagos() {
        List<Pago> todosLosPagos = PagoRepository.findUltimosTresPagos();
        return limitarATres(todosLosPagos);
    }

    private List<Pago> limitarATres(List<Pago> Pagos) {
        return Pagos.subList(0, Math.min(Pagos.size(), 3));
    }

    public void crearPagos(Pago p) {
        PagoRepository.save(p);
    }
}