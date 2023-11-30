<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.application.model.Agendamento, com.application.model.Barbeiro " %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Historico de caixa</title>
<link rel="stylesheet" type="text/css" href="/css/telaHistoricoCaixa.css">
</head>
<body>
<%List<Agendamento> listaAgendamentos = (List<Agendamento>) request.getAttribute("listaAgendamentos"); 
 %>
    <br>
    <h2> Histórico de Caixa</h2>
    <br>
    <br>
     <form:form method="post" action="/filtrarHistoricoCaixa">
        <label for="data">Filtrar por Data:</label>
        <input type="date" id="data" name="data" required>
        <input type="submit" value="Filtrar">
    </form:form>

    <table border="1">
        <tr>
            <th>Nome do Barbeiro</th>
            <th>Nome do Cliente</th>
            <th>Telefone</th>
            <th>Data</th>
            <th>Horário</th>
            <th>Valor</th>
            <th>Forma de Pagamento</th>
            <th>Serviço Realizado</th>
        </tr>
            <%  if (listaAgendamentos != null) {
				for (Agendamento agendamento : listaAgendamentos) { %>
			<tr class="body-lista-agendamentos">	
				
				<td> <%= agendamento.getBarbeiro().getNome() %></td>
				<td> <%= agendamento.getNomeCliente() %>   </td>
				<td> <%= agendamento.getTelefoneCliente()  %>   </td>
				<td> <%= agendamento.getData() %>   </td>
				<td> <%= agendamento.getHorario()%>   </td>
				<td> <%= agendamento.getValorServico()%>   </td>
				<td> <%= agendamento.getFormaDePagamento()%>   </td>
				<td> <%= agendamento.getServico()%>   </td>
				<td> <a class="icones" href="/atualizarAgendamento?id=<%= agendamento.getId() %>">Atualizar</a></td>
				<td> <a class="icones" href="/finalizarAgendamento?id=<%= agendamento.getId() %>">Finalizar</a></td>
				<td> <a class="icones" href="/deletarAgendamento?id=<%= agendamento.getId() %>">Deletar</a></td>
				
			</tr>
			<% } }%>
    </table>
</body>
</html>