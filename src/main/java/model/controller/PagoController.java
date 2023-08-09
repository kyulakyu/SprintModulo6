package model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Cliente;
import model.entity.Pago;
import model.entity.Profesional;
import model.entity.Visita;
import model.service.ClienteService;
import model.service.PagoService;

@Controller
public class PagoController {

    @Autowired
    private PagoService cs;
    
    @Autowired
    private ClienteService clienteService;

    /**
     * Maneja las solicitudes que se le hacen a la raíz del sitio
     * 
     * @return un objeto {@link ModelAndView} con la respuesta al cliente
     */
    // Crear Pago
	/*
	 * @RequestMapping(path = "/CrearPago", method = RequestMethod.GET) public
	 * ModelAndView mostrarCrearPago() { return new ModelAndView("crearPago"); }
	 */
    
    @GetMapping("/CrearPago")
	public String mostrarFormularioCreacion(Model model) {
		List<Cliente> clientes = clienteService.getClientes();

		model.addAttribute("pago", new Pago());
		model.addAttribute("clientes", clientes);

		return "crearPago";
	}

    @RequestMapping(path = "/ListarPagos", method = RequestMethod.GET)
    public ModelAndView mostrarListarPagos() {
        // Obtener la lista de Pagos desde el servicio PagoService
        List<Pago> Pagos = cs.getPagos();

        ModelAndView modelAndView = new ModelAndView("listarPagos", "Pagos", Pagos);
        return modelAndView;
    }

    @RequestMapping(path = "/CrearPago", method = RequestMethod.POST)
    public ModelAndView crearPago(@RequestParam("clienteid") Integer clienteid,
            @RequestParam("monto") Integer monto,
            @RequestParam("fechapago") String fechapago,
            @RequestParam("detalle") String detalle) {
    	System.out.println(clienteid);
    	System.out.println(monto);
    	System.out.println(fechapago);
    	System.out.println(detalle);
    	Pago pago = new Pago(clienteid, monto, fechapago, detalle);
        try {
            cs.crearPagos(pago); // Guardamos el pago en la base de datos (asegúrate de que el método crearPagos solo reciba la instancia de pago)

            return new ModelAndView("redirect:/ListarPagos");
      
            
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error adecuadamente, redirigir a una página de error o mostrar un mensaje de error en la vista.
            ModelAndView errorModelAndView = new ModelAndView("crearPago");
            errorModelAndView.addObject("errorMessage", "Ha ocurrido un error al crear el pago. Por favor, inténtelo nuevamente.");
            return errorModelAndView;
        }
    }
}
