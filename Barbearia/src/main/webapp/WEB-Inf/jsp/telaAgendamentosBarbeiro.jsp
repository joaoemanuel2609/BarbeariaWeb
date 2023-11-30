
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.application.model.Agendamento, com.application.model.Barbeiro " %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/index.css">
<script type="text/javascript" src="js/index.js"></script>
<meta charset="ISO-8859-1">
<title>Agendamentos</title>
</head>
<body>
<% 
List<Barbeiro> listaBarbeiros = (List<Barbeiro>) request.getAttribute("listaBarbeiros");
List<Agendamento> listaAgendamentos = (List<Agendamento>) request.getAttribute("listaAgendamentos"); %>
<header>
	<nav class="menu">
		<ul class="lista-links">
			<li class="link"><a href="/agendamentosPendentes">Consultar agendamento</a></li>
			<li class="link"><a href="/agendarHorario">Agendar horario</a></li>
		
		</ul>
	</nav>
</header>
<div class="conteudo-principal-agendamentos">
	<div class="titulo">
		<h2 id="sub-tit">CONSULTAR AGENDAMENTOS</h2>
	</div>
	
	<div class="menu-filtros">
		<label>Filtrar por:</label>
		
		
		<input type="text" value="Nome cliente" id="btn-nomeCLiente" class="filtro">
	</div>
	<button type="submit" class="btn btn-outline-secondary"
					id="botao-filtrar">Filtrar</button>
	<table border="1">
	
		<tr class="head-lista-agendamentos"> 
				
			<th> Barbeiro </th>
			<th> Nome </th>
			<th> Telefone </th>
			<th> Data </th>
			<th> Horario </th>	
			<th> Status </th>			
			<th> Atualizar </th>
			<th> Finalizar </th>
		
		</tr>   
		
		<%  if (listaAgendamentos != null) {
				for (Agendamento agendamento : listaAgendamentos) { %>
			<tr class="body-lista-agendamentos">	
				
				<td> <%= agendamento.getBarbeiro().getNome() %></td>
				<td> <%= agendamento.getNomeCliente() %>   </td>
				<td> <%= agendamento.getTelefoneCliente()  %>   </td>
				<td> <%= agendamento.getData() %>   </td>
				<td> <%= agendamento.getHorario()%>   </td>
				<td> <%= agendamento.getStatus()%>   </td>
				<td> <a class="icones" href="/atualizarAgendamento?id=<%= agendamento.getId() %>">Atualizar</a></td>
				<td> <a class="icones" href="/finalizarAgendamento?id=<%= agendamento.getId() %>">Finalizar</a></td>
				<td> <a class="icones" href="/deletarAgendamento?id=<%= agendamento.getId() %>">Deletar</a></td>
				
			</tr>
			<% } }%>
	</table>
</div>

</body>
</html>