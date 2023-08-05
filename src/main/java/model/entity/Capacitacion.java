package model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "capacitaciones")
public class Capacitacion {
	// se crean los atributos de la clase Capacitacion
	@Id
	@Column(name = "id")
	private int identificador;

	private int rut;
	private String dia;
	private String hora;
	private String lugar;
	private String duracion;
	private int cantidad;
	private String nombre;
	private String detalle;

	// se crea el constructor con todos los atributos de la clase
	public Capacitacion() {

	}

	public Capacitacion(int identificador, int rut, String dia, String hora, String lugar, String duracion,
			int cantidad, String nombre, String detalle) {
		super();

		this.identificador = identificador;
		this.rut = rut;
		this.dia = dia;
		this.hora = hora;
		this.lugar = lugar;
		this.duracion = duracion;
		this.cantidad = cantidad;
		this.nombre = nombre;
        this.detalle = mostrarDetalle();

	}

	public String getNombre() {
		return nombre;
	}

	public boolean setNombre(String nombre) {
		this.nombre = nombre;
		if (nombre != null && !nombre.isEmpty()) {
			return true; // El nombre se estableció correctamente
		} else {
			return false; // El nombre es inválido
		}
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

	public int getRut() {
		return rut;
	}

	public boolean setRut(int rut) {

		if (rut < 99999999) {
			this.rut = rut;
			return true;

		} else {

			return false;
		}
	}

	public String getDia() {
		return dia;
	}

	public boolean setDia(String dia) {
		if (dia != null && !dia.isEmpty()) {
			if (dia.equalsIgnoreCase("lunes") || dia.equalsIgnoreCase("martes") || dia.equalsIgnoreCase("miércoles")
					|| dia.equalsIgnoreCase("jueves") || dia.equalsIgnoreCase("viernes")
					|| dia.equalsIgnoreCase("sábado") || dia.equalsIgnoreCase("domingo")) {
				this.dia = dia;
				return true; // El día es válido
			}
		}
		return false; // El día es inválido o está vacío
	}

	public String getHora() {
		return hora;

	}

	public boolean setHora(String hora) {
		this.hora = hora;
		if (hora.length() == 5) {
			String dosPrimerosCaracteres = hora.substring(0, 2);
			String tercerCaracter = Character.toString(hora.charAt(2));
			String ultimosCaracteres = hora.substring(3, 5);

			// comparo
			int numero = Integer.parseInt(dosPrimerosCaracteres);
			int numero2 = Integer.parseInt(ultimosCaracteres);

			if (numero < 24 && tercerCaracter.equals(":") && numero2 < 60) {
				return true; // La hora es válida
			}
		}
		return false; // La hora es inválida
	}

	public String getLugar() {
		return lugar;
	}

	public boolean setLugar(String lugar) {
		this.lugar = lugar;
		if (lugar.length() > 9 && lugar.length() < 51) {
			return true;
		} else {
			return false;
		}
	}

	public String getDuracion() {
		return duracion;
	}

	public boolean setDuracion(String duracion) {
		this.duracion = duracion;
		if (duracion.length() < 71) {
			this.duracion = duracion;
			return true;
		} else {
			return false;
		}
	}

	public int getCantidad() {
		return cantidad;
	}

	public boolean setCantidadAsistentes(int cantidad) {
		String cantidadString = Integer.toString(cantidad);

		if (cantidad < 1000) {
			try {
				int cantidadA = Integer.parseInt(cantidadString);
				this.cantidad = cantidadA;
				return true;
			} catch (NumberFormatException e) {
				return false;
			}
		} else {

			return false;
		}
	}
	
    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

	public String mostrarDetalle() {
		return "La capacitación será en " + lugar + " a las " + hora + " del día " + dia + ", y durará " + duracion
				+ " minutos.";
	}
}