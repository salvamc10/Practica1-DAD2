package edu.ucam.pojos;

public class Convocatoria {

	private String id;
	private String asignatura;
	private String turno;
	
	public Convocatoria(String id, String asignatura, String turno) {
		this.id = id;
		this.asignatura = asignatura;
		this.turno = turno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAsignatura() {
		return asignatura;
	}

	public void setAsignatura(String asignatura) {
		this.asignatura = asignatura;
	}

	public String getTurno() {
		return turno;
	}

	public void setTurno(String turno) {
		this.turno = turno;
	}

}
