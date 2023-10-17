extends Node2D

@export var fase: int = 1

# Resetar deve ser a primeira coisa a ser feita, antes que a fase esteja carregada
func _init():
	Global.reset()

# Só podemos repassar o valor da fase no evento _ready()
func _ready():
	Global.fase = fase
