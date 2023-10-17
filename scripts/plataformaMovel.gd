extends Node2D

@onready var line = $line as Line2D
@onready var plataforma = $plataforma as StaticBody2D

@export var velocidade: int = 48

func _ready():
	var dist = line.points[0].distance_to(line.points[1])
	var t = dist / float(velocidade)
	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_loops()
	tween.tween_property(plataforma, "position", line.points[1], t).set_delay(1)
	tween.tween_property(plataforma, "position", line.points[0], t).set_delay(1)
