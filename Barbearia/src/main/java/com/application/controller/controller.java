package com.application.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.application.dao.agendamentoRepository;
import com.application.dao.barbeiroRepository;
import com.application.model.Agendamento;
import com.application.model.Barbeiro;

import jakarta.servlet.http.HttpSession;

@Controller
public class controller {
	@Autowired
	private barbeiroRepository barbeiroRepository;

	@Autowired
	private agendamentoRepository agendamentoRepository;

	private Object agendamentoService;
	
	@GetMapping("/telaPrincipal")
	public String telaPrincipal() {
		return "telaPrincipalAnder";
	}

	@GetMapping("/telaIndex")
	public String telaIndex() {
		return "index";
	}

	@GetMapping("/")
	public String logar() {
		return "telaLogin";
	}

	@PostMapping("/autenticar")
	public String autenticar(@RequestParam("login") String login, @RequestParam("senha") String senha,
			HttpSession session, Model model) {
		
		Barbeiro barbeiro = barbeiroRepository.findByLogin(login);

		if (barbeiro != null) {
			
			if (barbeiro.getLogin().equals(login) && barbeiro.getSenha().equals(senha)) {
				
				if(barbeiro.getNome().equals("Ander") && barbeiro.getSenha().equals("123")) {
					session.setAttribute("barbeiro", barbeiro);
					return "telaPrincipalAnder";
				}else {
					session.setAttribute("barbeiro", barbeiro);
					return "telaPrincipalBarbeiros";
				}
				
			}else {

				model.addAttribute("error", "1");
				return "telaLogin";

			}

		} else {

			model.addAttribute("error", "1");
			return "telaLogin";

		}

	}

	@GetMapping("/agendarHorario")
	public String agendar() {
		
		return "telaAgendarHorarios";
	}
	@GetMapping("/agendamentosBarbeiro")
	public String Agentamentos() {
		
		return "redirect:/agendamentosPendentesPorBarbeiro";
	}


	@PostMapping("/adicionarAgendamento")
	public String agendarHorarios(Agendamento agendamento, HttpSession session) {

		Barbeiro barbeiro = (Barbeiro) session.getAttribute("barbeiro");

		agendamento.setBarbeiro(barbeiro);
		agendamento.setStatus("Agendado");
		agendamento.setServico("");
		agendamento.setFormaDePagamento("");
		agendamento.setValorServico(0);
		agendamentoRepository.save(agendamento);
		
		if(barbeiro.getLogin().equals("ander") && barbeiro.getSenha().equals("123")) {
			return "telaPrincipalAnder";
		}else {
			return "telaPrincipalBarbeiros";
		}
		
	}

	@GetMapping("/agendamentosPendentes")
	public String listarPendentes(Model model, HttpSession session) {
		
		
		Barbeiro barbeiro = (Barbeiro) session.getAttribute("barbeiro");
		List<Agendamento> listaAgendados = agendamentoRepository.findByStatus("Agendado");			
		List<Barbeiro> listaBarbeiros = barbeiroRepository.findAll();
		model.addAttribute("listaAgendamentos" , listaAgendados);		
		model.addAttribute("listaBarbeiros", listaBarbeiros);
		
		return "telaAgendamentosAnder";
//		if(barbeiro.getLogin().equals("ander") && barbeiro.getSenha().equals("123")) {
//			return "telaAgendamentosAnder";
//		}else {
//			return "telaAgendamentosBarbeiro";
//		}



	}

	
	@GetMapping("/finalizarAgendamento")
	public String finalizarAgendamento(@RequestParam("id") String id, Model model) {

		Optional<Agendamento> agendamento = agendamentoRepository.findById(Integer.parseInt(id));

		model.addAttribute("agendamento", agendamento.get());

		return "telaFinalizarAgendamento";

	}
	



	
	@PostMapping("/concluirAgendamento")
	public String concluirAgendamento(Agendamento agendamento, Model model, HttpSession session) {

		
		Barbeiro barbeiro = (Barbeiro) session.getAttribute("barbeiro");
		
		agendamento.setBarbeiro(barbeiro);		
		agendamento.setStatus("Concluido");
		agendamentoRepository.save(agendamento);
		
		if(barbeiro.getLogin().equals("ander") && barbeiro.getSenha().equals("123")) {
			return "telaPrincipalAnder";
		}else {
			return "telaPrincipalBarbeiros";
		}

	}
	
	@GetMapping("/deletarAgendamento")
	public String DeletarAgendamento(Agendamento agendamento, Model model, HttpSession session) {

		
		Barbeiro barbeiro = (Barbeiro) session.getAttribute("barbeiro");
		
		
		agendamento.setStatus("Excluido");
		agendamentoRepository.save(agendamento);
		
		if(barbeiro.getLogin().equals("ander") && barbeiro.getSenha().equals("123")) {
			return "telaPrincipalAnder";
		}else {
			return "telaPrincipalBarbeiros";
		}
		}
///////////
	
	
	


	@GetMapping("/listarBarbeiros")
	public String listarBarbeiros(Model model) {

		List<Barbeiro> listaBarbeiros = barbeiroRepository.findAll();

		for (Barbeiro barbeiro : listaBarbeiros) {
			System.out.println(barbeiro);
		}
		model.addAttribute("listaBarbeiros", listaBarbeiros);

		return "telaBarbeiros";

	}
	

	@GetMapping("/listarAgendamentos")
	public String listarAgendamentos(Model model, HttpSession session) {
		
		
		Barbeiro barbeiro = (Barbeiro) session.getAttribute("barbeiro");
		List<Agendamento> listaAgendados = agendamentoRepository.findByStatus("Agendado");			
		List<Barbeiro> listaBarbeiros = barbeiroRepository.findAll();
		model.addAttribute("listaAgendamentos" , listaAgendados);		
		model.addAttribute("listaBarbeiros", listaBarbeiros);
		if(barbeiro.getLogin().equals("ander") && barbeiro.getSenha().equals("123")) {
			return "telaAgendamentosAnder";
		}else {
			return "telaAgendamentosBarbeiro";
		}
	}

	@GetMapping("/listarConcluidas")
	public String listarConcluidas(Model model) {

		List<Agendamento> listaConcluidass = agendamentoRepository.findByStatus("concluido");
		model.addAttribute("listaAgendados" , listaConcluidass);
		return "listaAgendados";
		

	}
	@GetMapping("/atualizarAgendamento")
	public String atualizar(@RequestParam("id") String id, Model model, HttpSession session) {
		Barbeiro barbeiro = (Barbeiro) session.getAttribute("barbeiro");

		System.out.println(barbeiro);
		
		Optional<Agendamento> agendamento = agendamentoRepository.findById(Integer.parseInt(id));

		model.addAttribute("agendamento", agendamento.get());
		
	
		return "telaAtualizarAgendamento";
	

	}
	
	
	@PostMapping("/atualizarAgendamentoData")
	public String atualizarAgendamento(Agendamento agendamento, Model model, HttpSession session){
		
		Barbeiro barbeiro = (Barbeiro) session.getAttribute("barbeiro");

		agendamento.setBarbeiro(barbeiro);
		agendamento.setStatus("Agendado");
		
		agendamentoRepository.save(agendamento);
		List<Agendamento> listaAgendados = agendamentoRepository.findByStatus("Agendado");			
		List<Barbeiro> listaBarbeiros = barbeiroRepository.findAll();
		model.addAttribute("listaAgendamentos" , listaAgendados);		
		model.addAttribute("listaBarbeiros", listaBarbeiros);
		
			
		if(barbeiro.getNome().equals("Ander") && barbeiro.getSenha().equals("123")) {
			session.setAttribute("barbeiro", barbeiro);
			return "telaAgendamentosAnder";
		}else {
			session.setAttribute("barbeiro", barbeiro);
			return "telaPrincipalBarbeiros";
		}
		
		
		

		
	}
	@GetMapping("/listarAgendamentosNomeCliente")
	public String listarPendentesPorCliente(@RequestParam("nomeCliente") String nomeCliente, Model model) {
		
		List<Agendamento> listaAgendados = agendamentoRepository.findBynomeClienteContaining(nomeCliente);
	    model.addAttribute("listaAgendamentos", listaAgendados);
	    List<Barbeiro> listaBarbeiros = barbeiroRepository.findAll();
	    model.addAttribute("listaBarbeiros", listaBarbeiros);

        return "telaAgendamentosAnder";
	}
	
	@GetMapping("/agendamentosPendentesPorBarbeiro")
	public String listarPendentesPorBarbeiro(@RequestParam("id") String barbeiroId, Model model, HttpSession session) {
	    Integer barbeiroIdI = Integer.parseInt(barbeiroId);
	    List<Agendamento> listaAgendados = agendamentoRepository.findByStatusAndBarbeiroId("Agendado", barbeiroIdI);
	    Barbeiro barbeiro = (Barbeiro) session.getAttribute("barbeiro");
	    Barbeiro barbeiroNome = barbeiroRepository.findById(barbeiroIdI).orElse(null); 
	    
	    if(barbeiroNome != null) {
		    model.addAttribute("nomeBarbeiro", barbeiroNome.getNome());
	    }else {
	    	model.addAttribute("nomeBarbeiro", null);
	    }
	    

	    
	    List<Barbeiro> listaBarbeiros = barbeiroRepository.findAll();

	  
	    model.addAttribute("listaAgendamentos", listaAgendados);
	    model.addAttribute("listaBarbeiros", listaBarbeiros);

	    if(barbeiro.getLogin().equals("ander") && barbeiro.getSenha().equals("123")) {
			return "telaAgendamentosAnder";
		}else {
			return "telaAgendamentosBarbeiro";
		}
        //return "telaAgendamentosBarbeiro";

	}
	@GetMapping("/historicoCaixa")
	public String mostrarHistoricoCaixa(Model model) {
		List<Agendamento> agendamentos = agendamentoRepository.findByStatus("Concluido");
		model.addAttribute("listaAgendamentos",agendamentos);
		return "telaHistoricoCaixa";
	}
	
	@PostMapping("/filtrarHistoricoCaixa")
	public String filtrarHistoricoCaixa(@RequestParam("data")@DateTimeFormat(pattern = "yyyy-MM-dd")Data data, Model model) {
		SimpleDateFormat formato = new SimpleDateFormat("yyyy/MM/dd");
        String dataFormatada = formato.format(data);
		List<Agendamento> agendamento = agendamentoRepository.findByData(dataFormatada);
		model.addAttribute("listaAgendamentos",agendamento);
		return "telaHistoricoCaixa";
	}


	}

