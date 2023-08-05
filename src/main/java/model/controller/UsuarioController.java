package model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import model.entity.Usuario;
import model.service.UsuarioService;


@Controller
public class UsuarioController {
	@Autowired
	private UsuarioService us;

	@RequestMapping(path = "/CrearUsuario", method = RequestMethod.GET)
    public ModelAndView mostrarCrearCapacitacion() {
        return new ModelAndView("crearUsuario");
    }
    
    @RequestMapping(path = "/ListarUsuarios", method = RequestMethod.GET)
    public ModelAndView mostrarListarUsuario() {
    	List<Usuario> usuarios = us.getUsuarios();
        return new ModelAndView("listarUsuarios", "usuarios", usuarios);
    }  
    @RequestMapping(path = "/CrearUsuario", method = RequestMethod.POST)
    public ModelAndView crearUsuario(Usuario usuario) {
    	 try {
    			
    	        us.crearUsuario(usuario);
    	        // Redirigir a la página de listar capacitaciones
    	        return new ModelAndView("redirect:/ListarUsuarios");
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	        // Manejar el error adecuadamente, redirigir a una página de error o mostrar un mensaje de error en la vista.
    	        return new ModelAndView("error");
    	    }
    }
}
    	