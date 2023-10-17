extends Area2D

@onready var animSprite = $animSprite
@onready var colisao = $colisao

# Somatório de tempo. Recebe um valor aleatório para diversificar o movimento.
@onready var time: float = randf_range(0, 10)

func _ready():
	Global.maxItens += 1

func _process(delta):
	time += delta
	# A função seno retorna valores suavizados de -1 a 1
	animSprite.position.y = sin(time * 4) * 4;

func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		colisao.queue_free()
		Global.addItem()
		animSprite.play("collect")
		await animSprite.animation_finished
		queue_free() # destruição do item
