extends Area2D

@onready var animSprite = $animSprite
@onready var colisao = $colisao

func _ready():
	Global.maxItens += 1

func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		colisao.queue_free()
		Global.addItem()
		animSprite.play("collect")
		await animSprite.animation_finished
		queue_free() # destruição do item
