package model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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
	private String fechapago;
	@Column(name = "detalle")
	private String detalle;

	// se crea el constructor con todos los atributos de la clase
	public Pago() {
	}

	public Pago(Integer clienteid, Integer monto, String fechapago, String detalle) {
		super();
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

	public Integer getClienteid() {
		return clienteid;
	}

	public String getFechapago() {
		return fechapago;
	}

	public void setClienteid(Integer clienteid) {
		this.clienteid = clienteid;
	}

	public void setFechapago(String fechapago) {
		this.fechapago = fechapago;
	}

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }
}