package com.application.model;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Barbeiro {	 
	 
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer id;
		private String nome;
		private String login;
		private String senha;
		
		public Barbeiro() {
			
		}
		
		
		public Barbeiro(Integer id, String nome, String login, String senha) {
			this.id = id;
			this.nome = nome;
			this.login = login;
			this.senha = senha;
		}
	 
	 
		public Integer getId() {
			return id;
		}
	 
	 
		public void setId(Integer id) {
			this.id = id;
		}
	 
	 
		public String getNome() {
			return nome;
		}
	 
	 
		public void setNome(String nome) {
			this.nome = nome;
		}
	 
	 
		public String getLogin() {
			return login;
		}
	 
	 
		public void setLogin(String login) {
			this.login = login;
		}
	 
	 
		public String getSenha() {
			return senha;
		}
	 
	 
		public void setSenha(String senha) {
			this.senha = senha;
		}
	 
	 
		@Override
		public String toString() {
			return "Barbeiro [id=" + id + ", nome=" + nome + ", login=" + login + ", senha=" + senha + "]";
		}				
	
}

