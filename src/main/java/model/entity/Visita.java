package model.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "visitas")
public class Visita {

	@Id
	@Column(name = "id")
	private int idVisita;
	@Column(name = "cliente_id")
	private int clienteId;
	@Column(name = "profesional_id")
	private int profesionalId;
	@Column(name = "fecha_visita")
	private String fechaVisita;
	private String detalle;
	private boolean visitaRealizada;

	public int getIdVisita() {
		return idVisita;
	}

	public int getClienteId() {
		return clienteId;
	}

	public int getProfesionalId() {
		return profesionalId;
	}

	public String getFechaVisita() {
		return fechaVisita;
	}

	public String getDetalle() {
		return detalle;
	}

	public Boolean getVisitaRealizada() {
		return visitaRealizada;
	}

	public boolean setIdVisita(int idVisita) {
		if (idVisita > 0) {
			this.idVisita = idVisita;
			return true;
		} else {
			return false;
		}
	}

	public boolean setClienteId(int clienteId) {
		if (clienteId > 0) {
			this.clienteId = clienteId;
			return true;
		} else {
			return false;
		}
	}

	public boolean setProfesionalId(int profesionalId) {
		if (profesionalId > 0) {
			this.profesionalId = profesionalId;
			return true;
		} else {
			return false;
		}
	}

	public boolean setFechaVisita(String fechaVisita) {
		if (fechaVisita == null) {
			return false; // La fecha es nula, formato incorrecto
		}

		String formatoFecha = "dd/MM/yyyy";
		SimpleDateFormat sdf = new SimpleDateFormat(formatoFecha);
		sdf.setLenient(false); // Evita la flexibilidad en el análisis de fechas

		try {
			sdf.parse(fechaVisita);
			this.fechaVisita = fechaVisita;
			return true; // La fecha tiene el formato correcto y fue establecida correctamente
		} catch (ParseException e) {
			return false; // La fecha no tiene el formato correcto
		}
	}

	public boolean setDetalle(String detalle) {
		if (detalle != null && !detalle.isEmpty()) {
			this.detalle = detalle;
			return true; // El nombre se estableció correctamente
		} else {
			return false; // El nombre es inválido
		}
	}
	
	public void setVisitaRealizada(Boolean visitaRealizada) {
		this.visitaRealizada = visitaRealizada;
	}
}
