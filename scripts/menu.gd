extends Control

@onready var butJogar = $butJogar

func _ready():
	butJogar.grab_focus()

func _on_butJogar_pressed():
	get_tree().change_scene_to_file("res://scenes/fase1.tscn")


func _on_butSair_pressed():
	get_tree().quit()
