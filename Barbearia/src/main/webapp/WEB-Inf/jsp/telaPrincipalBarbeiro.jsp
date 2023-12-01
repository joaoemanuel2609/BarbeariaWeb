<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.application.model.Agendamento, com.application.model.Barbeiro " %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/index.css">
<title>Login</title>
</head>
<header>
	<nav class="menu">
		<ul class="lista-links">
			<li class="link"><a href="/listarAgendamentos">Consultar agendamento</a></li>
			<li class="link"><a href="/agendarHorario">Agendar horario</a></li>
			<li class="link"><a href="/listarBarbeiros">Barbeiros</a></li>
			<li class="link"><a href="/historicoCaixa">Historico de caixa</a></li>
		</ul>
	</nav>
</header>
<%Barbeiro barbeiro = (Barbeiro)  session.getAttribute("barbeiro"); %>
<body>
<div class="titulo">
	<h2 class="sub-tit"  style="text-decoration:none;color: #fff;">Bem vindo <%=barbeiro.getNome() %> </h2>
</div>
<div class="conteudo-principal">
	<img src="imagens/logoAnder.png" alt="logoAnder" id="logoAnder">
</div>
</body>
</html>