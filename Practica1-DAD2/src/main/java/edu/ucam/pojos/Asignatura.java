package edu.ucam.pojos;

public class Asignatura {

	//Atributos de la clase Asignatura
	private String idAsignatura;
	private String nombreAsignatura;

	//Constructor de la clase Asignatura
	public Asignatura(String idAsignatura, String nombreAsignatura) {
		this.idAsignatura = idAsignatura;
		this.nombreAsignatura = nombreAsignatura;
	}

	//Métodos getters y setters
	public String getIdAsignatura() {
		return idAsignatura;
	}

	public void setIdAsignatura(String idAsignatura) {
		this.idAsignatura = idAsignatura;
	}

	public String getNombreAsignatura() {
		return nombreAsignatura;
	}

	public void setNombreAsignatura(String nombreAsignatura) {
		this.nombreAsignatura = nombreAsignatura;
	}
	
}
