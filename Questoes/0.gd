extends Node2D

onready var questaoAgora = Global.questaoAgora
onready var questao = get_tree().get_current_scene().get_name()
export var certo = "a"
var selecionada
var salvaAqui

func _ready():
	salvaAqui = "res://Questoes/"
	salvaAqui += "certo"
	salvaAqui += str(questao)
	salvaAqui += ".save"
	save_level()
	save_level()
	save_level()

func save_level():
	var save_file = File.new()
	save_file.open(str(salvaAqui), File.WRITE)
	save_file.store_line(certo)
	save_file.close()
	print(certo)

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