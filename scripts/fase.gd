extends Node2D

@export var fase: int = 1

func _init():
	Global.reset()

func _ready():
	Global.fase = fase
