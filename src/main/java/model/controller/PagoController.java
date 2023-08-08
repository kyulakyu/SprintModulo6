package model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Pago;
import model.service.PagoService;

@Controller
public class PagoController {

    @Autowired
    private PagoService cs;

    @Autowired
    private RestUsuarioController restUsuarioController; // Inyectar el servicio RestUsuarioController

    /**
     * Maneja las solicitudes que se le hacen a la raíz del sitio
     * 
     * @return un objeto {@link ModelAndView} con la respuesta al cliente
     */
    @RequestMapping(path = "/CrearPago", method = RequestMethod.GET)
    public ModelAndView mostrarCrearPago() {
        return new ModelAndView("crearPago");
    }

    @RequestMapping(path = "/ListarPagos", method = RequestMethod.GET)
    public ModelAndView mostrarListarPagos() {
        // Obtener la lista de Pagos desde el servicio PagoService
        List<Pago> Pagos = cs.getPagos();

        ModelAndView modelAndView = new ModelAndView("listarPagos", "Pagos", Pagos);
        return modelAndView;
    }

    @RequestMapping(path = "/CrearPago", method = RequestMethod.POST)
    public ModelAndView crearPago(Pago pago) {
        try {
            // Validar la fecha antes de guardar el pago en la base de datos
            if (!pago.validarFecha()) {
                ModelAndView errorModelAndView = new ModelAndView("crearPago");
                errorModelAndView.addObject("errorMessage", "La fecha de pago es inválida. Por favor, introduzca una fecha válida (DD/MM/AAAA).");
                return errorModelAndView;
            }

            String detalle = pago.mostrarDetalle(); // Obtenemos el detalle utilizando el método mostrarDetalle()
            pago.setDetalle(detalle); // Establecemos el detalle en el objeto pago
            cs.crearPagos(pago, detalle); // Guardamos el pago en la base de datos (asegúrate de que el método crearPagos solo reciba la instancia de pago)

            // Obtener la lista de Pagos en formato JSON desde el servicio RestUsuarioController
            List<Pago> PagosJson = restUsuarioController.getTresPagos();

            // Agregar la lista de Pagos JSON al modelo para que esté disponible en la vista listaPagosJson.jsp
            ModelAndView jsonModelAndView = new ModelAndView("listarPagosJson");
            jsonModelAndView.addObject("PagosJson", PagosJson);

            return jsonModelAndView;
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error adecuadamente, redirigir a una página de error o mostrar un mensaje de error en la vista.
            ModelAndView errorModelAndView = new ModelAndView("crearPago");
            errorModelAndView.addObject("errorMessage", "Ha ocurrido un error al crear el pago. Por favor, inténtelo nuevamente.");
            return errorModelAndView;
        }
    }
}
