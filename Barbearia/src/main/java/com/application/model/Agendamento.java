package com.application.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Agendamento {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;	
	
	@ManyToOne
	@JoinColumn(name = "barbeiro_id")
	private Barbeiro barbeiro;
	private String horario;
	private String data;
	private String nomeCliente;
	private String telefoneCliente;
	private String status;	
	private String servico;
	private String formaDePagamento;
	private double valorServico;
	
	
	public Agendamento() {
		
	}
	
	public Agendamento(Barbeiro barbeiro, String horario, String data, String nomeCliente, String telefoneCliente,
			String status, String servico, String formaDePagamento, double valorServico) {
		this.barbeiro = barbeiro;
		this.horario = horario;
		this.data = data;
		this.nomeCliente = nomeCliente;
		this.telefoneCliente = telefoneCliente;
		this.status = status;
		this.servico = servico;
		this.formaDePagamento = formaDePagamento;
		this.valorServico = valorServico;
	}
 
	public Barbeiro getBarbeiro() {
		return barbeiro;
	}
 
	public void setBarbeiro(Barbeiro barbeiro) {
		this.barbeiro = barbeiro;
	}
 
	public String getHorario() {
		return horario;
	}
 
	public void setHorario(String horario) {
		this.horario = horario;
	}
 
	public String getData() {
		return data;
	}
 
	public void setData(String data) {
		this.data = data;
	}
 
	public String getNomeCliente() {
		return nomeCliente;
	}
 
	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}
 
	public String getTelefoneCliente() {
		return telefoneCliente;
	}
 
	public void setTelefoneCliente(String telefoneCliente) {
		this.telefoneCliente = telefoneCliente;
	}
 
	public String getStatus() {
		return status;
	}
 
	public void setStatus(String status) {
		this.status = status;
	}
 
	public String getServico() {
		return servico;
	}
 
	public void setServico(String servico) {
		this.servico = servico;
	}
 
	public String getFormaDePagamento() {
		return formaDePagamento;
	}
 
	public void setFormaDePagamento(String formaDePagamento) {
		this.formaDePagamento = formaDePagamento;
	}
 
	public double getValorServico() {
		return valorServico;
	}
 
	public void setValorServico(double valorServico) {
		this.valorServico = valorServico;
	}
	
	
	
	
	
 
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Agendamento [barbeiro=" + barbeiro + ", horario=" + horario + ", data=" + data + ", nomeCliente="
				+ nomeCliente + ", telefoneCliente=" + telefoneCliente + ", status=" + status + ", servico=" + servico
				+ ", formaDePagamento=" + formaDePagamento + ", valorServico=" + valorServico + "]";
	}
	
	
	
 
	
	

}
