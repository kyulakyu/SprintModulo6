package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import model.entity.Usuario;
import model.repository.IUsuarioRepository;

@Service
public class UsuarioService {
    @Autowired
    private IUsuarioRepository usRepo;

    public UsuarioService() {
        super();
    }

    public List<Usuario> getUsuarios() {
        return usRepo.findAll();
    }

    public void crearUsuario(Usuario u) {
        usRepo.save(u);
    }

    public List<Usuario> getAllClientes() {
        return usRepo.findByTipo("Cliente");
    }
}

