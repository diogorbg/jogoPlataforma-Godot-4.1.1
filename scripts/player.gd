extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -320.0

var pontos: int = 0

@onready var animSprite = $animSprite as AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var puloDuplo: bool = false

func _physics_process(delta):
	# Add the gravity.
	if is_on_floor():
		puloDuplo = true
	else:
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if is_on_floor():
		if velocity.x == 0:
			animSprite.play("idle")
		else:
			animSprite.play("move")
	else:
		if velocity.y > 0:
			animSprite.play("fall")

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and (puloDuplo || is_on_floor()):
		if is_on_floor():
			puloDuplo = true
			animSprite.play("jump")
		else:
			puloDuplo = false
			animSprite.play("doubleJump")
		velocity.y = JUMP_VELOCITY
	
	if velocity.x != 0:
		animSprite.flip_h = true if velocity.x<0 else false
	
	move_and_slide()
