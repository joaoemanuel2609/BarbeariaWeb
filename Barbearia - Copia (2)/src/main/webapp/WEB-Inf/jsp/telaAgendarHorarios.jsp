<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.application.model.Barbeiro" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Karantina:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/agendarHorario.css">
<meta charset="ISO-8859-1">
<title>Agende seu horario</title>
</head>
<%Barbeiro barbeiro = (Barbeiro)  session.getAttribute("barbeiro"); %>
<header>

</header>
<body>
<div class="titulo">
	<h2 class="sub-tit">AGENDAR HORARIO</h2>
</div>
<div class="conteudo-principal-agendar">
	<div class="espacador"></div>
	<div class="formulario">
		<form action="/adicionarAgendamento" method="post">
			<div class="tituloInput">Nome:</div>
			<input type="text"required  name="nomeCliente" style="cursor: pointer; border-radius: 6px; border: none; height: 20px; width: 250px; outline: none;">
			<br><br>
			<div class="tituloInput">Telefone:</div>
			<input type="text" required name="telefoneCliente" style="cursor: pointer; border-radius: 6px; border: none; height: 20px; width: 250px; outline: none;">
			<div class="div-data">
				<div class="tituloInput">Data:</div>
				<input type="date" required class="inputData" name="data">
				<div class="tituloInput">Horario:</div>
				<input type="time" required class="inputHorario" name="horario">
			</div>
			<input type="submit" class="inputConfirmar" value="CONFIRMAR">
		</form>
	</div>
	<div class="espacador"></div>
</div>
</body>
</html>