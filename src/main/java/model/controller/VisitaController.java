package model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.service.ClienteService;
import model.service.ProfesionalService;
import model.service.VisitaService;
import model.entity.Cliente;
import model.entity.Profesional;
import model.entity.Visita;

@Controller
public class VisitaController {
	@Autowired
	private VisitaService visitaService;

	@Autowired
	private ClienteService clienteService;

	@Autowired
	private ProfesionalService profesionalService;

	@GetMapping("/ListarVisitas")
	public ModelAndView listarTodasLasVisitas() {
		List<Visita> visitas = visitaService.obtenerTodasLasVisitas();

		ModelAndView modelAndView = new ModelAndView("listarVisitas");
		modelAndView.addObject("visitas", visitas);
		return modelAndView;
	}

	@PostMapping("/actualizarEstadoVisita")
	public ResponseEntity<String> actualizarEstadoVisita(@RequestParam int visitaId, @RequestParam boolean realizada) {
		visitaService.actualizarEstadoVisita(visitaId, realizada);
		return ResponseEntity.ok("Estado de visita actualizado");
	}

	// Crear
	@GetMapping("/CrearVisitas")
	public String mostrarFormularioCreacion(Model model) {
		List<Cliente> clientes = clienteService.getClientes();
		List<Profesional> profesionales = profesionalService.getProfesional();

		model.addAttribute("visita", new Visita());
		model.addAttribute("clientes", clientes);
		model.addAttribute("profesionales", profesionales);

		return "crearVisitas";
	}

	@PostMapping("/CrearVisitas")
	public String crearVisita(@RequestParam int clienteId, @RequestParam int profesionalId,
			@RequestParam String fechaVisita, @RequestParam String detalle) {
		visitaService.crearVisita(clienteId, profesionalId, fechaVisita, detalle);
		return "redirect:/ListarVisitas";
	}
}
