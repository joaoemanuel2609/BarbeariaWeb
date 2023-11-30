<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Arquivo JavaScript do Bootstrap (necessário para recursos interativos) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/css/login.css">
<title>Login</title>
</head>
<body>
	<h2>Informe seu usuário e senha:</h2>
	<div id="section-principal">
		<img src="logoAnder.png" alt="logoAnder" class="logoP">
		<div id="section-logar">
			<form action="/autenticar" method="post">
				<p>Login:</p>
				<input type="text" name="login" required> <br>
				<br>
				<p>Senha:</p>
				<input type="text" name="senha" required> <br>
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