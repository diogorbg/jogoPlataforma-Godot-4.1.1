extends Area2D

@onready var animSprite = $animSprite
@onready var colisao = $colisao

func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		colisao.process_mode = Node.PROCESS_MODE_DISABLED # Não colide mais
		Global.addItem()
		animSprite.play("collect")
		await animSprite.animation_finished
		queue_free() # destruição do item
