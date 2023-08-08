package model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.Calendar;

@Entity
@Table(name = "pagos")
public class Pago {
	// se crean los atributos de la clase pago
	@Id
	@Column(name = "id")
	private int identificador;
	@Column(name = "cliente_id")
	private Integer clienteid;
	@Column(name = "monto")
	private int monto;
	@Column(name = "fecha_pago")
	private Date fechapago;
	@Column(name = "detalle")
	private String detalle;

	// se crea el constructor con todos los atributos de la clase
	public Pago() {
	}

	public Pago(int identificador, Integer clienteid, int monto, Date fechapago, String detalle) {
		super();

		this.identificador = identificador;
		this.clienteid = clienteid;
		this.monto = monto;
		this.fechapago = fechapago;
        this.detalle = detalle;
	}

	// se crean los metodos de acceso y modificadores de yodos los atributos
	public int getIdentificador() {
		return identificador;
	}

	public boolean setIdentificador(int identificador) {
		String identificadorString = Integer.toString(identificador);

		if (identificadorString != null && !identificadorString.isEmpty()) {
			try {
				int id = Integer.parseInt(identificadorString);
				this.identificador = id;
				return true; // Indicar que el valor se estableció correctamente
			} catch (NumberFormatException e) {
				return false;
			}
		} else {
			return false;
		}
	}

	public Integer getclienteid() {
		return clienteid;
	}

	public boolean setclienteid(Integer clienteid) {

		if (clienteid < 99999999) {
			this.clienteid = clienteid;
			return true;

		} else {

			return false;
		}
	}

	public int getMonto() {
		return monto;
	}

	public boolean setMonto(int monto) {
		String montoString = Integer.toString(monto);

		if (monto < 999999999) {
			try {
				int montoA = Integer.parseInt(montoString);
				this.monto = montoA;
				return true;
			} catch (NumberFormatException e) {
				return false;
			}
		} else {

			return false;
		}
	}
	
	public Date getfechapago() {
		return fechapago;
	}

	public boolean validarFecha() {
	    if (fechapago != null) {
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(fechapago);
	        int dia = calendar.get(Calendar.DAY_OF_MONTH);
	        int mes = calendar.get(Calendar.MONTH) + 1; // Los meses en Calendar van de 0 a 11
	        int anio = calendar.get(Calendar.YEAR);
	        
	        // Verificar que el dia, mes y año estén dentro de los límites válidos
	        boolean diaValido = dia >= 1 && dia <= 31;
	        boolean mesValido = mes >= 1 && mes <= 12;
	        boolean anioValido = anio >= 1900 && anio <= 9999;
	        
	        return diaValido && mesValido && anioValido;
	    }
	    return false; // La fecha es nula, considerarla inválida
	}

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

	public String mostrarDetalle() {
		return "El cliemte " + clienteid + "pagó " + "$" + monto + " del día " + fechapago + "por " + detalle;
	}
}