package edu.ucam.pojos;

public class Asignatura {

	//Atributos de la clase Asignatura
	private String id;
	private String nombre;

	//Constructor de la clase Asignatura
	public Asignatura(String id, String nombre) {
		this.id = id;
		this.nombre = nombre;
	}
	
	//Métodos getters y setters
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
