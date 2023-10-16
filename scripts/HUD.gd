extends CanvasLayer

@onready var anim = $anim

func _ready():
	pass

func vitoria():
	anim.play("fadeOut")
	await anim.animation_finished
	if (Global.fase == 1):
		get_tree().change_scene_to_file("res://scenes/fase2.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/fase1.tscn")

func derrota():
	anim.play("fadeOut")
	await anim.animation_finished
	get_tree().reload_current_scene()
