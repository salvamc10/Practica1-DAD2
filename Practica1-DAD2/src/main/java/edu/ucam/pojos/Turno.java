package edu.ucam.pojos;

import java.util.Hashtable;

public class Turno {
	
	private String idTurno;
	private String nombreTurno;
	private String idConvocatoria;
	private Hashtable<String, Asignatura> asignaturas;
	
	public Turno() {

	}
	
	public Turno(String idTurno, String nombreTurno) {
		this.idTurno = idTurno;
		this.nombreTurno = nombreTurno;
		this.asignaturas = new Hashtable<String, Asignatura>();
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

	public String getIdConvocatoria() {
		return idConvocatoria;
	}

	public void setIdConvocatoria(String idConvocatoria) {
		this.idConvocatoria = idConvocatoria;
	}

	public void setAsignaturas(Hashtable<String, Asignatura> asignaturas) {
		this.asignaturas = asignaturas;
	}
	
	public void addAsignatura(String idAsignatura, Asignatura asignatura) {
		this.asignaturas.put(idAsignatura, asignatura);
	}
	
	public String toString() {
		return nombreTurno;
	}
}
