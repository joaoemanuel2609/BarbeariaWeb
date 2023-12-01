<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/agendarHorario.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Karantina:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <img src="imagens/logoAnder.png" alt="logoAnder" class="logoP">
	<h2 style="color: #fff; font-size: 40px; font-weight: normal;">Informe seu usuario e senha:</h2>
	<div id="section-principal">
		<div id="section-logar">
			<form action="/autenticar" method="post">
				<p  style="color: #fff; font-size: 25px; font-weight: normal;">Login:</p>
				<input type="text" name="login" class="inputLogin" required> <br>
				<br>
				<p  style="color: #fff; font-size: 25px; font-weight: normal;">Senha:</p>
				<input type="password" name="senha" class="inputSenha" required> <br>
				<br>
				<button type="submit" class="btn btn-outline-secondary"
					id="botao-entrar">Entrar</button>
			</form>
		</div>
	</div>
	<%
	String erro = (String) request.getAttribute("error");
	if (erro != null) {
		if (erro.equals("1")) {
			out.println("<p class=erro> Usuário ou senha invalida </p>");
		}
		if (erro.equals("2")) {
			out.println("<p class=erro> Sessão Encerrada, faça login novamente </p>");
		}
	}
	%>
</body>
</html>