extends Area2D

@onready var dialog = $dialog as MarginContainer
@onready var label = %label as Label

@export_multiline var fala: String

func _ready():
	dialog.hide()
	label.text = fala

func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		dialog.show()

func _on_body_exited(body):
	if body.is_in_group("player"):
		dialog.hide()
