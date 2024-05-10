package edu.ucam.pojos;

public class Convocatoria {

	// Atributos de la clase Convocatoria
	private String id;
	private String nombre;
	
	public Convocatoria(String id, String nombre) {
		this.id = id;
		this.nombre = nombre;
	}

	// Métodos getter y setter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
}
