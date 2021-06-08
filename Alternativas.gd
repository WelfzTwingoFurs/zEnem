extends Node2D

var selecionado = preload("res://Graficos/botaomarcado.png")
var botaoA = preload("res://Graficos/botaoA.png")
var botaoB = preload("res://Graficos/botaoB.png")
var botaoC = preload("res://Graficos/botaoC.png")
var botaoD = preload("res://Graficos/botaoD.png")
var botaoE = preload("res://Graficos/botaoE.png")

var respostacerto = preload("res://Graficos/respostaCerta.png")
var respostaErrada = preload("res://Graficos/respostaErrada.png")


var verResposta = 0
var selecao = null
var certo


onready var questao = get_tree().get_current_scene().get_name()

var salvaAqui

func _ready():
	salvaAqui = "res://Questoes/"
	salvaAqui += "certo"
	salvaAqui += str(questao)
	salvaAqui += ".save"
	load_level()
	
	selecaoAqui = "res://Questoes/Respostas/"
	selecaoAqui += "selecionada"
	selecaoAqui += str(questao)
	selecaoAqui += ".save"
	load_selection()

### Carregar alternativa certa! ###
func load_level():
	var save_file = File.new()
	save_file.open(str(salvaAqui), File.READ)
	certo = save_file.get_line()
	save_file.close()

### SALVAR SELEÇÃO ###
var selecaoAqui
func save_selection():
	var save_file = File.new()
	save_file.open(str(selecaoAqui), File.WRITE)
	save_file.store_line(str(selecao))
	save_file.close()

func load_selection():
	var save_file = File.new()
	save_file.open(str(selecaoAqui), File.READ)
	selecao = save_file.get_line()
	save_file.close()


func _on_A_pressed():
	if selecao != "a":   
		selecao = "a"
	elif selecao == "a": 
		selecao = null   

func _on_B_pressed():
	if selecao != "b":
		selecao = "b"
	elif selecao == "b":
		selecao = null

func _on_C_pressed():
	if selecao != "c":
		selecao = "c"
	elif selecao == "c":
		selecao = null

func _on_D_pressed():
	if selecao != "d":
		selecao = "d"
	elif selecao == "d":
		selecao = null

func _on_E_pressed():
	if selecao != "e":
		selecao = "e"
	elif selecao == "e":
		selecao = null

### Reconhecedores de alternativa ###
#"Função (Se apertar X):
##Se a seleção não for X:
### Marque a seleção como X
## Porém, se a seleção for X:
### Marque a seleção como nula(Desmarcar)"

func _on_RespostaBotao_pressed():
	if verResposta == 0:
		verResposta = 1
		$Resposta.visible = true
	elif verResposta == 1:
		verResposta = 0
		$Resposta.visible = false

### Graficos dos botões ###
#"Função (Processo constante):
##Se a seleção for X:
##Icone da alternativa X = (gráfico de selecionado)
##Icone da alternativa Y = (gráfico de não selecionado)
##Icone da alternativa Z = (gráfico de não selecionado)"

func _process(delta):
	save_selection()
	if selecao == str(certo):
		$RespostaIcone.texture = respostacerto
	elif selecao != str(certo):
		$RespostaIcone.texture = respostaErrada
	else:
		$RespostaIcone.texture = respostaErrada
	
	if selecao == "a":
		$A/A.icon = selecionado
		$B/B.icon = botaoB
		$C/C.icon = botaoC
		$D/D.icon = botaoD
		$E/E.icon = botaoE

	elif selecao == "b":
		$A/A.icon = botaoA
		$B/B.icon = selecionado
		$C/C.icon = botaoC
		$D/D.icon = botaoD
		$E/E.icon = botaoE

	elif selecao == "c":
		$A/A.icon = botaoA
		$B/B.icon = botaoB
		$C/C.icon = selecionado
		$D/D.icon = botaoD
		$E/E.icon = botaoE

	elif selecao == "d":
		$A/A.icon = botaoA
		$B/B.icon = botaoB
		$C/C.icon = botaoC
		$D/D.icon = selecionado
		$E/E.icon = botaoE

	elif selecao == "e":
		$A/A.icon = botaoA
		$B/B.icon = botaoB
		$C/C.icon = botaoC
		$D/D.icon = botaoD
		$E/E.icon = selecionado

### Se não estiver nenhuma selecionada ###
	elif selecao == null:
		$A/A.icon = botaoA
		$B/B.icon = botaoB
		$C/C.icon = botaoC
		$D/D.icon = botaoD
		$E/E.icon = botaoE
	else:
		$A/A.icon = botaoA
		$B/B.icon = botaoB
		$C/C.icon = botaoC
		$D/D.icon = botaoD
		$E/E.icon = botaoE