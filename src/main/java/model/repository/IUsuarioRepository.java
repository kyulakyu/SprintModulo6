package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import model.entity.Usuario;

public interface IUsuarioRepository extends JpaRepository<Usuario, Integer>{
	List<Usuario> findByTipo(String tipo);
}
