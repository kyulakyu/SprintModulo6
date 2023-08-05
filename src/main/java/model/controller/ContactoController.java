package model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContactoController {
    // Inyectar la dependencia del bean ContactoDao
  
   

    /**
     * Maneja las solicitudes que se le hacen a la raíz del sitio
     * 
     * @return un objeto {@link ModelAndView} con la respuesta al cliente
     */
    @RequestMapping(path = "/Contacto", method = RequestMethod.GET)
    public ModelAndView mostrarContacto() {
        return new ModelAndView("contacto");
    }
    
  
    }

