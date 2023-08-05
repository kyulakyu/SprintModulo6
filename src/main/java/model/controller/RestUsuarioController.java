package model.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import model.entity.Capacitacion; // Importar la clase Capacitacion
import model.entity.Usuario;
import model.service.CapacitacionService; // Importar el servicio CapacitacionService
import model.service.UsuarioService;

@RestController
public class RestUsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private CapacitacionService capacitacionService; // Inyectar el servicio CapacitacionService

    @RequestMapping(value="/api/clientes", headers="Accept=application/json")
    public List<Usuario> getAllClientes(){
        return usuarioService.getAllClientes();
    }
    
    @RequestMapping(value="/api/capacitaciones", headers="Accept=application/json")
    public List<Capacitacion> getTresCapacitaciones(){
        return capacitacionService.getUltimasTresCapacitaciones(); // Llamar al método getCapacitaciones() del servicio CapacitacionService
    }
}

