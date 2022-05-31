package com.DTO;

public class LoginDTO {
	/*
	 * Armazena os dados de login do usuário
	 * Transporta os dados entre os elementos do sistema
	 */
	
	//Atributos
	private String name;
	private String email;
	private String password;
	
	//Auxiliares
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}

