extends CanvasLayer

@onready var anim = $anim
@onready var hSlider = $hSlider

func _ready():
	pass

func _process(_delta):
	hSlider.value = float(Global.itens) / float(Global.maxItens) * 100

func vitoria():
	anim.play("fadeOut")
	await anim.animation_finished
	if (Global.fase == 1):
		get_tree().change_scene_to_file("res://scenes/fase2.tscn")
	elif Global.fase == 2:
		get_tree().change_scene_to_file("res://scenes/fase3.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/fase1.tscn")

func derrota():
	anim.play("fadeOut")
	await anim.animation_finished
	get_tree().reload_current_scene()
