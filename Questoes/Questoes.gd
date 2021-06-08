extends Node2D

#onready var questaoAgora = Global.questaoAgora
onready var questao = get_tree().get_current_scene().get_name()
export var certo = "a"
var selecionada
var salvaAqui

var enderecoProximaQuestao
var enderecoAnteriorQuestao

func _ready():
	$Numero.text = str(questao)
	
	salvaAqui = "res://Questoes/"
	salvaAqui += "certo"
	salvaAqui += str(questao)
	salvaAqui += ".save"
	save_level()
	
	selecaoAqui = "res://Questoes/Respostas/"
	selecaoAqui += "selecionada"
	selecaoAqui += str(questao)
	selecaoAqui += ".save"
	load_selection()

### Salvar alternativa certa! ###
func save_level():
	var save_file = File.new()
	save_file.open(str(salvaAqui), File.WRITE)
	save_file.store_line(certo)
	save_file.close()


### CARREGAR SELEÇÃO ###
var selecaoAqui
func load_selection():
	var save_file = File.new()
	save_file.open(str(selecaoAqui), File.READ)
	selecionada = save_file.get_line()
	save_file.close()


func _on_A_toggled(button_pressed):
	selecionada = "a"

func _on_B_toggled(button_pressed):
	selecionada = "b"

func _on_C_toggled(button_pressed):
	selecionada = "c"

func _on_D_toggled(button_pressed):
	selecionada = "d"

func _on_E_toggled(button_pressed):
	selecionada = "e"

var ProximaQuestao
func _on_Proxima_pressed():
	ProximaQuestao = int(questao) + 1
	var ProximaQuestao2 = str(ProximaQuestao)
	enderecoProximaQuestao = "res://Questoes/"
	enderecoProximaQuestao += ProximaQuestao2
	enderecoProximaQuestao += ".tscn"
	print(enderecoProximaQuestao)
	get_tree().change_scene(enderecoProximaQuestao)

func _on_Anterior_pressed():
	ProximaQuestao = int(questao) - 1
	var ProximaQuestao2 = str(ProximaQuestao)
	enderecoAnteriorQuestao = "res://Questoes/"
	enderecoAnteriorQuestao += ProximaQuestao2
	enderecoAnteriorQuestao += ".tscn"
	get_tree().change_scene(enderecoAnteriorQuestao)
