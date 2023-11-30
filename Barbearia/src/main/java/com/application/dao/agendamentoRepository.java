package com.application.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.application.model.Agendamento;

public interface agendamentoRepository extends JpaRepository<Agendamento, Integer>{
	
	
	List<Agendamento> findByStatus(String status);	
	List<Agendamento> findBynomeClienteContaining(String nome);
	List<Agendamento> findByStatusAndBarbeiroId(String string, Integer id);
	List<Agendamento> findByData(String dataFormatada);

	
	
	


}
