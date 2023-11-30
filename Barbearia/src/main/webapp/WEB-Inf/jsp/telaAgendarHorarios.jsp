<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.application.model.Barbeiro" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/index.css">
<meta charset="ISO-8859-1">
<title>Agende seu horario</title>
</head>
<header>
<nav class="menu">
	
</nav>
</header>
<body>
<%Barbeiro barbeiro = (Barbeiro)  session.getAttribute("barbeiro"); %>
<div class="titulo">
	<h2 class="sub-tit">AGENDAR HORÁRIO</h2>
</div>
<div class="conteudo-principal-agendar">
	<div class="formulario">
		<form action="/adicionarAgendamento" method="post">
		Nome:
		<input type="text"required value="nome do cliente" name="nomeCliente">
		<br><br>
		Telefone:
		<input type="text"required value="telefone cliente" name="telefoneCliente">
			<div class="div-data">
				Data:
				<input type="date"required  name="data">
				Horario:
				<input type="time" required  name="horario">
			</div>
			<input type="submit" value="Confirmar ">
		</form>
	</div>
</div>
</body>
</html>