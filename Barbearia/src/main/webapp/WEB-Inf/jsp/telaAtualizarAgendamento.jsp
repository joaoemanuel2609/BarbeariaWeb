<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.application.model.Agendamento, com.application.model.Barbeiro " %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Atualizar agendamento</title>
</head>
<body>

	<%Agendamento agendamento = (Agendamento) request.getAttribute("agendamento"); %>
	<div class="formulario">
		<form action="/atualizarAgendamentoData" method="post">
		
			<input type="hidden" name="id"  value="<%= agendamento.getId()%>" >
			
			Nome:
			<input type="text" for="nome"  name="nomeCliente"  value="<%= agendamento.getNomeCliente()%>">
			<br><br>
			Telefone:
			<input type="text" for="telefone"  name="telefoneCliente"  value="<%= agendamento.getTelefoneCliente()%>">
			
			<div class="div-data">
				Data:
				<input type="date" for="data" required  name="data"  value="<%= agendamento.getData()%>"   >
				Horario:
				<input type="time" for="horario" required  name="horario"  value="<%= agendamento.getHorario()%>">
			</div>
			<br><br>
			<input type="submit" value="Atualizar">
		</form>
	</div>
</body>
</html>