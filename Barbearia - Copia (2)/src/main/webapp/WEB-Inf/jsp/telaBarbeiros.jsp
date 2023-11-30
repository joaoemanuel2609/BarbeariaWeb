<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.List, com.application.model.Agendamento, com.application.model.Barbeiro "%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/agendarHorario.css">
<meta charset="ISO-8859-1">
<title>Barbeiros</title>
</head>
<body>
<header>
<nav class="menu">
	<ul class="lista-links">
		<li class="link"><a href="/listarAgendamentos" style="text-decoration:none; color: #fff;">Consultar agendamento</a></li>
		<li class="link"><a href="/agendarHorario" style="text-decoration:none; color: #fff;">Agendar horario</a></li>
		<li class="link"><a href="/listarBarbeiros" style="text-decoration:none; color: #fff;">Barbeiros</a></li>
		<li class="link"><a href="/historicoCaixa" style="text-decoration:none; color: #fff;">Historico de caixa</a></li>
	</ul>
</nav>
</header>

	<%
	List<Barbeiro> listaBarbeiros = (List<Barbeiro>) request.getAttribute("listaBarbeiros");
	%>

	<table border="1">

		<tr>
			<th>Nome</th>
			<th>Login</th>
			<th>Senha</th>
		</tr>

		<%
		if (listaBarbeiros != null) {
			for (Barbeiro barbeiro : listaBarbeiros) {
		%>
		<tr>

			<td><%=barbeiro.getNome()%></td>
			<td><%=barbeiro.getLogin()%></td>
			<td><%=barbeiro.getSenha()%></td>

			<td><a href="/Atualizar?id=<%=barbeiro.getId()%>">
					Atualizar</a></td>

			<td><a href="/Deletar?id=<%=barbeiro.getId()%>">Deletar
					barbeiro</a></td>

		</tr>
		<%
			}
		}
		%> 





	</table>



</body>
</html>