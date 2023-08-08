package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import model.entity.Profesional;

public interface IProfesionalRepository  extends JpaRepository<Profesional, Integer>{

	 @Query("SELECT p FROM Profesional p WHERE p.tipo = 'Profesional'")
   List<Profesional> findAllProfesionales();
	 
	 
}