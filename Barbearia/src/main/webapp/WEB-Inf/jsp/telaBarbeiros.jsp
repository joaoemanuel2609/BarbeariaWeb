<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.List, com.application.model.Agendamento, com.application.model.Barbeiro "%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/index.css">
<meta charset="ISO-8859-1">
<title>Barbeiros</title>
</head>
<body>
<header>

	<nav class="menu">
		<ul class="lista-links">
			<li class="link"><a href="/listarAgendamentos" style="text-decoration:none;color: #fff;">Consultar agendamento</a></li>
			<li class="link"><a href="/agendarHorario" style="text-decoration:none;color: #fff;">Agendar horario</a></li>
			<li class="link"><a href="/listarBarbeiros" style="text-decoration:none;color: #fff;">Barbeiros</a></li>
			<li class="link"><a href="/historicoCaixa" style="text-decoration:none;color: #fff;">Historico de caixa</a></li>
		</ul>
	</nav>
</header>


	<%
	List<Barbeiro> listaBarbeiros = (List<Barbeiro>) request.getAttribute("listaBarbeiros");
	%>
	<%if (listaBarbeiros != null) { %>
		<%for(Barbeiro b : listaBarbeiros)  {%>
			<div class="container-barbeiro">
				<h2 class="nome-barber"><%=b.getNome()%></h2>
				<p class="login-barber"><%=b.getLogin()%></p>
				<p class="senha-barber"><%=b.getSenha()%></p>
			</div>
		<%} %>
	<%} else{ %>
		<h1>NENHUM BAREB</h1>
	<%} %>
	
</body>
</html>