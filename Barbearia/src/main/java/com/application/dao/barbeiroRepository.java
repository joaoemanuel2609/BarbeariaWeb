package com.application.dao;
 
import org.springframework.data.jpa.repository.JpaRepository;

import com.application.model.Barbeiro;
 
public interface barbeiroRepository extends JpaRepository<Barbeiro, Integer>{
	

	Barbeiro findByLogin(String login);
 
}