package edu.ucam.pojos;

public class User {
	
	// Atributos de la clase User
	private String usuario;
	private String contrasena;
	
	// Constructor de la clase User
	public User(String usuario, String contrasena) {
		this.usuario = usuario;
		this.contrasena = contrasena;
	}

	// Métodos getter y setter
	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	
}
