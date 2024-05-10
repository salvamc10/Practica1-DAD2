package edu.ucam.pojos;

import java.util.Hashtable;

public class Turno {
	
	private String idTurno;
	private String nombreTurno;
	private Hashtable<String, Asignatura> asignaturas;
	
	public Turno(String idTurno, String nombreTurno, Hashtable<String, Asignatura> asignaturas) {
		this.idTurno = idTurno;
		this.nombreTurno = nombreTurno;
		this.asignaturas = asignaturas;
	}

	public String getIdTurno() {
		return idTurno;
	}

	public void setIdTurno(String idTurno) {
		this.idTurno = idTurno;
	}

	public String getNombreTurno() {
		return nombreTurno;
	}

	public void setNombreTurno(String nombreTurno) {
		this.nombreTurno = nombreTurno;
	}

	public Hashtable<String, Asignatura> getAsignaturas() {
		return asignaturas;
	}

	public void setAsignaturas(Hashtable<String, Asignatura> asignaturas) {
		this.asignaturas = asignaturas;
	}
	
	public void addAsignatura(Asignatura asignatura) {
		this.asignaturas.put(idTurno, asignatura);
	}
	
	public String toString() {
		return nombreTurno;
	}

}
