package edu.ucam.pojos;

import java.util.Hashtable;

public class Convocatoria {

	// Atributos de la clase Convocatoria
	private String idConvocatoria;
	private String nombreConvocatoria;
	private Hashtable<String, Turno> turnos;
	
	public Convocatoria(String idConvocatoria, String nombreConvocatoria) {
		this.idConvocatoria = idConvocatoria;
		this.nombreConvocatoria = nombreConvocatoria;
		this.turnos = new Hashtable<String, Turno>();
	}

	public String getIdConvocatoria() {
		return idConvocatoria;
	}

	public void setIdConvocatoria(String idConvocatoria) {
		this.idConvocatoria = idConvocatoria;
	}

	public String getNombreConvocatoria() {
		return nombreConvocatoria;
	}

	public void setNombreConvocatoria(String nombreConvocatoria) {
		this.nombreConvocatoria = nombreConvocatoria;
	}

	public Hashtable<String, Turno> getTurnos() {
		return turnos;
	}

	public void setTurnos(Hashtable<String, Turno> turnos) {
		this.turnos = turnos;
	}
	
	public void addTurno(Turno turno) {
		this.turnos.put(idConvocatoria, turno);
	}
	
	public String toString() {
        return nombreConvocatoria;
	}
}
