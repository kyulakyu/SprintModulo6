package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import model.entity.Pago;
@Repository
public interface IPagoRepository extends JpaRepository<Pago, Integer>{

    @Query("SELECT p FROM Pago p ORDER BY p.id DESC")
    List<Pago> findUltimosTresPagos();
}