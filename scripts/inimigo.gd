extends CharacterBody2D

const SPEED = 50.0

@onready var animSprite = $animSprite as AnimatedSprite2D
@onready var rayCast = $rayCast as RayCast2D
@onready var particulas = $particulas as CPUParticles2D

@onready var direction: float = -1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if rayCast.is_colliding():
		rayCast.target_position *= -1
		direction *= -1
		animSprite.flip_h = !animSprite.flip_h

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func addHit(_dano: int):
	set_physics_process(false)
	animSprite.play("die")
	particulas.restart()
	await animSprite.animation_finished
	queue_free()
