
function redirecionarParaAgendamentos() {
	
	var select = document.getElementById("barber-name");
	var selectedOption = select.options[select.selectedIndex];
	var barbeiroId = selectedOption.getAttribute("data-barbeiro-id");

	// Redirecionar para a página desejada com o ID do barbeiro como parâmetro
	window.location.href = "/agendamentosPendentesPorBarbeiro?id=" + barbeiroId;
}    
