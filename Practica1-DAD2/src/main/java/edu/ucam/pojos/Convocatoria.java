package edu.ucam.pojos;

import java.util.Hashtable;

public class Convocatoria {

	// Atributos de la clase Convocatoria
	private String idConvocatoria;
	private String nombreConvocatoria;
	
	public Convocatoria(String idConvocatoria, String nombreConvocatoria) {
		this.idConvocatoria = idConvocatoria;
		this.nombreConvocatoria = nombreConvocatoria;
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
	
}
