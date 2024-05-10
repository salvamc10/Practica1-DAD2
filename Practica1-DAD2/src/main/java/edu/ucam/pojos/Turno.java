package edu.ucam.pojos;

import java.util.Hashtable;

public class Turno {
	
	private String id;
	private String nombre;
	private Hashtable<String, Asignatura> asignaturas;
	
	public Turno(String id, String nombre, Hashtable<String, Asignatura> asignaturas) {
		this.id = id;
		this.nombre = nombre;
		this.asignaturas = asignaturas;
	}

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

	public Hashtable<String, Asignatura> getAsignaturas() {
		return asignaturas;
	}

	public void setAsignaturas(Hashtable<String, Asignatura> asignaturas) {
		this.asignaturas = asignaturas;
	}
	
    public void agregarAsignatura(Asignatura asignatura) {
        this.asignaturas.put(id, asignatura);
    }

}
