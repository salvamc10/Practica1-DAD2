package edu.ucam.pojos;

public class Asignatura {

	//Atributos de la clase Asignatura
	private String idAsignatura;
	private String nombreAsignatura;
	private boolean perteneceTurno = false;
	private String idTurno;

	//Constructor de la clase Asignatura
	public Asignatura(String idAsignatura, String nombreAsignatura) {
		this.idAsignatura = idAsignatura;
		this.nombreAsignatura = nombreAsignatura;
	}
	
	public Asignatura() {
		
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

	public boolean isPerteneceTurno() {
		return perteneceTurno;
	}

	public void setPerteneceTurno(boolean perteneceTurno) {
		this.perteneceTurno = perteneceTurno;
	}

	public String getIdTurno() {
		return idTurno;
	}

	public void setIdTurno(String idTurno) {
		this.idTurno = idTurno;
	}
}
